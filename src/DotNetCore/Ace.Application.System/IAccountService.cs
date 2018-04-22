using Ace.Application;
using Ace.Application.Common;
using Ace.Entity;
using Ace.Entity.System;
using Ace.Exceptions;
using Ace.Security;
using Chloe;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ace.Application.System
{
    public interface IAccountService : IAppService
    {
        /// <summary>
        /// 
        /// </summary>
        /// <param name="userName"></param>
        /// <param name="password">经过md5加密后的密码</param>
        /// <param name="user"></param>
        /// <param name="msg"></param>
        /// <returns></returns>
        bool CheckLogin(string userName, string password, out Sys_User user, out string msg);
        /// <summary>
        /// 
        /// </summary>
        /// <param name="oldPassword">明文</param>
        /// <param name="newPassword">明文</param>
        void ChangePassword(string oldPassword, string newPassword);
        void ModifyInfo(ModifyAccountInfoInput input);
    }

    public class AccountAppService : AdminAppService, IAccountService
    {
        /// <summary>
        /// 
        /// </summary>
        /// <param name="loginName"></param>
        /// <param name="password">前端传过来的是经过md5加密后的密码</param>
        /// <param name="user"></param>
        /// <param name="msg"></param>
        /// <returns></returns>
        public bool CheckLogin(string loginName, string password, out Sys_User user, out string msg)
        {
            user = null;
            msg = null;

            loginName.NotNullOrEmpty();
            password.NotNullOrEmpty();

            var view = this.DbContext.JoinQuery<Sys_User, Sys_UserLogOn>((u, userLogOn) => new object[]
            {
                JoinType.InnerJoin,u.Id == userLogOn.UserId
            })
            .Select((u, userLogOn) => new { User = u, UserLogOn = userLogOn });

            loginName = loginName.ToLower();
            if (AceUtils.IsMobilePhone(loginName))
            {
                view = view.Where(a => a.User.MobilePhone == loginName);
            }
            else if (AceUtils.IsEmail(loginName))
            {
                view = view.Where(a => a.User.Email == loginName);
            }
            else
            {
                view = view.Where(a => a.User.AccountName == loginName);
            }

            view = view.Where(a => a.User.State != AccountState.Closed);

            var viewEntity = view.FirstOrDefault();

            if (viewEntity == null)
            {
                msg = "账户不存在，请重新输入";
                return false;
            }
            if (!viewEntity.User.IsAdmin())
            {
                if (viewEntity.User.State == AccountState.Disabled)
                {
                    msg = "账户被禁用，请联系管理员";
                    return false;
                }
            }

            Sys_User userEntity = viewEntity.User;
            Sys_UserLogOn userLogOnEntity = viewEntity.UserLogOn;

            string dbPassword = PasswordHelper.EncryptMD5Password(password, userLogOnEntity.UserSecretkey);
            if (dbPassword != userLogOnEntity.UserPassword)
            {
                msg = "密码不正确，请重新输入";
                return false;
            }

            DateTime lastVisitTime = DateTime.Now;
            this.DbContext.Update<Sys_UserLogOn>(a => a.Id == userLogOnEntity.Id, a => new Sys_UserLogOn() { LogOnCount = a.LogOnCount + 1, PreviousVisitTime = userLogOnEntity.LastVisitTime, LastVisitTime = lastVisitTime });
            user = userEntity;
            return true;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="oldPassword">明文</param>
        /// <param name="newPassword">明文</param>
        public void ChangePassword(string oldPassword, string newPassword)
        {
            PasswordHelper.EnsurePasswordLegal(newPassword);

            AdminSession session = this.Session;

            Sys_UserLogOn userLogOn = this.DbContext.Query<Sys_UserLogOn>().Where(a => a.UserId == session.UserId).First();

            string encryptedOldPassword = PasswordHelper.Encrypt(oldPassword, userLogOn.UserSecretkey);

            if (encryptedOldPassword != userLogOn.UserPassword)
                throw new InvalidInputException("旧密码不正确");

            string newUserSecretkey = UserHelper.GenUserSecretkey();
            string newEncryptedPassword = PasswordHelper.Encrypt(newPassword, newUserSecretkey);

            this.DbContext.DoWithTransaction(() =>
            {
                this.DbContext.Update<Sys_UserLogOn>(a => a.UserId == session.UserId, a => new Sys_UserLogOn() { UserSecretkey = newUserSecretkey, UserPassword = newEncryptedPassword });
                this.Log(LogType.Update, "Account", true, "用户[{0}]修改密码".ToFormat(session.UserId));
            });
        }

        public void ModifyInfo(ModifyAccountInfoInput input)
        {
            if (input.AccountName.IsNotNullOrEmpty())
                input.AccountName = input.AccountName.Trim();

            input.Validate();

            var session = this.Session;

            Sys_User user = this.DbContext.Query<Sys_User>().FilterDeleted().Where(a => a.Id == session.UserId).AsTracking().First();

            string accountName = user.AccountName;

            if (user.AccountName.IsNullOrEmpty())
            {
                //用户名设置后不能修改
                if (input.AccountName.IsNotNullOrEmpty())
                {
                    accountName = input.AccountName.ToLower();
                    AceUtils.EnsureAccountNameLegal(accountName);
                    bool exists = this.DbContext.Query<Sys_User>().Where(a => a.AccountName == accountName).Any();
                    if (exists)
                        throw new InvalidInputException("用户名[{0}]已存在".ToFormat(input.AccountName));
                }
            }

            user.AccountName = accountName;
            user.Name = input.Name;
            user.Gender = input.Gender;
            user.Birthday = input.Birthday;
            user.WeChat = input.WeChat;
            user.Description = input.Description;

            this.DbContext.Update<Sys_User>(user);
        }
    }

}

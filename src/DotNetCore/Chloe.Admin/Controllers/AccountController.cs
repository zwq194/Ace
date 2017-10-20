﻿using Ace;
using Ace.VerifyCode;
using Chloe.Admin.Common;
using Ace.Application;
using Ace.Application.Common;
using Ace.Entity;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using Ace.Web;
using Ace.Application.System;
using Microsoft.AspNetCore.Http;
using Ace.Entity.System;

namespace Chloe.Admin.Controllers
{
    public class AccountController : WebController
    {
        const string VerifyCodeKey = "session_verifycode";

        // GET: Account
        [AllowAnonymous]
        public ActionResult Login(string returnUrl)
        {
            return View();
        }

        [HttpPost]
        public ActionResult Login(string userName, string password/*经过md5加密后的密码*/, string verifyCode)
        {
            //if (verifyCode.IsNullOrEmpty())
            //    return this.FailedMsg("请输入验证码");
            if (userName.IsNullOrEmpty() || password.IsNullOrEmpty())
                return this.FailedMsg("用户名/密码不能为空");

            //string code = WebHelper.GetSession<string>(VerifyCodeKey);
            //WebHelper.RemoveSession(VerifyCodeKey);
            //if (code.IsNullOrEmpty() || code.ToLower() != verifyCode.ToLower())
            //{
            //    return this.FailedMsg("验证码错误，请重新输入");
            //}

            userName = userName.Trim();
            var accountAppService = this.CreateService<IAccountAppService>();

            const string moduleName = "系统登录";
            string ip = this.HttpContext.GetClientIP();

            Sys_User user;
            string msg;
            if (!accountAppService.CheckLogin(userName, password, out user, out msg))
            {
                this.CreateService<ISysLogAppService>().LogAsync(null, null, ip, LogType.Login, moduleName, false, "用户[{0}]登录失败：{1}".ToFormat(userName, msg));
                return this.FailedMsg(msg);
            }

            AdminSession session = new AdminSession();
            session.UserId = user.Id;
            session.UserName = user.UserName;
            session.RealName = user.RealName;
            session.DepartmentId = user.DepartmentId;
            session.DutyId = user.DutyId;
            session.RoleId = user.RoleId;
            session.LoginIP = ip;
            session.LoginTime = DateTime.Now;
            session.IsAdmin = user.UserName.ToLower() == AppConsts.AdminUserName;
            
            this.CurrentSession = session;

            this.CreateService<ISysLogAppService>().LogAsync(user.Id, user.RealName, ip, LogType.Login, moduleName, true, "登录成功");
            return this.SuccessMsg(msg);
        }
        public ActionResult Logout()
        {
            this.CurrentSession = null;
            return RedirectToAction("Login");
        }
        [HttpGet]
        public ActionResult VerifyCode()
        {
            throw new NotImplementedException();
            //string verifyCode = VerifyCodeGenerator.GenVerifyCode();
            //byte[] bytes = VerifyCodeHelper.GetVerifyCodeByteArray(verifyCode);

            //WebHelper.SetSession(VerifyCodeKey, verifyCode);

            //return this.File(bytes, @"image/Gif");
        }


        [LoginAuthorizeAttribute]
        [HttpGet]
        public ActionResult Index()
        {
            var service = this.CreateService<IEntityAppService>();
            Sys_User user = service.GetByKey<Sys_User>(this.CurrentSession.UserId);
            Sys_Department department = string.IsNullOrEmpty(user.DepartmentId) ? null : service.GetByKey<Sys_Department>(user.DepartmentId);
            Sys_Duty duty = string.IsNullOrEmpty(user.DutyId) ? null : service.GetByKey<Sys_Duty>(user.DutyId);
            Sys_Role role = string.IsNullOrEmpty(user.RoleId) ? null : service.GetByKey<Sys_Role>(user.RoleId);

            UserModel model = new UserModel();
            model.User = user;
            model.DepartmentName = department == null ? null : department.Name;
            model.DutyName = duty == null ? null : duty.Name;
            model.RoleName = role == null ? null : role.Name;

            this.ViewBag.UserInfo = model;

            return View();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="oldPassword">明文</param>
        /// <param name="newPassword">明文</param>
        /// <returns></returns>
        [LoginAuthorizeAttribute]
        [HttpPost]
        public ActionResult ChangePassword(string oldPassword, string newPassword)
        {
            this.CreateService<IAccountAppService>().ChangePassword(oldPassword, newPassword);
            return this.SuccessMsg("密码修改成功");
        }
        [LoginAuthorizeAttribute]
        [HttpPost]
        public ActionResult ModifyInfo(ModifyAccountInfoInput input)
        {
            this.CreateService<IAccountAppService>().ModifyInfo(input);
            return this.SuccessMsg("修改成功");
        }
    }

    public class UserModel
    {
        public Sys_User User { get; set; }
        public string DepartmentName { get; set; }
        public string DutyName { get; set; }
        public string RoleName { get; set; }
    }
}
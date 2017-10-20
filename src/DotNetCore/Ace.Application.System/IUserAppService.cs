using Ace;
using Ace.Application;
using Ace.Entity;
using Ace.Entity.System;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ace.Application.System
{
    public interface IUserAppService : IAppService
    {
        void EnableAccount(string userId);
        void DisableAccount(string userId);
        /// <summary>
        /// 
        /// </summary>
        /// <param name="userId"></param>
        /// <param name="pwdText">明文</param>
        void RevisePassword(string userId, string pwdText);
        void DeleteAccount(string userId);

        void AddUser(AddUserInput input);
        void UpdateUser(UpdateUserInput input);

        PagedData<Sys_User> GetPageData(Pagination page, string keyword);
    }
}

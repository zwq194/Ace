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
    public interface IRoleAuthorizeAppService : IAppService
    {
        List<Sys_RoleAuthorize> GetList(string roleId);
        List<Sys_Module> GetMenuList(string roleId);
    }
}

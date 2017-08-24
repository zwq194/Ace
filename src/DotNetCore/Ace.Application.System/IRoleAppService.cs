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
    public interface IRoleAppService : IAppService
    {
        List<Sys_Role> GetRoles(string keyword = "");
        List<SimpleRoleModel> GetSimpleModels();
        void Add(AddRoleInput input);
        void Update(UpdateRoleInput input);
        void Delete(string roleId);
    }
}

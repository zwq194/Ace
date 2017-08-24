using Ace.Entity;
using Ace.Entity.System;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ace.Application.System
{
    public class SimpleRoleModel
    {
        public string Id { get; set; }
        public string Name { get; set; }

        public static SimpleRoleModel Create(Sys_Role role)
        {
            SimpleRoleModel roleModel = new SimpleRoleModel();

            roleModel.Id = role.Id;
            roleModel.Name = role.Name;

            return roleModel;
        }
    }

}

﻿using Ace.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Chloe;
using Ace.Entity.System;

namespace Ace.Application.System.Implements
{
    public class RoleAuthorizeAppService : AdminAppService, IRoleAuthorizeAppService
    {
        public List<Sys_RoleAuthorize> GetList(string roleId)
        {
            return this.DbContext.Query<Sys_RoleAuthorize>().Where(t => t.RoleId == roleId).ToList();
        }
        public List<Sys_Module> GetMenuList(string roleId)
        {
            var data = new List<Sys_Module>();
            if (this.Session.IsAdmin)
            {
                data = this.ServiceFactory.CreateService<IModuleAppService>().GetList();
            }
            else
            {
                var moduledata = this.ServiceFactory.CreateService<IModuleAppService>().GetList();

                var roles = this.DbContext.Query<Sys_Role>().FilterDeletedAndDisabled().Where(a => a.Id == roleId);

                var authorizedata = this.DbContext.Query<Sys_RoleAuthorize>().InnerJoin(roles, (auth, role) => auth.RoleId == role.Id).Select((auth, role) => auth).ToList();
                foreach (var item in authorizedata)
                {
                    Sys_Module moduleEntity = moduledata.Find(t => t.Id == item.ModuleId);
                    if (moduleEntity != null)
                    {
                        data.Add(moduleEntity);
                    }
                }
            }
            return data.OrderBy(t => t.SortCode).ToList();
        }
    }
}

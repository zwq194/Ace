using Ace.Application;
using Ace.AutoMapper;
using Ace.Entity;
using Ace.Entity.System;
using Ace.IdStrategy;
using Chloe;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ace.Application.System
{
    public interface IRoleService : IAppService
    {
        List<Sys_Role> GetRoles(string keyword = "");
        List<SimpleRoleModel> GetSimpleModels();
        void Add(AddRoleInput input);
        void Update(UpdateRoleInput input);
        void Delete(string roleId);

        List<Sys_Role> GetList(string keyword = "");
        List<Sys_RolePermission> GetPermissions(string id);
        void SetPermission(string id, List<string> permissionList);
    }

    public class RoleService : AdminAppService, IRoleService
    {
        public List<Sys_Role> GetRoles(string keyword = "")
        {
            var q = this.DbContext.Query<Sys_Role>().FilterDeleted();
            if (keyword.IsNotNullOrEmpty())
            {
                q = q.Where(a => a.Name.Contains(keyword));
            }

            var ret = q.OrderBy(a => a.SortCode).ToList();
            return ret;
        }
        public List<SimpleRoleModel> GetSimpleModels()
        {
            var q = this.DbContext.Query<Sys_Role>().FilterDeletedAndDisabled().OrderBy(a => a.SortCode);
            var ret = q.Select(a => new SimpleRoleModel() { Id = a.Id, Name = a.Name }).ToList();
            return ret;
        }
        public void Add(AddRoleInput input)
        {
            input.Validate();
            Sys_Role role = this.CreateEntity<Sys_Role>();

            AceMapper.Map(input, role);
            this.DbContext.DoWithTransaction(() =>
            {
                this.DbContext.Insert(role);
            });
        }
        public void Update(UpdateRoleInput input)
        {
            input.Validate();

            Sys_Role role = this.DbContext.QueryByKey<Sys_Role>(input.Id, true);

            role.NotNull("角色不存在");

            AceMapper.Map(input, role);

            this.DbContext.DoWithTransaction(() =>
            {
                this.DbContext.Update(role);
            });
        }

        public void Delete(string id)
        {
            id.NotNullOrEmpty();
            this.SoftDelete<Sys_Role>(id);
        }


        public List<Sys_Role> GetList(string keyword = "")
        {
            var q = this.DbContext.Query<Sys_Role>().FilterDeleted();
            q = q.Where(a => a.Name.Contains(keyword));
            var ret = q.OrderBy(a => a.SortCode).ToList();
            return ret;
        }
        public List<Sys_RolePermission> GetPermissions(string id)
        {
            return this.DbContext.Query<Sys_RolePermission>().Where(t => t.RoleId == id).ToList();
        }
        public void SetPermission(string id, List<string> permissionList)
        {
            id.NotNullOrEmpty();

            List<Sys_RolePermission> roleAuths = permissionList.Select(a => new Sys_RolePermission()
            {
                Id = IdHelper.CreateStringSnowflakeId(),
                RoleId = id,
                PermissionId = a
            }).ToList();

            this.DbContext.DoWithTransaction(() =>
            {
                this.DbContext.Delete<Sys_RolePermission>(a => a.RoleId == id);
                this.DbContext.InsertRange(roleAuths);
            });
        }
    }

}

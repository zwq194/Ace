using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Ace;
using Ace.Application.System;
using Ace.Entity.System;
using Ace.Web.Mvc;
using Ace.Web.Mvc.Authorization;
using Chloe.Admin.Common;
using Chloe.Admin.Common.Tree;
using Microsoft.AspNetCore.Mvc;

namespace Chloe.Admin.Areas.System.Controllers
{
    [Area(AreaNames.System)]
    [Permission("system.role")]
    public class RoleController : WebController<IRoleService>
    {
        // GET: SystemManage/Role
        public ActionResult Index()
        {
            return View();
        }

        [HttpGet]
        public ActionResult Models(string keyword)
        {
            List<Sys_Role> data = this.Service.GetRoles(keyword);
            return this.SuccessData(data);
        }

        [Permission("system.role.add")]
        [HttpPost]
        public ActionResult Add(AddRoleInput input)
        {
            this.Service.Add(input);
            return this.AddSuccessMsg();
        }

        [Permission("system.role.update")]
        [HttpPost]
        public ActionResult Update(UpdateRoleInput input)
        {
            this.Service.Update(input);
            return this.UpdateSuccessMsg();
        }

        [Permission("system.role.delete")]
        [HttpPost]
        public ActionResult Delete(string id)
        {
            this.Service.Delete(id);
            return this.DeleteSuccessMsg();
        }

        public ActionResult GetPermissionTree(string id)
        {
            List<Sys_Permission> authList = this.CreateService<IPermissionService>().GetList();
            List<Sys_RolePermission> authorizedata = new List<Sys_RolePermission>();
            if (!string.IsNullOrEmpty(id))
            {
                authorizedata = this.Service.GetPermissions(id);
            }
            var treeList = new List<TreeViewModel>();
            foreach (Sys_Permission auth in authList.Where(a => a.Type != PermissionType.公共菜单))
            {
                string typeName = "";
                if (auth.Type == PermissionType.权限菜单)
                    typeName = $" [菜单]";

                TreeViewModel tree = new TreeViewModel();
                bool hasChildren = authList.Any(a => a.ParentId == auth.Id);
                tree.Id = auth.Id;
                tree.Text = auth.Name + typeName;
                tree.Value = auth.Code;
                tree.ParentId = auth.ParentId;
                tree.Isexpand = true;
                tree.Complete = true;
                tree.Showcheck = true;
                tree.Checkstate = authorizedata.Count(t => t.PermissionId == auth.Id);
                tree.HasChildren = hasChildren;
                tree.Img = auth.Icon == "" ? "" : auth.Icon;
                treeList.Add(tree);
            }

            return Content(TreeHelper.ConvertToJson(treeList));
        }

        [Permission("system.role.set_permission")]
        [HttpPost]
        public ActionResult SetPermission(string id, string permissions)
        {
            List<string> permissionList = JsonHelper.DeserializeToList<string>(permissions);
            this.Service.SetPermission(id, permissionList);
            return this.SuccessMsg("保存成功");
        }
    }
}
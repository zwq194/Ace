using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Ace;
using Ace.Application;
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
    [Permission("system.org")]
    public class OrgController : WebController<IOrgService>
    {
        public ActionResult Index()
        {
            List<Sys_OrgType> orgTypes = this.CreateService<IEntityAppService>().GetList<Sys_OrgType>();
            this.ViewBag.OrgTypes = orgTypes;
            return View();
        }

        [HttpGet]
        public ActionResult Models(string keyword)
        {
            List<Sys_Org> data = this.Service.GetList(keyword);
            if (!string.IsNullOrWhiteSpace(keyword))
            {
                string lowerKeyword = keyword.ToLower().Trim();
                data = TreeHelper.TreeWhere(data, a => a.Name.Contains(lowerKeyword, true), a => a.Id, a => a.ParentId);
            }

            List<DataTableTree> ret = new List<DataTableTree>();
            DataTableTree.AppendChildren(data, ref ret, null, 0, a => a.Id, a => a.ParentId);

            return this.SuccessData(ret);
        }

        [Permission("system.org.add")]
        [HttpPost]
        public ActionResult Add(AddOrgInput input)
        {
            this.Service.Add(input);
            return this.AddSuccessMsg();
        }

        [Permission("system.org.update")]
        [HttpPost]
        public ActionResult Update(UpdateOrgInput input)
        {
            this.Service.Update(input);
            return this.UpdateSuccessMsg();
        }

        [Permission("system.org.delete")]
        [HttpPost]
        public ActionResult Delete(string id)
        {
            this.Service.Delete(id);
            return this.DeleteSuccessMsg();
        }

        public ActionResult GetPermissionTree(string id)
        {
            List<Sys_Permission> authList = this.CreateService<IPermissionService>().GetList();
            List<Sys_OrgPermission> authorizedata = new List<Sys_OrgPermission>();
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

        [Permission("system.org.set_permission")]
        [HttpPost]
        public ActionResult SetPermission(string id, string permissions)
        {
            List<string> permissionList = JsonHelper.DeserializeToList<string>(permissions);
            this.Service.SetPermission(id, permissionList);
            return this.SuccessMsg("保存成功");
        }

        public ActionResult GetParentOrgs(int? orgType)
        {
            List<Sys_Org> orgs = new List<Sys_Org>();
            if (orgType == null)
                return this.SuccessData(orgs);

            orgs = this.Service.GetParentOrgs(orgType.Value);
            return this.SuccessData(orgs);
        }
    }
}
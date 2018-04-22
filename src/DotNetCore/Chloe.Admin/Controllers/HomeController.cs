using Ace;
using Chloe.Admin.Common;
using Ace.Application;
using Ace.Entity;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Ace.Application.System;
using Ace.Entity.System;
using Ace.Web.Mvc.Authorization;

namespace Chloe.Admin.Controllers
{
    [LoginAttribute]
    public class HomeController : WebController
    {
        // GET: Home
        public ActionResult Index()
        {
            this.ViewBag.CurrentSession = this.CurrentSession;
            return View();
        }
        public ActionResult Default()
        {
            this.ViewBag.CurrentSession = this.CurrentSession;
            return View();
        }
        [HttpGet]
        public ActionResult GetClientsDataJson()
        {
            var data = new
            {
                authorizeMenu = this.GetMenus(),
            };
            return this.SuccessData(data);
        }

        [AllowNotLogin]
        public ActionResult Error()
        {
            return this.View();
        }

        List<PermissionMenu> GetMenus()
        {
            List<PermissionMenu> ret = new List<PermissionMenu>();

            IUserService userService = this.CreateService<IUserService>();
            IPermissionService authService = this.CreateService<IPermissionService>();

            Dictionary<string, Sys_Permission> userPermissionDic = null;
            if (!this.CurrentSession.IsAdmin)
            {
                List<Sys_Permission> userPermissions = userService.GetUserPermissions(this.CurrentSession.UserId);
                userPermissionDic = userPermissions.ToDictionary(a => a.Id);
            }

            List<Sys_Permission> permissionMenus = authService.GetPermissionMenus();

            List<Sys_Permission> parentPermissions = permissionMenus.Where(a => a.ParentId == null).ToList();

            foreach (Sys_Permission item in parentPermissions)
            {
                PermissionMenu permissionMenu = PermissionMenu.Create(item);

                List<PermissionMenu> childMenus = new List<PermissionMenu>();
                GatherChildMenus(permissionMenus, item, childMenus, userPermissionDic);
                //var childPermissions = permissionMenus.Where(a => a.ParentId == item.Id);
                //foreach (Sys_Permission childPermission in childPermissions)
                //{
                //    if (!this.CurrentSession.IsAdmin)
                //    {
                //        if (childPermission.Type != PermissionType.公共菜单 && !userPermissionDic.ContainsKey(childPermission.Id))
                //            continue;
                //    }

                //    permissionMenu.Children.Add(PermissionMenu.Create(childPermission));
                //}

                permissionMenu.Children.AddRange(childMenus);
                ret.Add(permissionMenu);
            }

            //ret = ret.Where(a => a.Type != AuthType.节点组 || (a.Type == AuthType.节点组 && a.Children.Count > 0)).ToList();
            ret = ret.Where(a => !(a.Type == PermissionType.节点组 && a.Children.Count == 0)).OrderBy(a => a.SortCode).ToList();

            //foreach (var item in ret)
            //{
            //    item.Children = item.Children.ToList();
            //}

            return ret;
        }

        void GatherChildMenus(List<Sys_Permission> permissions, Sys_Permission permission, List<PermissionMenu> list, Dictionary<string, Sys_Permission> userPermissionDic)
        {
            var childPermissions = permissions.Where(a => a.ParentId == permission.Id).OrderBy(a => a.SortCode);
            foreach (Sys_Permission childPermission in childPermissions)
            {
                if (childPermission.Type == PermissionType.节点组)
                {
                    GatherChildMenus(permissions, childPermission, list, userPermissionDic);
                    continue;
                }

                if (childPermission.Type != PermissionType.公共菜单 && !this.CurrentSession.IsAdmin)
                {
                    if (!userPermissionDic.ContainsKey(childPermission.Id))
                        continue;
                }

                list.Add(PermissionMenu.Create(childPermission));
            }
        }
    }

    public class PermissionMenu
    {
        public string Id { get; set; }
        public string Name { get; set; }
        public string ParentId { get; set; }
        public PermissionType Type { get; set; }
        public string Url { get; set; }
        public string Icon { get; set; }
        public int SortCode { get; set; }
        public List<PermissionMenu> Children { get; set; } = new List<PermissionMenu>();

        public static PermissionMenu Create(Sys_Permission permission)
        {
            PermissionMenu ret = new PermissionMenu()
            {
                Id = permission.Id,
                Name = permission.Name,
                ParentId = permission.ParentId,
                Type = permission.Type,
                Url = permission.Url,
                Icon = permission.Icon,
                SortCode = permission.GetSortCode(),
            };

            return ret;
        }
    }
}
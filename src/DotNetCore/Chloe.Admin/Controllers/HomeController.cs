﻿using Ace;
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

namespace Chloe.Admin.Controllers
{
    [LoginAuthorizeAttribute]
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
                //dataItems = this.GetDataItemList(),
                //organize = this.GetOrganizeList(),
                //role = this.GetRoleList(),
                //duty = this.GetDutyList(),
                user = "",
                authorizeMenu = this.GetMenuList(),
                //authorizeButton = this.GetMenuButtonList(),
            };
            return this.SuccessData(data);
        }

        [SkipLoginAuthorizeAttribute]
        public ActionResult Error()
        {
            return this.View();
        }

        object GetMenuList()
        {
            var roleId = this.CurrentSession.RoleId;
            var service = this.CreateService<IRoleAuthorizeAppService>();
            List<Sys_Module> menuList = service.GetMenuList(roleId);

            menuList.ForEach(a =>
            {
                if (a.UrlAddress.IsNotNullOrEmpty())
                {
                    a.UrlAddress = this.Url.Content(a.UrlAddress);
                }
            });

            return this.ToMenuJson(menuList, null);
        }
        string ToMenuJson(List<Sys_Module> data, string parentId)
        {
            StringBuilder sbJson = new StringBuilder();
            sbJson.Append("[");
            List<Sys_Module> entities = data.FindAll(t => t.ParentId == parentId);
            if (entities.Count > 0)
            {
                foreach (var item in entities)
                {
                    string strJson = JsonHelper.Serialize(item);
                    strJson = strJson.Insert(strJson.Length - 1, ",\"ChildNodes\":" + ToMenuJson(data, item.Id) + "");
                    sbJson.Append(strJson + ",");
                }
                sbJson = sbJson.Remove(sbJson.Length - 1, 1);
            }
            sbJson.Append("]");
            return sbJson.ToString();
        }
    }
}
using Ace.IdStrategy;
using Ace.Entity;
using Chloe.Admin.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using Microsoft.AspNetCore.Mvc;
using Ace.Application.System;
using Ace.Entity.System;

namespace Chloe.Admin.Areas.SystemManage.Controllers
{
    [Area(AreaNames.SystemManage)]
    [LoginAuthorizeAttribute]
    public class RoleController : WebController
    {
        // GET: SystemManage/Role
        public ActionResult Index()
        {
            return View();
        }

        [HttpGet]
        public ActionResult GetModels(string keyword)
        {
            List<Sys_Role> data = this.CreateService<IRoleAppService>().GetRoles(keyword);
            return this.SuccessData(data);
        }

        [HttpPost]
        //[ValidateAntiForgeryToken]
        public ActionResult Add(AddRoleInput input)
        {
            this.CreateService<IRoleAppService>().Add(input);
            return this.AddSuccessMsg();
        }
        [HttpPost]
        //[ValidateAntiForgeryToken]
        public ActionResult Update(UpdateRoleInput input)
        {
            this.CreateService<IRoleAppService>().Update(input);
            return this.UpdateSuccessMsg();
        }

        [HttpPost]
        //[ValidateAntiForgeryToken]
        public ActionResult Delete(string id)
        {
            this.CreateService<IRoleAppService>().Delete(id);
            return this.DeleteSuccessMsg();
        }
    }
}
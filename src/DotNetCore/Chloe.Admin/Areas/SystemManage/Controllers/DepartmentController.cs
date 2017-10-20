using Ace.IdStrategy;
using Chloe.Admin.Common.Tree;
using Ace.Entity;
using Chloe.Admin.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using Microsoft.AspNetCore.Mvc;
using Ace.Application.System;
using Ace.Entity.System;
using Ace.Application;

namespace Chloe.Admin.Areas.SystemManage.Controllers
{
    [Area(AreaNames.SystemManage)]
    [LoginAuthorizeAttribute]
    public class DepartmentController : WebController
    {
        public ActionResult Index()
        {
            return View();
        }

        [HttpGet]
        public ActionResult GetModels(string keyword)
        {
            List<Sys_Department> data = this.CreateService<IDepartmentAppService>().GetDepartments(keyword);
            return this.SuccessData(data);
        }

        [HttpPost]
        //[ValidateAntiForgeryToken]
        public ActionResult Add(AddDepartmentInput input)
        {
            input.CreateUserId = this.CurrentSession.UserId;
            this.CreateService<IEntityAppService>().AddFromDto<Sys_Department, AddDepartmentInput>(input);
            return this.AddSuccessMsg();
        }
        [HttpPost]
        //[ValidateAntiForgeryToken]
        public ActionResult Update(UpdateDepartmentInput input)
        {
            this.CreateService<IEntityAppService>().UpdateFromDto<Sys_Department, UpdateDepartmentInput>(input);
            return this.UpdateSuccessMsg();
        }

        [HttpPost]
        //[ValidateAntiForgeryToken]
        public ActionResult Delete(string id)
        {
            this.CreateService<IEntityAppService>().SoftDelete<Sys_Department>(id, this.CurrentSession.UserId);
            return this.DeleteSuccessMsg();
        }
    }

}
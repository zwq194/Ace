using Ace.IdStrategy;
using Chloe.Admin.Common.Tree;
using Ace.Entity;
using Chloe.Admin.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using Ace;
using Microsoft.AspNetCore.Mvc;
using Ace.Web;
using Ace.Application.System;
using Ace.Entity.System;
using Ace.Application;

namespace Chloe.Admin.Areas.SystemManage.Controllers
{
    [Area(AreaNames.SystemManage)]
    [LoginAuthorizeAttribute]
    public class DutyController : WebController
    {
        public ActionResult Index()
        {
            List<SelectOption> departmentList = SelectOption.CreateList(this.CreateService<IDepartmentAppService>().GetSimpleModels());

            this.ViewBag.DepartmentList = departmentList;
            this.ViewBag.DepartmentListString = JsonHelper.Serialize(departmentList);

            return View();
        }

        [HttpGet]
        public ActionResult GetModels(string keyword)
        {
            List<Sys_Duty> data = this.CreateService<IDutyAppService>().GetDutyList(keyword);
            return this.SuccessData(data);
        }

        [HttpPost]
        public ActionResult Add(AddDutyInput input)
        {
            input.CreateUserId = this.CurrentSession.UserId;
            this.CreateService<IEntityAppService>().AddFromDto<Sys_Duty, AddDutyInput>(input);
            return this.AddSuccessMsg();
        }
        [HttpPost]
        public ActionResult Update(UpdateDutyInput input)
        {
            this.CreateService<IEntityAppService>().UpdateFromDto<Sys_Duty, UpdateDutyInput>(input);
            return this.UpdateSuccessMsg();
        }

        [HttpPost]
        public ActionResult Delete(string id)
        {
            this.CreateService<IEntityAppService>().SoftDelete<Sys_Duty>(id, this.CurrentSession.UserId);
            return this.DeleteSuccessMsg();
        }
    }

}
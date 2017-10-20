using Ace;
using Ace.Web;
using Chloe.Admin.Common;
using Ace.Entity;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using Ace.Application.System;
using Ace.Entity.System;

namespace Chloe.Admin.Areas.SystemManage.Controllers
{
    [Area(AreaNames.SystemManage)]
    [LoginAuthorizeAttribute]
    public class UserController : WebController
    {
        // GET: SystemManage/User
        public ActionResult Index()
        {
            List<SelectOption> departmentList = SelectOption.CreateList(this.CreateService<IDepartmentAppService>().GetSimpleModels());
            List<SimpleDutyModel> dutyModelList = this.CreateService<IDutyAppService>().GetSimpleModels();
            List<SelectOption> roleList = SelectOption.CreateList(this.CreateService<IRoleAppService>().GetSimpleModels());

            this.ViewBag.DepartmentList = departmentList;
            this.ViewBag.DutyList = dutyModelList;
            this.ViewBag.RoleList = roleList;

            return View();
        }

        [HttpGet]
        public ActionResult GetModels(Pagination pagination, string keyword)
        {
            PagedData<Sys_User> pagedData = this.CreateService<IUserAppService>().GetPageData(pagination, keyword);
            return this.SuccessData(pagedData);
        }


        [HttpPost]
        public ActionResult Add(AddUserInput input)
        {
            this.CreateService<IUserAppService>().AddUser(input);
            return this.AddSuccessMsg();
        }
        [HttpPost]
        public ActionResult Update(UpdateUserInput input)
        {
            this.CreateService<IUserAppService>().UpdateUser(input);
            return this.UpdateSuccessMsg();
        }


        [HttpPost]
        public ActionResult Delete(string id)
        {
            this.CreateService<IUserAppService>().DeleteAccount(id);
            return this.DeleteSuccessMsg();
        }

        [HttpGet]
        public ActionResult RevisePassword()
        {
            return View();
        }
        [HttpPost]
        public ActionResult RevisePassword(string userId, string newPassword)
        {
            if (userId.IsNullOrEmpty())
                return this.FailedMsg("userId 不能为空");

            this.CreateService<IUserAppService>().RevisePassword(userId, newPassword);
            return this.SuccessMsg("重置密码成功");
        }
    }
}
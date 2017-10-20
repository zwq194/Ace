using Ace.Application;
using Ace.AutoMapper;
using Ace.Entity;
using Ace.Entity.System;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ace.Application.System
{
    public class AddOrUpdateDepartmentInputBase : ValidationModel
    {
        [RequiredAttribute(ErrorMessage = "部门名称不能为空")]
        public string Name { get; set; }
        public string EnCode { get; set; }
        public string Manager { get; set; }
        public string Telephone { get; set; }
        public string MobilePhone { get; set; }
        public string WeChat { get; set; }
        public string Fax { get; set; }
        public string Email { get; set; }
        public int? SortCode { get; set; }
        public string Description { get; set; }
    }

    [MapToType(typeof(Sys_Department))]
    public class AddDepartmentInput : AddOrUpdateDepartmentInputBase
    {
        public string CreateUserId { get; set; }
    }

    [MapToType(typeof(Sys_Department))]
    public class UpdateDepartmentInput : AddOrUpdateDepartmentInputBase
    {
        [RequiredAttribute(ErrorMessage = "{0}不能为空")]
        public string Id { get; set; }
    }
}

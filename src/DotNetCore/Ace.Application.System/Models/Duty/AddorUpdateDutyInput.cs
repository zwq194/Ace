using Ace.Application;
using Ace.AutoMapper;
using Ace.Entity.System;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ace.Application.System
{
    public class AddorUpdateDutyInputBase : ValidationModel
    {
        [RequiredAttribute(ErrorMessage = "职责名称不能为空")]
        public string Name { get; set; }
        public string DepartmentId { get; set; }
        public int? SortCode { get; set; }
    }

    [MapToType(typeof(Sys_Duty))]
    public class AddDutyInput : AddorUpdateDutyInputBase
    {
        public string CreateUserId { get; set; }
    }

    [MapToType(typeof(Sys_Duty))]
    public class UpdateDutyInput : AddorUpdateDutyInputBase
    {
        [RequiredAttribute(ErrorMessage = "{0}不能为空")]
        public string Id { get; set; }
    }
}

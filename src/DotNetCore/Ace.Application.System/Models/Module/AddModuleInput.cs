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
    [MapToType(typeof(Sys_Module))]
    public class AddModuleInput : AddOrUpdateModuleInputBase
    {
        public string CreateUserId { get; set; }
    }

}

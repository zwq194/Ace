﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace Ace.Application.System
{
    public class AddOrUpdateModuleInputBase : ValidationModel
    {
        public string ParentId { get; set; }
        [RequiredAttribute(ErrorMessage = "菜单名称不能为空")]
        public string Name { get; set; }
        public string Icon { get; set; }
        public string UrlAddress { get; set; }
        public string OpenTarget { get; set; }
        public bool IsMenu { get; set; }
        public bool IsExpand { get; set; }
        public bool IsPublic { get; set; }

        public int? SortCode { get; set; }
        public string Description { get; set; }


        public bool IsEnabled { get; set; }
    }
}

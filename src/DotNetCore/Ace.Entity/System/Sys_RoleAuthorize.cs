﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ace.Entity.System
{
    public class Sys_RoleAuthorize
    {
        public string Id { get; set; }
        public string RoleId { get; set; }
        public string ModuleId { get; set; }

        public int? SortCode { get; set; }
        public DateTime CreationTime { get; set; }
        public string CreateUserId { get; set; }
    }

}

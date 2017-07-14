using Ace.AutoMapper;
using Ace.Entity.Wiki;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace Ace.Application.Wiki
{
    public class AddOrUpdateWikiMenuItemInputBase : ValidationModel
    {
        public string ParentId { get; set; }
        [RequiredAttribute(ErrorMessage = "名称不能为空")]
        public string Name { get; set; }
        public string DocumentId { get; set; }
        public bool IsEnabled { get; set; }
        public int? SortCode { get; set; }
    }
}

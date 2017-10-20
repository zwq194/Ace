using Ace.AutoMapper;
using Ace.Entity.Wiki;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ace.Application.Wiki
{
    [MapToType(typeof(WikiMenuItem))]
    public class UpdateWikiMenuItemInput : AddOrUpdateWikiMenuItemInputBase
    {
        [RequiredAttribute(ErrorMessage = "{0}不能为空")]
        public string Id { get; set; }
    }
}

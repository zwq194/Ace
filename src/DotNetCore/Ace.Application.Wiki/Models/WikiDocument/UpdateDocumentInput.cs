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
    [MapToType(typeof(WikiDocumentDetail))]
    public class UpdateDocumentInput : AddOrUpdateDocumentInputBase
    {
        [RequiredAttribute(ErrorMessage = "{0}不能为空")]
        public string Id { get; set; }
    }
}

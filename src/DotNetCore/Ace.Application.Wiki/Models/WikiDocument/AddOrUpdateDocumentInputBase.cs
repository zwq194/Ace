using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace Ace.Application.Wiki
{
    public class AddOrUpdateDocumentInputBase : Ace.Application.ValidationModel
    {
        [RequiredAttribute(ErrorMessage = "标题不能为空")]
        public string Title { get; set; }
        public string Summary { get; set; }
        public string Tag { get; set; }
        public string HtmlContent { get; set; }
        public string MarkdownCode { get; set; }
    }
}

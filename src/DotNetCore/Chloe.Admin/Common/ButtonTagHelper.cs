using Chloe.Admin.Common;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.AspNetCore.Mvc.ViewFeatures;
using Microsoft.AspNetCore.Razor.TagHelpers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Ace.Web.Mvc
{
    [HtmlTargetElement("button", Attributes = PermissionAttributeName)]
    public class ButtonTagHelper : TagHelper
    {
        private const string PermissionAttributeName = "permission";
        public ButtonTagHelper()
        {

        }
        [HtmlAttributeName(PermissionAttributeName)]
        public string Permission { get; set; }

        [ViewContext]
        public ViewContext ViewContext { get; set; }

        public override void Process(TagHelperContext context, TagHelperOutput output)
        {
            string permissionCode = this.Permission;

            if (string.IsNullOrEmpty(permissionCode))
            {
                return;
            }

            bool hasPermission = PermissionCheckHelper.HasPermission(this.ViewContext.HttpContext, new List<string>() { permissionCode });

            if (hasPermission)
            {
                return;
            }

            //没权限则不输出相应的element
            output.SuppressOutput();
        }
    }
}

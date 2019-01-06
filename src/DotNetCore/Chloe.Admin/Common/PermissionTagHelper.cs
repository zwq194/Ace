using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.AspNetCore.Mvc.ViewFeatures;
using Microsoft.AspNetCore.Razor.TagHelpers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Chloe.Admin.Common
{
    [HtmlTargetElement("permission")]
    public class PermissionTagHelper : TagHelper
    {
        HttpContext _httpContext;
        public PermissionTagHelper(IHttpContextAccessor httpContextAccessor)
        {
            HttpContext httpContext = httpContextAccessor.HttpContext;
            this._httpContext = httpContext;
        }
        public override void Process(TagHelperContext context, TagHelperOutput output)
        {
            string permissionCode = output.Attributes.Where(a => a.Name == "code").FirstOrDefault()?.Value.ToString() ?? null;
            output.TagName = "";

            if (string.IsNullOrEmpty(permissionCode))
            {
                return;
            }

            bool hasPermission = PermissionCheckHelper.HasPermission(this._httpContext, new List<string>() { permissionCode });

            if (hasPermission)
            {
                return;
            }

            //没权限则不输出相应的element
            output.Content.Clear();
        }
    }


}

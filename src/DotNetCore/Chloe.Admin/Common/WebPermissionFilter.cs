using Ace.Application.System;
using Ace.Web.Mvc.Authorization;
using Microsoft.AspNetCore.Mvc.Filters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Caching.Memory;

namespace Chloe.Admin.Common
{
    public static class PermissionCheckHelper
    {
        public const string USER_PERMITS_CACHE_KEY = "_UPERMITS_";

        public static bool HasPermission(HttpContext httpContext, List<string> permissionCodes)
        {
            ClaimsPrincipal user = httpContext.User;
            string accountName = user.Claims.FirstOrDefault(x => x.Type == "AccountName").Value;
            if (accountName == Ace.Entity.System.SysUser.AdminAccountName)
                return true;

            IMemoryCache cache = httpContext.RequestServices.GetService(typeof(IMemoryCache)) as IMemoryCache;

            List<string> usePermits = null;

            string userId = user.Claims.FirstOrDefault(x => x.Type == "UserId").Value;
            string cacheKey = USER_PERMITS_CACHE_KEY + userId;
            usePermits = cache.Get<List<string>>(cacheKey);

            if (usePermits == null)
            {
                IUserService userService = httpContext.RequestServices.GetService(typeof(IUserService)) as IUserService;
                usePermits = userService.GetUserPermits(userId);
                cache.Set(cacheKey, usePermits, TimeSpan.FromMinutes(2));//缓存2分钟，2分钟后重新加载
            }

            foreach (string permit in permissionCodes)
            {
                if (!usePermits.Any(a => a == permit))
                    return false;
            }

            return true;
        }
    }
    public class WebPermissionFilter : PermissionFilter
    {
        public WebPermissionFilter()
        {
        }

        protected override bool HasExecutePermission(AuthorizationFilterContext filterContext, List<string> permissionCodes)
        {
            return PermissionCheckHelper.HasPermission(filterContext.HttpContext, permissionCodes);
        }
    }
}

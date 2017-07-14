using Ace.Application;
using Ace.Attributes;
using Ace.Exceptions;
using Ace.Web.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Ace;
using System.Reflection;
using System.Security.Claims;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Http.Authentication;

namespace Chloe.Home.Common
{
    public abstract class WebController : BaseController
    {
        [Disposable]
        IAppServiceFactory _appServicesFactory;
        IAppServiceFactory AppServicesFactory
        {
            get
            {
                if (this._appServicesFactory == null)
                    this._appServicesFactory = new AppServiceFactory(this.HttpContext.RequestServices, null);
                return this._appServicesFactory;
            }
        }


        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            ObsoleteApiAttribute obsoleteAttr = filterContext.ActionDescriptor.FilterDescriptors.Where(a => a.Filter is ObsoleteApiAttribute).Select(a => a.Filter).FirstOrDefault() as ObsoleteApiAttribute;

            if (obsoleteAttr == null)
            {
                obsoleteAttr = filterContext.Controller.GetType().GetCustomAttributes<ObsoleteApiAttribute>().FirstOrDefault() as ObsoleteApiAttribute;
            }

            if (obsoleteAttr != null)
            {
                filterContext.Result = this.FailedMsg(obsoleteAttr.Message);
            }

            base.OnActionExecuting(filterContext);
        }


        protected T CreateService<T>() where T : IAppService
        {
            return this.AppServicesFactory.CreateService<T>();
        }

        protected ActionResult InternalError()
        {
            this.Response.StatusCode = 500;
            return View("~/Views/Shared/Error.cshtml");
        }
        protected ActionResult NotFoundView()
        {
            this.Response.StatusCode = 404;
            return View("~/Views/Shared/NotFound.cshtml");
        }
    }
}
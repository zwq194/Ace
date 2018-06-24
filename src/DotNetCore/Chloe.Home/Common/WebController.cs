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
    public abstract class WebController<TService> : WebController
    {
        TService _service;
        protected TService Service
        {
            get
            {
                if (this._service == null)
                    this._service = this.CreateService<TService>();

                return this._service;
            }
        }
    }

    public abstract class WebController : BaseController
    {
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
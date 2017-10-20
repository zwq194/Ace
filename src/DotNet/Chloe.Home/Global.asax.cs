using Ace.Application;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Timers;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace Chloe.Home
{
    public class MvcApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {
            AppServiceFactory.RegisterServices();
            AppServiceFactory.RegisterServicesFromAssembly(Chloe.Application.CurrentAssembly.Value);

            AreaRegistration.RegisterAllAreas();
            RouteConfig.RegisterRoutes(RouteTable.Routes);
        }
        protected void Application_End()
        {
        }

        //protected void Application_Error()
        //{
        //}
    }
}

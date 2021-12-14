using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace MVCDynamic7amBatch
{
    //Conventional based Routing
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapMvcAttributeRoutes();

            routes.MapRoute(
                name: "Tom",
                url: "student/RockStar",
                defaults: new { controller = "New", action = "GetWishes", id = UrlParameter.Optional }
            );

            routes.MapRoute(
                name: "Jerry",
                url: "student/CharmStar",
                defaults: new { controller = "New", action = "getEmpId", id = UrlParameter.Optional }
            );

            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional }
            );
        }
    }
}

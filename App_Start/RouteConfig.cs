using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Routing;
using Microsoft.AspNet.FriendlyUrls;

namespace WebApplication1
{
    public static class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.MapPageRoute(
                "ClaimsByPageRoute",
                "Default/index/{index}/size/{size}",
                "~/Default.aspx"
            );
            routes.MapPageRoute(
                "ClaimDetails",
                "Detail/id/{id}",
                "~/Detail.aspx"
            );
            var settings = new FriendlyUrlSettings();
            settings.AutoRedirectMode = RedirectMode.Permanent;
            routes.EnableFriendlyUrls(settings);
        }
    }
}

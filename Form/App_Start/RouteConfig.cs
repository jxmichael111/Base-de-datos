using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Routing;
using Microsoft.AspNet.FriendlyUrls;

namespace Form
{
    public static class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            var settings = new FriendlyUrlSettings();
            //settings.AutoRedirectMode = RedirectMode.Permanent; // antes
            settings.AutoRedirectMode = RedirectMode.Off; // Cambiar por esta linea
            routes.EnableFriendlyUrls(settings);
        }
    }
}

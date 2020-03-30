using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebApplication1.Modules;

namespace WebApplication1
{
    public class AuthConfig
    {
        public static Func<UserManager<IdentityUser>> UserManagerFactory { get; set; }
        public static Func<RoleManager<IdentityRole>> RoleManagerFactory { get; set; }
        public static void Register()
        {
            UserManagerFactory = () => new UserManager<IdentityUser>(new UserStore<IdentityUser>(new ApplicationDbContext()));
            RoleManagerFactory = () => new RoleManager<IdentityRole>(new RoleStore<IdentityRole>(new ApplicationDbContext()));
        }
    }
}
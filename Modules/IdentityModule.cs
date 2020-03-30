using Microsoft.AspNet.Identity.EntityFramework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication1.Modules
{
    public class IdentityModule
    {
    }
    public class ApplicationDbContext : IdentityDbContext
    {
        public ApplicationDbContext() : base("ClaimDB")
        {

        }
    }

}
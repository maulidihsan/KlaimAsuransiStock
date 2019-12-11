using Autofac;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebAplication1.Model;
using WebAplication1.Services;

namespace WebAplication1.Modules
{
    public class ApplicationModule : Module
    {
        protected override void Load(ContainerBuilder builder)
        {
            builder.RegisterType<ClaimService>()
                   .As<IClaimService>()
                   .InstancePerRequest();
            builder.RegisterType<ClaimDB>()
                   .InstancePerLifetimeScope();
        }

    }
}
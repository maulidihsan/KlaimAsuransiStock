﻿using Autofac;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebApplication1.Model;
using WebApplication1.Services;

namespace WebApplication1.Modules
{
    public class ApplicationModule : Module
    {
        protected override void Load(ContainerBuilder builder)
        {
            builder.RegisterType<ClaimService>()
                   .As<IClaimService>()
                   .InstancePerRequest();
            builder.RegisterType<StatusService>()
                    .As<IStatusService>()
                    .InstancePerRequest();
            builder.RegisterType<CustomerFacingService>()
                    .As<ICustomerFacingService>()
                    .InstancePerRequest();
            builder.RegisterType<DocumentService>()
                    .As<IDocumentService>()
                    .InstancePerRequest();
            builder.RegisterType<NotificationService>()
                    .As<INotificationService>()
                    .InstancePerRequest();
            builder.RegisterType<ClaimDB>()
                   .InstancePerLifetimeScope();
        }

    }
}
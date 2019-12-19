namespace WebApplication1.Migrations
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Migrations;
    using System.Linq;
    using WebApplication1.Model;
    internal sealed class Configuration : DbMigrationsConfiguration<ClaimDB>
    {
        public Configuration()
        {
            AutomaticMigrationsEnabled = true;
        }

        protected override void Seed(ClaimDB context)
        {
            context.CustomerFacings.AddOrUpdate(x => x.Id,
                new CustomerFacing() { Id = 1, CFName = "Johannes",  CFEmail = "Johannes.Purwanto@stock.com", CFArea = "North Sumatera" },
                new CustomerFacing() { Id = 1, CFName = "Aprima", CFEmail = "Aprima.Dheo@stock.com", CFArea = "Southern Sumatera" },
                new CustomerFacing() { Id = 1, CFName = "Teguh", CFEmail = "Teguh.Widowati@stock.com", CFArea = "West Java, Jakarta" },
                new CustomerFacing() { Id = 1, CFName = "Oditia", CFEmail = "Oditia.Giyarini@stock.com", CFArea = "Papua Maluku" }
            );
            //  This method will be called after migrating to the latest version.

            //  You can use the DbSet<T>.AddOrUpdate() helper extension method 
            //  to avoid creating duplicate seed data.
        }
    }
}

namespace WebAplication1.Migrations
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Migrations;
    using System.Linq;

    internal sealed class Configuration : DbMigrationsConfiguration<WebAplication1.Model.ClaimDB>
    {
        public Configuration()
        {
            AutomaticMigrationsEnabled = true;
        }

        protected override void Seed(WebAplication1.Model.ClaimDB context)
        {
            context.CustomerFacings.AddOrUpdate(x => x.Id,
                new Model.CustomerFacing() { Id = 1, CFEmail = "Johannes.Purwanto@stock.com", CFArea = "North Sumatera" },
                new Model.CustomerFacing() { Id = 1, CFEmail = "Aprima.Dheo@stock.com", CFArea = "Southern Sumatera" },
                new Model.CustomerFacing() { Id = 1, CFEmail = "Teguh.Widowati@stock.com", CFArea = "West Java, Jakarta" },
                new Model.CustomerFacing() { Id = 1, CFEmail = "Oditia.Giyarini@stock.com", CFArea = "Papua Maluku" }
            );
            //  This method will be called after migrating to the latest version.

            //  You can use the DbSet<T>.AddOrUpdate() helper extension method 
            //  to avoid creating duplicate seed data.
        }
    }
}

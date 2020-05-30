namespace WebApplication1.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class RemoveUnncecesaryColumn : DbMigration
    {
        public override void Up()
        {
            DropColumn("dbo.Claims", "PICName");
            DropColumn("dbo.Claims", "PICPhone");
        }
        
        public override void Down()
        {
            AddColumn("dbo.Claims", "PICPhone", c => c.String());
            AddColumn("dbo.Claims", "PICName", c => c.String());
        }
    }
}

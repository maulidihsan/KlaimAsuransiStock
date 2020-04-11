namespace WebApplication1.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class AddCaseClosed : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.Claims", "CaseClosed", c => c.Boolean(nullable: false));
        }
        
        public override void Down()
        {
            DropColumn("dbo.Claims", "CaseClosed");
        }
    }
}

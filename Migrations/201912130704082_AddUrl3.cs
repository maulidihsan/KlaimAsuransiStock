namespace WebAplication1.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class AddUrl3 : DbMigration
    {
        public override void Up()
        {
            AlterColumn("dbo.Claims", "UpdatedAt", c => c.DateTime());
        }
        
        public override void Down()
        {
            AlterColumn("dbo.Claims", "UpdatedAt", c => c.DateTime(nullable: false));
        }
    }
}

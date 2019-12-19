namespace WebAplication1.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class AddUrl4 : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.Status", "CreatedAt", c => c.DateTime(nullable: false));
            AddColumn("dbo.Status", "UpdatedAt", c => c.DateTime());
            AlterColumn("dbo.Documents", "UpdatedAt", c => c.DateTime());
            AlterColumn("dbo.Notifications", "UpdatedAt", c => c.DateTime());
        }
        
        public override void Down()
        {
            AlterColumn("dbo.Notifications", "UpdatedAt", c => c.DateTime(nullable: false));
            AlterColumn("dbo.Documents", "UpdatedAt", c => c.DateTime(nullable: false));
            DropColumn("dbo.Status", "UpdatedAt");
            DropColumn("dbo.Status", "CreatedAt");
        }
    }
}

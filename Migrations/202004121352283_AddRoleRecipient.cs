namespace WebApplication1.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class AddRoleRecipient : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.Notifications", "RecipientRole", c => c.String());
        }
        
        public override void Down()
        {
            DropColumn("dbo.Notifications", "RecipientRole");
        }
    }
}

namespace WebApplication1.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class AddOriginalFilename : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.Documents", "OriginalFileName", c => c.String());
        }
        
        public override void Down()
        {
            DropColumn("dbo.Documents", "OriginalFileName");
        }
    }
}

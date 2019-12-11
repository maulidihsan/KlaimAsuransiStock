namespace WebAplication1.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class AddUrl1 : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.CustomerFacings",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        CFEmail = c.String(),
                        CFArea = c.String(),
                    })
                .PrimaryKey(t => t.Id);
            
            AddColumn("dbo.Claims", "CustomerFacing_Id", c => c.Int());
            CreateIndex("dbo.Claims", "CustomerFacing_Id");
            AddForeignKey("dbo.Claims", "CustomerFacing_Id", "dbo.CustomerFacings", "Id");
            DropColumn("dbo.Claims", "Area");
            DropColumn("dbo.Claims", "CFArea");
            DropColumn("dbo.Claims", "AmountLoss");
        }
        
        public override void Down()
        {
            AddColumn("dbo.Claims", "AmountLoss", c => c.Single(nullable: false));
            AddColumn("dbo.Claims", "CFArea", c => c.String());
            AddColumn("dbo.Claims", "Area", c => c.String());
            DropForeignKey("dbo.Claims", "CustomerFacing_Id", "dbo.CustomerFacings");
            DropIndex("dbo.Claims", new[] { "CustomerFacing_Id" });
            DropColumn("dbo.Claims", "CustomerFacing_Id");
            DropTable("dbo.CustomerFacings");
        }
    }
}

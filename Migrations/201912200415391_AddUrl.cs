namespace WebApplication1.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class AddUrl : DbMigration
    {
        public override void Up()
        {
            DropForeignKey("dbo.Claims", "CustomerFacing_Id", "dbo.CustomerFacings");
            DropIndex("dbo.Claims", new[] { "CustomerFacing_Id" });
            RenameColumn(table: "dbo.Claims", name: "CustomerFacing_Id", newName: "CustomerFacingId");
            AlterColumn("dbo.Claims", "CustomerFacingId", c => c.Int(nullable: false));
            CreateIndex("dbo.Claims", "CustomerFacingId");
            AddForeignKey("dbo.Claims", "CustomerFacingId", "dbo.CustomerFacings", "Id", cascadeDelete: true);
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.Claims", "CustomerFacingId", "dbo.CustomerFacings");
            DropIndex("dbo.Claims", new[] { "CustomerFacingId" });
            AlterColumn("dbo.Claims", "CustomerFacingId", c => c.Int());
            RenameColumn(table: "dbo.Claims", name: "CustomerFacingId", newName: "CustomerFacing_Id");
            CreateIndex("dbo.Claims", "CustomerFacing_Id");
            AddForeignKey("dbo.Claims", "CustomerFacing_Id", "dbo.CustomerFacings", "Id");
        }
    }
}

namespace WebApplication1.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class AddUrl : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.Claims",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        DistributorCode = c.String(),
                        Date = c.DateTime(nullable: false),
                        Distributor = c.String(),
                        Cause = c.String(),
                        PICName = c.String(),
                        PICPhone = c.String(),
                        CreatedAt = c.DateTime(nullable: false),
                        UpdatedAt = c.DateTime(),
                        CustomerFacing_Id = c.Int(),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.CustomerFacings", t => t.CustomerFacing_Id)
                .Index(t => t.CustomerFacing_Id);
            
            CreateTable(
                "dbo.CustomerFacings",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        CFName = c.String(),
                        CFEmail = c.String(),
                        CFArea = c.String(),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.Documents",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Type = c.Int(nullable: false),
                        FileName = c.String(),
                        FilePath = c.String(),
                        Approved = c.Boolean(nullable: false),
                        CreatedAt = c.DateTime(nullable: false),
                        UpdatedAt = c.DateTime(),
                        ClaimId = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Claims", t => t.ClaimId, cascadeDelete: true)
                .Index(t => t.ClaimId);
            
            CreateTable(
                "dbo.Notifications",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Message = c.String(),
                        Read = c.Boolean(nullable: false),
                        CreatedAt = c.DateTime(nullable: false),
                        UpdatedAt = c.DateTime(),
                        ClaimId = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Claims", t => t.ClaimId, cascadeDelete: true)
                .Index(t => t.ClaimId);
            
            CreateTable(
                "dbo.Status",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        StatusCode = c.String(),
                        Description = c.String(),
                        Done = c.Boolean(nullable: false),
                        ValidFrom = c.DateTime(nullable: false),
                        ValidUntil = c.DateTime(nullable: false),
                        CreatedAt = c.DateTime(nullable: false),
                        UpdatedAt = c.DateTime(),
                        ClaimId = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Claims", t => t.ClaimId, cascadeDelete: true)
                .Index(t => t.ClaimId);
            
            CreateTable(
                "dbo.LateSubmissions",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Reason = c.String(),
                        CreatedAt = c.DateTime(nullable: false),
                        StatusId = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Status", t => t.StatusId, cascadeDelete: true)
                .Index(t => t.StatusId);
            
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.LateSubmissions", "StatusId", "dbo.Status");
            DropForeignKey("dbo.Status", "ClaimId", "dbo.Claims");
            DropForeignKey("dbo.Notifications", "ClaimId", "dbo.Claims");
            DropForeignKey("dbo.Documents", "ClaimId", "dbo.Claims");
            DropForeignKey("dbo.Claims", "CustomerFacing_Id", "dbo.CustomerFacings");
            DropIndex("dbo.LateSubmissions", new[] { "StatusId" });
            DropIndex("dbo.Status", new[] { "ClaimId" });
            DropIndex("dbo.Notifications", new[] { "ClaimId" });
            DropIndex("dbo.Documents", new[] { "ClaimId" });
            DropIndex("dbo.Claims", new[] { "CustomerFacing_Id" });
            DropTable("dbo.LateSubmissions");
            DropTable("dbo.Status");
            DropTable("dbo.Notifications");
            DropTable("dbo.Documents");
            DropTable("dbo.CustomerFacings");
            DropTable("dbo.Claims");
        }
    }
}

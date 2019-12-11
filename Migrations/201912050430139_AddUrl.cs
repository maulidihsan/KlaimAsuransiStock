namespace WebAplication1.Migrations
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
                        Location = c.String(),
                        Cause = c.String(),
                        Area = c.String(),
                        CFArea = c.String(),
                        PICName = c.String(),
                        PICPhone = c.String(),
                        AmountLoss = c.Single(nullable: false),
                        CreatedAt = c.DateTime(nullable: false),
                        UpdatedAt = c.DateTime(nullable: false),
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
                        CreatedAt = c.DateTime(nullable: false),
                        UpdatedAt = c.DateTime(nullable: false),
                        Approved = c.Boolean(nullable: false),
                        Claim_Id = c.Int(),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Claims", t => t.Claim_Id)
                .Index(t => t.Claim_Id);
            
            CreateTable(
                "dbo.Notifications",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Message = c.String(),
                        Read = c.Boolean(nullable: false),
                        CreatedAt = c.DateTime(nullable: false),
                        UpdatedAt = c.DateTime(nullable: false),
                        Claim_Id = c.Int(),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Claims", t => t.Claim_Id)
                .Index(t => t.Claim_Id);
            
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
                        Claim_Id = c.Int(),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Claims", t => t.Claim_Id)
                .Index(t => t.Claim_Id);
            
            CreateTable(
                "dbo.LateSubmissions",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Reason = c.String(),
                        CreatedAt = c.DateTime(nullable: false),
                        Status_Id = c.Int(),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Status", t => t.Status_Id)
                .Index(t => t.Status_Id);
            
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.LateSubmissions", "Status_Id", "dbo.Status");
            DropForeignKey("dbo.Status", "Claim_Id", "dbo.Claims");
            DropForeignKey("dbo.Notifications", "Claim_Id", "dbo.Claims");
            DropForeignKey("dbo.Documents", "Claim_Id", "dbo.Claims");
            DropIndex("dbo.LateSubmissions", new[] { "Status_Id" });
            DropIndex("dbo.Status", new[] { "Claim_Id" });
            DropIndex("dbo.Notifications", new[] { "Claim_Id" });
            DropIndex("dbo.Documents", new[] { "Claim_Id" });
            DropTable("dbo.LateSubmissions");
            DropTable("dbo.Status");
            DropTable("dbo.Notifications");
            DropTable("dbo.Documents");
            DropTable("dbo.Claims");
        }
    }
}

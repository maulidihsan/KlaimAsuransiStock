namespace WebApplication1.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class RemoveFeedback : DbMigration
    {
        public override void Up()
        {
            DropForeignKey("dbo.Claims", "Feedback_Id", "dbo.Feedbacks");
            DropIndex("dbo.Claims", new[] { "Feedback_Id" });
            AddColumn("dbo.Claims", "Feedback", c => c.String());
            DropColumn("dbo.Claims", "Feedback_Id");
            DropTable("dbo.Feedbacks");
        }
        
        public override void Down()
        {
            CreateTable(
                "dbo.Feedbacks",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Text = c.String(),
                    })
                .PrimaryKey(t => t.Id);
            
            AddColumn("dbo.Claims", "Feedback_Id", c => c.Int());
            DropColumn("dbo.Claims", "Feedback");
            CreateIndex("dbo.Claims", "Feedback_Id");
            AddForeignKey("dbo.Claims", "Feedback_Id", "dbo.Feedbacks", "Id");
        }
    }
}

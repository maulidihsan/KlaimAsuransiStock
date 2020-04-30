namespace WebApplication1.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class AddFeedback : DbMigration
    {
        public override void Up()
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
            AddColumn("dbo.Documents", "Rejected", c => c.Boolean(nullable: false));
            CreateIndex("dbo.Claims", "Feedback_Id");
            AddForeignKey("dbo.Claims", "Feedback_Id", "dbo.Feedbacks", "Id");
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.Claims", "Feedback_Id", "dbo.Feedbacks");
            DropIndex("dbo.Claims", new[] { "Feedback_Id" });
            DropColumn("dbo.Documents", "Rejected");
            DropColumn("dbo.Claims", "Feedback_Id");
            DropTable("dbo.Feedbacks");
        }
    }
}

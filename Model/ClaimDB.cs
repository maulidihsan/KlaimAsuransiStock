using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;

namespace WebAplication1.Model
{
    public class ClaimDB : DbContext
    {
        public ClaimDB() : base("ClaimDBContext")
        {

        }
        public DbSet<Claim> Claims { get; set; }
        public DbSet<Status> Statuses { get; set; }
        public DbSet<Document> Documents { get; set; }
        public DbSet<Notification> Notifications { get; set; }
        public DbSet<LateSubmission> LateSubmissions { get; set; }
    }
}
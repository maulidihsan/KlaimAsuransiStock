using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations.Schema;

namespace WebApplication1.Model
{
    public class Claim
    {
        public Claim()
        {
            CreatedAt = DateTime.Now;
        }
        public int Id { get; set; }
        public string DistributorCode { get; set; }

        public DateTime Date { get; set; }
        public string Distributor { get; set; }
        public string Cause { get; set; }
        public string PICName { get; set; }
        public string PICPhone { get; set; }
        public DateTime CreatedAt { get; set; }
        public Nullable<DateTime> UpdatedAt { get; set; }
        public int CustomerFacingId { get; set; }
        public virtual CustomerFacing CustomerFacing { get; set; }
        public virtual ICollection<Status> Statuses { get; set; }
        public virtual ICollection<Notification> Notifications { get; set; }
        public virtual ICollection<Document> Documents { get; set; }

        [NotMapped]
        public Status LatestStatus { get; set; }
    }
}
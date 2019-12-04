using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebAplication1.Model
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
        public string Location { get; set; }
        public string Cause { get; set; }
        public string Area { get; set; }
        public string CFArea { get; set; }
        public string PICName { get; set; }
        public string PICPhone { get; set; }
        public float AmountLoss { get; set; }
        public DateTime CreatedAt { get; set; }
        public DateTime UpdatedAt { get; set; }

        public virtual ICollection<Status> Statuses { get; set; }
        public virtual ICollection<Notification> Notifications { get; set; }
        public virtual ICollection<Document> Documents { get; set; }

    }
}
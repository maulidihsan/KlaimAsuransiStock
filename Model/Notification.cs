using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication1.Model
{
    public class Notification
    {
        public Notification()
        {
            CreatedAt = DateTime.Now;
        }
        public int Id { get; set; }
        public string Message { get; set; }
        public bool Read { get; set; }
        public DateTime CreatedAt { get; set; }
        public Nullable<DateTime> UpdatedAt { get; set; }
        public int ClaimId { get; set; }
        public virtual Claim Claim { get; set; }
    }
}
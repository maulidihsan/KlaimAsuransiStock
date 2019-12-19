using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication1.Model
{
    public class LateSubmission
    {
        public LateSubmission()
        {
            CreatedAt = DateTime.Now;
        }
        public int Id { get; set; }
        public string Reason { get; set; }
        public DateTime CreatedAt { get; set; }
        public int StatusId { get; set; }
        public virtual Status Status { get; set; }
    }
}
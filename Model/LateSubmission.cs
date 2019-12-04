using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebAplication1.Model
{
    public class LateSubmission
    {
        public int Id { get; set; }
        public string Reason { get; set; }
        public DateTime CreatedAt { get; set; }
        public virtual Status Status { get; set; }
    }
}
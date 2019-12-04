using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebAplication1.Model
{
    public class Status
    {
        public int Id { get; set; }
        public string StatusCode { get; set; }
        public string Description { get; set; }
        public bool Done { get; set; }
        public DateTime ValidFrom { get; set; }
        public DateTime ValidUntil { get; set; }
        public virtual Claim Claim { get; set; }
        public virtual ICollection<LateSubmission> LateSubmissions { get; set; }
    }
}
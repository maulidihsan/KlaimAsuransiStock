using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebAplication1.Model
{
    public class Notification
    {
        public int Id { get; set; }
        public string Message { get; set; }
        public bool Read { get; set; }
        public DateTime CreatedAt { get; set; }
        public DateTime UpdatedAt { get; set; }
        public virtual Claim Claim { get; set; }
    }
}
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using WebApplication1.Model;

namespace WebApplication1.Services
{
    public class StatusService : IStatusService
    {
        private ClaimDB db;
        public StatusService(ClaimDB db)
        {
            this.db = db;
        }

        public Status GetStatus(int IdKlaim)
        {
            return db.Statuses.OrderByDescending(s => s.Id).FirstOrDefault(s => s.Claim.Id == IdKlaim);
        }

        public Status GetById(int id)
        {
            return db.Statuses.Where(s => s.Id == id).FirstOrDefault();
        }

        public void CreateStatus(Status status)
        {
            db.Statuses.Add(status);
            db.SaveChanges();
        }

        public void UpdateStatus(Status status)
        {
            status.UpdatedAt = DateTime.Now;
            db.Entry(status).State = EntityState.Modified;
            db.SaveChanges();
        }

        public void RemoveStatus(Status status)
        {
            db.Statuses.Remove(status);
            db.SaveChanges();
        }

        public void Dispose()
        {
            db.Dispose();
        }
    }
}
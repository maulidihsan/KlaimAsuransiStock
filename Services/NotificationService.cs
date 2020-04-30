using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using WebApplication1.Model;

namespace WebApplication1.Services
{
    public class NotificationService : INotificationService
    {
        private ClaimDB db;
        public NotificationService(ClaimDB db)
        {
            this.db = db;
        }

        public void CreateNotification(Notification notif)
        {
            db.Notifications.Add(notif);
            db.SaveChanges();
        }
        public IEnumerable<Notification> GetNotifications(List<string> recipientRoles)
        {
            return db.Notifications.Where(x => recipientRoles.Any(y => x.RecipientRole.Contains(y))).ToList();
        }
        public void UpdateNotification(Notification update)
        {
            db.Entry(update).State = EntityState.Modified;
            db.SaveChanges();
        }

        public void RemoveNotification(Notification notif)
        {
            db.Notifications.Remove(notif);
            db.SaveChanges();
        }
        public Notification NotificationDetail(int id)
        {
            return db.Notifications.Find(id);
        }
        public void Dispose()
        {
            db.Dispose();
        }
    }
}
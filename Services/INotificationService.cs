using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WebApplication1.Model;

namespace WebApplication1.Services
{
    public interface INotificationService : IDisposable
    {
        void CreateNotification(Notification notif);
        IEnumerable<Notification> GetNotifications(List<string> recipientRoles);
        void UpdateNotification(Notification notif);
        void RemoveNotification(Notification notif);
        Notification NotificationDetail(int id);
    }
}

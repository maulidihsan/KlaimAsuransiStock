using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Security.Principal;
using System.Web.UI.WebControls;
using WebApplication1.Services;
using WebApplication1.Model;
using Microsoft.AspNet.Identity.EntityFramework;

namespace WebApplication1
{
    public partial class SiteMaster : MasterPage
    {
        public INotificationService notificationService { get; set; }
        protected List<Notification> Notifications { get; set; }
        protected Profile CurrentUser { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!HttpContext.Current.User.Identity.IsAuthenticated)
            {
                Response.Redirect("/Login");
            }

            var userId = HttpContext.Current.User.Identity.GetUserId();
            var userManager = AuthConfig.UserManagerFactory();
            var userRoles = userManager.GetRoles(userId).ToList();
            Notifications = notificationService.GetNotifications(userRoles).ToList();
            NotificationListView.DataSource = Notifications;
            NotificationListView.DataBind();
            var user = userManager.FindById(userId);
            CurrentUser = new Profile()
            {
                Name = user.UserName,
                Email = user.Email
            };
        }

        protected void SignOut_Click(object sender, EventArgs e)
        {
            var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;
            authenticationManager.SignOut();
            Response.Redirect("~/Login.aspx");
        }
        protected void Read_Click(object sender, EventArgs e)
        {
            LinkButton btn = sender as LinkButton;
            var command = btn.CommandArgument;
            var notif = notificationService.NotificationDetail(Convert.ToInt32(command));
            notif.Read = true;
            notificationService.UpdateNotification(notif);
        }
    }
}
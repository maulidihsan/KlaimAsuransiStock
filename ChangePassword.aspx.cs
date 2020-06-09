using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;

namespace WebApplication1
{
    public partial class ChangePassword : System.Web.UI.Page
    {
        private static UserManager<IdentityUser> userManager;
        protected void Page_Load(object sender, EventArgs e)
        {
            userManager = AuthConfig.UserManagerFactory();
        }

        protected void ChangePassword_Click(object sender, EventArgs e)
        {
            if(Password.Text != ConfirmPassword.Text)
            {
                StatusMessage.Text = "Please reconfirm password";
            }
            else
            {
                var userId = HttpContext.Current.User.Identity.GetUserId();
                IdentityResult result = userManager.ChangePassword(userId, CurrentPassword.Text, Password.Text);
                if (result.Succeeded)
                {
                    var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;
                    authenticationManager.SignOut();
                    Response.Redirect("~/Login.aspx");
                }
                else
                {
                    StatusMessage.Text = result.Errors.FirstOrDefault();
                }
            }
           
        }
    }
}
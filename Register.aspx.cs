using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.Owin.Security;
using WebApplication1.Modules;

namespace WebApplication1
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            List<string> roles = new List<string>() { "Admin", "CF", "FBP", "AON", "QC" };
            if (!IsPostBack)
            {
                RoleDropdown.DataSource = roles;
                RoleDropdown.DataBind();
            }
        }

        protected void CreateUser_Click(object sender, EventArgs e)
        {
            var userManager = AuthConfig.UserManagerFactory();
            var roleManager = AuthConfig.RoleManagerFactory();
            var user = new IdentityUser() { UserName = Name.Text, Email = Email.Text };
            if (!roleManager.RoleExists(RoleDropdown.SelectedValue))
            {
                IdentityResult IdRoleResult = roleManager.Create(new IdentityRole { Name = RoleDropdown.SelectedValue });
            }
            IdentityResult result = userManager.Create(user, Password.Text);

            if (result.Succeeded)
            {
                var addToRole = userManager.AddToRole(userManager.FindByEmail(user.Email).Id, RoleDropdown.SelectedValue);
                var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;
                var userIdentity = userManager.CreateIdentity(user, DefaultAuthenticationTypes.ApplicationCookie);
                authenticationManager.SignIn(new AuthenticationProperties() { }, userIdentity);
                Response.Redirect("~/Login.aspx");
            }
            else
            {
                StatusMessage.Text = result.Errors.FirstOrDefault();
            }
        }
    }
}
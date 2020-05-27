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
using WebApplication1.Model;

namespace WebApplication1
{
    public partial class Register : System.Web.UI.Page
    {
        private UserManager<IdentityUser> userManager;
        private RoleManager<IdentityRole> roleManager;
        protected void Page_Load(object sender, EventArgs e)
        {
            List<string> roles = new List<string>() { "Admin", "Treasury", "FBP", "AON", "QC", "LogisticDispo" };
            if (!IsPostBack)
            {
                if (!User.IsInRole("Admin"))
                {
                    Response.Redirect("/Default.aspx");
                }
                RoleDropdown.DataSource = roles;
                RoleDropdown.DataBind();

                this.userManager = AuthConfig.UserManagerFactory();
                this.roleManager = AuthConfig.RoleManagerFactory();
                var user = this.userManager.Users.ToList();

                List<Profile> listUserProfile = new List<Profile>();
                foreach (var u in user)
                {
                    List<string> userRole = new List<string>();
                    foreach (var r in u.Roles)
                    {
                        userRole.Add(r.ToString());
                    }
                    
                    Profile p = new Profile
                    {
                        Name = u.UserName,
                        Email = u.Email,
                        Roles = userRole
                    };
                    listUserProfile.Add(p);
                }
                UserListView.DataSource = listUserProfile;
                UserListView.DataBind();
            }
        }

        protected void CreateUser_Click(object sender, EventArgs e)
        {
            var user = new IdentityUser() { UserName = Name.Text, Email = Email.Text };
            if (!this.roleManager.RoleExists(RoleDropdown.SelectedValue))
            {
                IdentityResult IdRoleResult = roleManager.Create(new IdentityRole { Name = RoleDropdown.SelectedValue });
            }
            IdentityResult result = this.userManager.Create(user, Password.Text);

            if (result.Succeeded)
            {
                var addToRole = this.userManager.AddToRole(this.userManager.FindByEmail(user.Email).Id, RoleDropdown.SelectedValue);
            }
            else
            {
                StatusMessage.Text = result.Errors.FirstOrDefault();
            }
        }
        protected void DeleteUser_Click(object sender, EventArgs e)
        {
            Button btn = sender as Button;
            var userToDelete = this.userManager.FindByEmail(btn.CommandArgument);
            this.userManager.Delete(userToDelete);
            Response.Redirect(Request.RawUrl);
        }
    }
}
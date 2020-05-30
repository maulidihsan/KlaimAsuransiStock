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
        private static UserManager<IdentityUser> userManager;
        private static RoleManager<IdentityRole> roleManager;
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

                userManager = AuthConfig.UserManagerFactory();
                roleManager = AuthConfig.RoleManagerFactory();
                var user = userManager.Users.ToList();

                List<Profile> listUserProfile = new List<Profile>();
                foreach (var u in user)
                {
                    var role = userManager.GetRoles(u.Id);
                    
                    Profile p = new Profile
                    {
                        Name = u.UserName,
                        Email = u.Email,
                        Roles = role.ToList()
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
            if (!roleManager.RoleExists(RoleDropdown.SelectedValue))
            {
                IdentityResult IdRoleResult = roleManager.Create(new IdentityRole { Name = RoleDropdown.SelectedValue });
            }
            IdentityResult result = userManager.Create(user, Password.Text);

            if (result.Succeeded)
            {
                var addToRole = userManager.AddToRole(userManager.FindByEmail(user.Email).Id, RoleDropdown.SelectedValue);
            }
            else
            {
                StatusMessage.Text = result.Errors.FirstOrDefault();
            }
            Response.Redirect(Request.RawUrl);
        }
        protected void DeleteUser_Click(object sender, EventArgs e)
        {
            Button btn = sender as Button;
            var userToDelete = userManager.FindByEmail(btn.CommandArgument);
            userManager.Delete(userToDelete);
            Response.Redirect(Request.RawUrl);
        }
    }
}
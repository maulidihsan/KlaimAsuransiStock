using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication1.Model;
using WebApplication1.Services;

namespace WebApplication1
{
    public partial class RegisterCF : System.Web.UI.Page
    {
        public ICustomerFacingService customerFacingService { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!User.IsInRole("Admin"))
                {
                    Response.Redirect("/Default.aspx");
                }
                List<CustomerFacing> listCF = this.customerFacingService.GetCF().ToList();
                CFListView.DataSource = listCF;
                CFListView.DataBind();
            }
        }

        protected void CreateCF_Click(object sender, EventArgs e)
        {
            CustomerFacing newCF = new CustomerFacing
            {
                CFName = tbName.Text,
                CFArea = tbLokasiCF.Text,
                CFEmail = tbEmail.Text
            };
            customerFacingService.AddCF(newCF);
            Response.Redirect(Request.RawUrl);
        }

        protected void DeleteCF_Click(object sender, EventArgs e)
        {
            Button btn = sender as Button;
            this.customerFacingService.RemoveCF(Convert.ToInt32(btn.CommandArgument));
            Response.Redirect(Request.RawUrl);
        }
    }
}
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication1.Model;
using WebApplication1.Services;

namespace WebApplication1
{
    public partial class RaiseClaim : Page
    {
        public IClaimService claimService { get; set; }
        public ICustomerFacingService customerFacingService { get; set; }
        public static List<CustomerFacing> listCF { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                listCF = this.customerFacingService.GetCF().ToList();
                CFDropdown.DataSource = listCF;
                CFDropdown.DataTextField = "CFArea";
                CFDropdown.DataValueField = "Id";
                CFDropdown.DataBind();
            }
        }
        protected void cfSelected(object sender, EventArgs e)
        {
            CustomerFacing selected = listCF.Find(item => item.Id.ToString() == CFDropdown.SelectedValue);
            tbCF.Text = selected.CFName + " <" + selected.CFEmail + ">";
        }

        protected void Submit_Click(Object sender, EventArgs e)
        {
            Claim klaimBaru = new Claim
            {
                DistributorCode = tbKode.Text,
                Date = Convert.ToDateTime(tbTanggal.Text),
                Distributor = tbNama.Text,
                Cause = tbInsiden.Text,
                PICName = "Coba",
                PICPhone = "080800880",
                CustomerFacingId = Convert.ToInt32(CFDropdown.SelectedValue)
            };
            claimService.CreateClaim(klaimBaru);
            Response.Redirect("Default.aspx");
        }
    }
}
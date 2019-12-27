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
    public partial class Detail : System.Web.UI.Page
    {
        public IClaimService claimService { get; set; }
        protected Claim claimDetail { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.RouteData.Values.Keys.Contains("id"))
            {
                Response.Redirect("Default.aspx");
            }
            if (!IsPostBack)
            {
                var id = Convert.ToInt32(Page.RouteData.Values["id"]);
                claimDetail = this.claimService.ClaimDetails(id);
            }
        }
    }
}
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.Owin.Security;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication1.Model;
using WebApplication1.Services;
using WebApplication1.ViewModel;

namespace WebApplication1
{
    public partial class _Default : Page
    {
        public IClaimService claimService { get; set; }
        public const int DefaultPageIndex = 0;
        public const int DefaultPageSize = 10;
        protected PaginatedItemsViewModel<Claim> listClaim { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!HttpContext.Current.User.Identity.IsAuthenticated)
                {
                    Response.Redirect("/Login");
                }

                if (User.IsInRole("FBP") || User.IsInRole("Admin"))
                {
                    BtnRaise.Visible = true;
                }

                if (PaginationParamsAreSet())
                {
                    var size = Convert.ToInt32(Page.RouteData.Values["size"]);
                    var index = Convert.ToInt32(Page.RouteData.Values["index"]);
                    listClaim = this.claimService.GetClaimPaginated(size, index);
                }
                else
                {
                    listClaim = this.claimService.GetClaimPaginated(DefaultPageSize, DefaultPageIndex);
                }
                ClaimListView.DataSource = listClaim.Data;
                ClaimListView.DataBind();
                ConfigurePagination();
            }
        }
        private bool PaginationParamsAreSet()
        {
            return Page.RouteData.Values.Keys.Contains("size") && Page.RouteData.Values.Keys.Contains("index");
        }

        private void ConfigurePagination()
        {
            PaginationNext.NavigateUrl = GetRouteUrl("ClaimsByPageRoute", new { index = listClaim.ActualPage + 1, size = listClaim.ItemsPerPage });
            PaginationNext.Visible = listClaim.ActualPage < listClaim.TotalPages - 1 ? true : false;
           
            PaginationPrevious.NavigateUrl = GetRouteUrl("ClaimsByPageRoute", new { index = listClaim.ActualPage - 1, size = listClaim.ItemsPerPage });
            PaginationPrevious.Visible = listClaim.ActualPage > 0 ? true : false;
        }

        protected void Delete_Click(object sender, EventArgs e)
        {
            Button btn = sender as Button;
            this.claimService.RemoveClaim(Convert.ToInt32(btn.CommandArgument.ToString()));
            Response.Redirect(Request.RawUrl);
        }

        protected void ClaimListView_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            var item = (ListViewItem) e.Item;

            var button = (Button)item.FindControl("BtnDelete");
            button.Visible = false;
            if (User.IsInRole("FBP") || User.IsInRole("Admin"))
            {
                button.Visible = true;
            }   
        }
    }
}
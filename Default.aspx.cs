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
        private bool PaginationParamsAreSet()
        {
            return Page.RouteData.Values.Keys.Contains("size") && Page.RouteData.Values.Keys.Contains("index");
        }

        private void ConfigurePagination()
        {
            PaginationNext.NavigateUrl = GetRouteUrl("ProductsByPageRoute", new { index = listClaim.ActualPage + 1, size = listClaim.ItemsPerPage });
            PaginationNext.Visible = listClaim.ActualPage < listClaim.TotalPages - 1 ? true : false;
           
            PaginationPrevious.NavigateUrl = GetRouteUrl("ProductsByPageRoute", new { index = listClaim.ActualPage - 1, size = listClaim.ItemsPerPage });
            PaginationPrevious.Visible = listClaim.ActualPage > 0 ? true : false;
        }
    }
}
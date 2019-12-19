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
        protected void Page_Load(object sender, EventArgs e)
        {
            List<CustomerFacing> listCF = this.customerFacingService.GetCF().ToList();
            CFDropdown.DataSource = dt;
            CFDropdown.DataTextField = "CFArea";
            CFDropdown.DataValueField = "Id";
            CFDropdown.DataBind();
        }

        private DataTable ToDataTable<T>(List<T> items)
        {
            var tb = new DataTable(typeof(T).Name);

            PropertyInfo[] props = typeof(T).GetProperties(BindingFlags.Public | BindingFlags.Instance);

            foreach (var prop in props)
            {
                tb.Columns.Add(prop.Name, prop.PropertyType);
            }

            foreach (var item in items)
            {
                var values = new object[props.Length];
                for (var i = 0; i < props.Length; i++)
                {
                    values[i] = props[i].GetValue(item, null);
                }

                tb.Rows.Add(values);
            }

            return tb;
        }
    }
}
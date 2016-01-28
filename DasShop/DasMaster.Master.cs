using System;
using System.Collections.Generic;
using System.Drawing;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DasDAL;
using DasShop.Models;

namespace DasShop
{
    public partial class DasMaster : System.Web.UI.MasterPage
    {
        DasDBDataContext dbcontext = new DasDBDataContext();
        public int MasterCartTotalItems;
        public decimal MasterCartTotalCost;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                GetInformation();
            }
            catch (Exception exception)
            {
                Global.WriteToDB(dbcontext, exception);
            }
        }

        private void GetInformation()
        {
            if (!IsPostBack)
            {
                var items = GetCategories();
                items.Insert(0, new Category {CategoryName = "KATEGORI", CategoryID = -1});

                drp_Category.DataSource = items;
                drp_Category.DataTextField = "CategoryName";
                drp_Category.DataValueField = "CategoryID";
                drp_Category.DataBind();

                UpdateCart();
            }
        }

        private List<Category> GetCategories()
        {
            var query = (
                from c in dbcontext.Categories
                select c).ToList();
            return query.ToList();
        }

        protected void drp_Category_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            if (drp_Category.SelectedValue == "-1")
            {
                //return;
            }
            Response.Redirect("CategoryPage.aspx?id=" + drp_Category.SelectedValue);

        }


        public void UpdateCart()
        {
            MasterCartTotalCost = CartManger.GetTotalCost();
            MasterCartTotalItems = CartManger.GetProductCount();
            string cartTotalCostNoDigits = string.Format("{0:####.##}", MasterCartTotalCost);

            if (MasterCartTotalItems != 0)
            {
                lblTotalProducts.Text = MasterCartTotalItems + " varor ";
                lblTotalCost.Text = cartTotalCostNoDigits + " SEK";
                if (MasterCartTotalItems == 1)
                {
                    lblTotalProducts.Text = MasterCartTotalItems + " vara ";
                }
            }

            hlShoppingbag.Enabled = (MasterCartTotalItems > 0) ? true : false;
        }

    }
}
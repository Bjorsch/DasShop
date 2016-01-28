using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DasDAL;
using Label = System.Reflection.Emit.Label;

namespace DasShop
{
    public partial class Index : System.Web.UI.Page
    {

        DasDBDataContext db = new DasDBDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            repProductGroups.DataSource = GetProductGroups();
            repProductGroups.DataBind();
            
        }
        

        public List<ProductGroup> GetProductGroups()
        {
            var data = db.Categories
                .Select(a => new ProductGroup
                {
                    Headline = a.CategoryName,
                    LogoImg = a.CategoryImage,
                    Products = a.ProductRelCategories
                        .Where(b => b.Product.ProductImage != "")
                        .Select(b => b.Product)
                        .ToList()
                })
                .OrderByDescending(a => a.Headline)
                .ToList();

            return data;
        }

        protected void repProductGroups_OnItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                var repProducts = e.Item.FindControl("repProducts") as Repeater;
                var data = e.Item.DataItem as ProductGroup;

                if (data.Products.Count == 0)
                {
                    e.Item.Visible = false;
                    return;
                }

                repProducts.DataSource = data.Products;
                repProducts.DataBind();
            }
        }
    }

    public class ProductGroup
    {
        public string Headline { get; set; }
        public List<Product> Products { get; set; }
        public string LogoImg { get; set; }
    }
}
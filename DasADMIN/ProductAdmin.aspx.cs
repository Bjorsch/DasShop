using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DasDAL;
using DasADMIN.Repo;

namespace DasShop
{
    public partial class ProductAdmin : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            RepProducts.DataSource = ProductRepo.GetAllProducts(Master.db);
            RepProducts.DataBind();
            RepProductWithoutCategory.DataSource = ProductRepo.GetProductsWithoutCategories(Master.db);
            RepProductWithoutCategory.DataBind();
        }
    }
}
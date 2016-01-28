using DasDAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DasADMIN.Repo;

namespace DasADMIN
{
    public partial class ProductCreate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnCreate_OnClick(object sender, EventArgs e)
        {
            var dbcontext = Master.db;

            if (!Page.IsValid)
            {
                return;
            }

            ProductRepo.InsertProduct(
               dbcontext,
               TextBoxName.Text,
               TextBoxNumber.Text,
               (Convert.ToDecimal(TextBoxPrice.Text)),
               TextBoxImage.Text,
               TextBoxDescription.Text,
               TextBoxImageBox.Text,
               TextBoxImageOOBox.Text
               );

            var lastID = dbcontext.Products.Max(p => p.ProductID); 

            ProdRelCatRepo.InsertRelCategory(lastID, (Convert.ToInt32(DDLCat.SelectedValue)));
            Response.Redirect("ProductAdmin.aspx");
        }
    }
}
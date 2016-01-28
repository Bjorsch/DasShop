using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using DasADMIN.Repo;
using DasDAL;
using System.Data;

namespace DasADMIN
{
    public partial class ProductCrud : System.Web.UI.Page
    {
        private DasDBDataContext dbcontext = new DasDBDataContext();

        public int productID
        {
            get
            {
                var idRaw = Request.QueryString["id"];
                int id;
                var res = int.TryParse(idRaw, out id);

                if (res)
                {
                    return id;
                }
                return 0;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var item = dbcontext.Products.Where(a => a.ProductID == productID).FirstOrDefault();
                GetSelectedProduct();
                if (item.ProductRelCategories.Any())
                {
                        GetTheSelectedProductCategory();                             
                }
                else
                {
                        GetAllCategories(Master.db);   
                }
            }
        }

        protected void BtnUpdate_OnClick(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
                return;
            }

            ProductRepo.UpdateProduct(
                Master.db,
                productID,
                prodName.Text,
                prodNumber.Text,
                (Convert.ToDecimal(prodPrice.Text)),
                prodImage.Text,
                prodDescription.Text,
                prodImageBox.Text,
                prodImageOOBox.Text
            );

            var exists = dbcontext.ProductRelCategories.Any(a => a.ProductID == productID);
            if (exists)
            {
                ProdRelCatRepo.UpdateRelCategory(productID, (Convert.ToInt32(ProductCrudDDL.SelectedValue)));
            }
            else
            {
                ProdRelCatRepo.InsertRelCategory(productID, (Convert.ToInt32(ProductCrudDDL.SelectedValue)));
            }
            Response.Redirect("ProductAdmin.aspx");
            
        }

        protected void BtnDelete_OnClick(object sender, EventArgs e)
        {
            ProductRepo.DeleteProduct(Master.db, productID);
            Response.Redirect("ProductAdmin.aspx");
        }

        public void GetSelectedProduct()
        {
            var item = (from prod in Master.db.Products
                        where prod.ProductID == productID
                        select
                            new
                            {
                                prodName = prod.ProductName,
                                prodNumber = prod.ProductNumber,
                                prodPrice = prod.ProductPrice,
                                prodImage = prod.ProductImage,
                                prodDescription = prod.ProductDescription,
                                prodImageBox = prod.ProductImageBox,
                                prodImageOOBox = prod.ProductImageOOBox
                            }).FirstOrDefault();
            if (item == null)
            {
                Response.Redirect("ProductAdmin.aspx");
                return;
            }
            prodName.Text = item.prodName;
            prodNumber.Text = item.prodNumber;
            prodPrice.Text = item.prodPrice.ToString();
            prodImage.Text = item.prodImage;
            prodDescription.Text = item.prodDescription;
            prodImageBox.Text = item.prodImageBox;
            prodImageOOBox.Text = item.prodImageOOBox;
        }

        public void GetTheSelectedProductCategory()
        {
            var categories = Master.db.Categories.Select(a => new { dropdownID = a.CategoryID, dropdownName = a.CategoryName });
            var item = (from cat in Master.db.ProductRelCategories
                        where cat.ProductID == productID
                        select new
                        {
                            dropdownID = cat.CategoryID,
                            dropdownName = cat.Category.CategoryName
                        }).FirstOrDefault();

            ProductCrudDDL.DataValueField = "dropdownID";
            ProductCrudDDL.DataTextField = "dropdownName";
            ProductCrudDDL.DataSource = categories;
            ProductCrudDDL.DataBind();
            ProductCrudDDL.SelectedValue = item.dropdownID.ToString();
        }

        public void GetAllCategories(DasDBDataContext dbcontext)
        {
            var categories = Master.db.Categories.Select(a => new { dropdownID = a.CategoryID, dropdownName = a.CategoryName });

            ProductCrudDDL.DataValueField = "dropdownID";
            ProductCrudDDL.DataTextField = "dropdownName";
            ProductCrudDDL.DataSource = categories;
            ProductCrudDDL.DataBind();
            ProductCrudDDL.SelectedValue = ProductCrudDDL.SelectedItem.Value;
        }
    }
}
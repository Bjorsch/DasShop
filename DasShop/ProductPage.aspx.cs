using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DasDAL;
using DasShop.Models;

namespace DasShop
{
    public partial class ProductPage : System.Web.UI.Page
    {
        private DasDBDataContext dbcontext = new DasDBDataContext();

        public int ProdID
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
            decimal Moms = 0.25m;
            GetAllProducts();
            GetAllProductInfoFromSameCategory();
            var TotalInfo = dbcontext.Products.SingleOrDefault(p => p.ProductID == ProdID);
            var TotalPrice = TotalInfo.ProductPrice;
            ProductVAT.Text = "(Moms: " + (TotalPrice*Moms).ToString("####.##") + " SEK)";
        }

        private void GetAllProducts()
        {
            var item = (from prc in dbcontext.ProductRelCategories
                        where prc.ProductID == ProdID
                        select new
                        {
                            CatID = prc.Category.CategoryID,
                            CatName = prc.Category.CategoryName,
                            ProdName = prc.Product.ProductName,
                            ProdNumber = prc.Product.ProductNumber,
                            CatImg = prc.Category.CategoryImage,
                            ProdImg = prc.Product.ProductImage,
                            ProdBoxImg = prc.Product.ProductImageBox,
                            ProdOOBoxImg = prc.Product.ProductImageOOBox,
                            ProdDescr = prc.Product.ProductDescription,
                            ProdPrice = prc.Product.ProductPrice
                            
                        }).FirstOrDefault();

            if (item == null)
            {
                Response.Redirect("SecondIndex.aspx");
                return;
            }

            ProductImageBoxBig.ImageUrl = "/Media/Images/ProductBoxImages/" + item.ProdBoxImg + ".png";
            ProductImageOOBoxBig.ImageUrl = "/Media/Images/ProductOutOfBoxImages/" + item.ProdOOBoxImg + ".png";
            ProductImageBoxSmall.ImageUrl = "/Media/Images/ProductBoxImages/" + item.ProdBoxImg + ".png";
            ProductImageOOBoxSmall.ImageUrl = "/Media/Images/ProductOutOfBoxImages/" + item.ProdOOBoxImg + ".png";

            LitProductName.Text = item.ProdName;
            LitProductNumber.Text = "Artikelnr: " + item.ProdNumber;
            LitProductDescription.Text = item.ProdDescr;

            CategoryImageInCart.ImageUrl = "/Media/Images/CategoryLogo/" + item.CatImg + ".png";
            ProductPrice.Text = item.ProdPrice.ToString("####.##") + " SEK";
            CategoryLink.NavigateUrl = "CategoryPage.aspx?id=" + item.CatID;
        }

        private void GetAllProductInfoFromSameCategory()
        {
            var categoryID = dbcontext.ProductRelCategories
                .Where(a => a.ProductID == ProdID)
                .Select(a => a.CategoryID)
                .First();

            var itemx = dbcontext.ProductRelCategories
                .Where(a => a.CategoryID == categoryID && a.ProductID != ProdID)
                .Select(a => new ProductEntity
                {
                    ProductID = a.ProductID,
                    ProductImageBox = a.Product.ProductImageBox,
                    CategoryName = a.Product.ProductRelCategories
                        .Select(b => b.Category.CategoryName)
                        .First(),
                    ProductName = a.Product.ProductName,
                    ProductPrice = a.Product.ProductPrice,
                });
            RelatedProductRepeater.DataSource = itemx;
            RelatedProductRepeater.DataBind();            
        }
        protected void AddToCart_Click(object sender, EventArgs e)
        {
            var item = (from prc in dbcontext.ProductRelCategories
                        where prc.ProductID == ProdID
                        select new
                        {
                            ProdName = prc.Product.ProductName,
                            ProdPrice = prc.Product.ProductPrice
                           
                        }).First();

            CartManger.Add(ProdID, item.ProdName, Convert.ToInt32(DropDownQuantity.SelectedValue), item.ProdPrice);
            Response.Redirect(Request.RawUrl);
        }
    }
}






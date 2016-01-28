using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
//using System.Web.UI.WebControls;
using DasDAL;

namespace DasShop
{
    public partial class CategoryPage : System.Web.UI.Page
    {
        protected string ParallaxImg;
        private readonly DasDBDataContext dbcontext = new DasDBDataContext();
        public static int calculated;
        
        public int TheID
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
            set { }
        }

        public int ThePage
        {
            get
            {
                var pageRaw = Request.QueryString["page"];
                int page;
                var res = int.TryParse(pageRaw, out page);

                if (res)
                {
                    return page;
                }
                return 0;
            }
            set { }
        }

        public void Page_Load(object sender, EventArgs e)
        {
            try
            {
                GetInformation();

            }
            catch (Exception ex)
            {
                Global.WriteToDB(dbcontext, ex);
            }
        }

        public void GetInformation()
        {
            if (ThePage == 0)
            {
                PreviousPageButton.Visible = false;
            }


            var totalProducts = dbcontext.ProductRelCategories.Count(a => a.CategoryID == TheID);
            int itemsPerPage = 12;

            decimal calculated = totalProducts / (decimal)itemsPerPage;

            if ((ThePage + 1) >= Math.Ceiling(calculated))
            {
                NextPageButton.Visible = false;
            }

            var skip = ThePage * itemsPerPage;
            var take = itemsPerPage;


            var products = GetAllProductsFromACategory(skip, take);
            var first = products.Take(itemsPerPage / 2);
            var second = products.Skip(itemsPerPage / 2);

            GetCategoryPicture();

            CategoryProductRepeaterTopSix.DataSource = first;
            CategoryProductRepeaterTopSix.DataBind();

            CategoryProductRepeaterLastSix.DataSource = second;
            CategoryProductRepeaterLastSix.DataBind();
        }

        private void GetCategoryPicture()
        {
            var item = (from cat in dbcontext.Categories
                        where cat.CategoryID == TheID
                        select
                            new
                            {
                                CatImage = cat.CategoryImage,
                                CatName = cat.CategoryName,
                                CatDesc = cat.CategoryDescription,
                                CatParallax = cat.CategoryParallax
                            }).FirstOrDefault();

            if (item == null)
            {
                Response.Redirect("SecondIndex.aspx");
                return;
            }
            CatImage.ImageUrl = "/Media/Images/CategoryLogo/" + item.CatImage + ".png";
            CatDesc.Text = item.CatDesc;
            ParallaxImg = "/Media/Images/Parallax/" + item.CatParallax + ".jpg";

        }

        private List<Product> GetAllProductsFromACategory(int skip, int take)
        {
            var query = (
                from pro in dbcontext.Products
                join cat in dbcontext.ProductRelCategories on pro.ProductID equals cat.ProductID
                where cat.CategoryID == TheID
                orderby pro.ProductName
                select pro).Skip(skip).Take(take).ToList();
            return query;
        }

        protected void PreviousPageButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("CategoryPage.aspx?id=" + TheID + "&Page=" + Convert.ToString(ThePage - 1));
        }

        protected void NextPageButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("CategoryPage.aspx?id=" + TheID + "&Page=" + Convert.ToString(ThePage + 1));
        }

    }
}


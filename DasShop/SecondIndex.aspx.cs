using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DasDAL;
using DasShop.Models;

namespace DasShop
{
    public partial class SecondIndex : System.Web.UI.Page
    {
        protected DasDBDataContext db = new DasDBDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                GetInformation();
            }
            catch (Exception ex)
            {
                //Logging exeption to db 
                Global.WriteToDB(db, ex);
            }
        }

        private void GetInformation()
        {
            repProducts.DataSource = GetRandomProducts();
            repProducts.DataBind();
        }

        public List<FrontPageRandomProduct> GetRandomProducts()
        {
            var fiveRandomProducts = db.Products
                .OrderBy(a => db.Random())
                .Select(p => new FrontPageRandomProduct
                {
                    ProductName = p.ProductName,
                    ProductID = p.ProductID,
                    ProductImage = p.ProductImage,
                    ProductDescription = p.ProductDescription,
                })
                .Take(10)
                .ToList();

            return fiveRandomProducts;
        }

    }
}
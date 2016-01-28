using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;
using DasDAL;


namespace DasADMIN.Repo
{
    public class ProductRepo : Page
    {
        public static List<ProductRelCategory> GetAllProducts(DasDBDataContext dbcontext)
        {
            return dbcontext.ProductRelCategories.OrderByDescending(a => a.ProductID).Select(a => a).ToList();
        }
        public static List<Product> GetProductsWithoutCategories(DasDBDataContext dbcontext)
        {
            return dbcontext.Products.Where(a => a.ProductRelCategories.Count() == 0).ToList();
        }

        public static int InsertProduct(
            DasDBDataContext dbcontext,
            string productName,
            string productNumber,
            decimal productPrice,
            string productImage,
            string productDescription,
            string productImageBox,
            string productImageOOBox

            )
        {
            var prod = new Product()
            {
                ProductName = productName,
                ProductNumber = productNumber,
                ProductPrice = productPrice,
                ProductImage = productImage,
                ProductDescription = productDescription,
                ProductImageBox = productImageBox,
                ProductImageOOBox = productImageOOBox
            };

            dbcontext.Products.InsertOnSubmit(prod);
            dbcontext.SubmitChanges();
            return 1;
        }

        public static int UpdateProduct(
            DasDBDataContext dbcontext,
            int productID,
            string productName,
            string productNumber,
            decimal productPrice,
            string productImage,
            string productDescription,
            string productImageBox,
            string productImageOOBox
            )
        {
            var prod = dbcontext.ProductRelCategories.FirstOrDefault(p => p.ProductID == productID);

            if (prod == null)
            {
                return 0;
            }
            prod.Product.ProductName = productName;
            prod.Product.ProductNumber = productNumber;
            prod.Product.ProductPrice = productPrice;
            prod.Product.ProductImage = productImage;
            prod.Product.ProductDescription = productDescription;
            prod.Product.ProductImageBox = productImageBox;
            prod.Product.ProductImageOOBox = productImageOOBox;

            dbcontext.SubmitChanges();

            return 1;
        }

        public static void DeleteProduct(DasDBDataContext dbcontext, int productID)
        {
            var prod = dbcontext.Products.FirstOrDefault(c => c.ProductID == productID);
            if (prod == null)
            {
                return;
            }
            dbcontext.Products.DeleteOnSubmit(prod);
            dbcontext.SubmitChanges();

        }
    }
}
using System.Collections.Generic;
using System.Linq;
using DasDAL;

namespace DasADMIN.Models
{
    public class ProductDAL
    {
        private static DasDBDataContext db = new DasDBDataContext();

        public static List<Product> GetAllProducts()
        {
            return db.Products.Select(a => a).ToList();
        }

        public static int InsertProduct(
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

            db.Products.InsertOnSubmit(prod);
            db.SubmitChanges();
            return 1;
        }

        public static int UpdateProduct(int productID,string productName,string productNumber,decimal productPrice,string productImage,string productDescription,string productImageBox,string productImageOOBox)
        {
            var prod = db.Products.FirstOrDefault(p => p.ProductID == productID);

            if (prod == null)
            {
                return 0;
            }
            prod.ProductName = productName;
            prod.ProductNumber = productNumber;
            prod.ProductPrice = productPrice;
            prod.ProductImage = productImage;
            prod.ProductDescription = productDescription;
            prod.ProductImageBox = productImageBox;
            prod.ProductImageOOBox = productImageOOBox;

            db.SubmitChanges();

            return 1;
        }

        public static void DeleteProduct(int productID)
        {
            var prod = db.Products.FirstOrDefault(c => c.ProductID == productID);
            if (prod == null)
            {
                return;
            }

            db.Products.DeleteOnSubmit(prod);
            db.SubmitChanges();
        }
    }
}
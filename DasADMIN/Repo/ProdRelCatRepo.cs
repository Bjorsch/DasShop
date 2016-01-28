using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DasDAL;

namespace DasADMIN.Repo
{
    public class ProdRelCatRepo
    {        
        private static DasDBDataContext db = new DasDBDataContext();

        public static int InsertRelCategory(int productID, int categoryID)
        {
            var relCat = new ProductRelCategory()
            {
                ProductID = productID,
                CategoryID = categoryID
            };
            db.ProductRelCategories.InsertOnSubmit(relCat);
            db.SubmitChanges();
            
            return 1;
        }
        public static int UpdateRelCategory(int productID, int categoryID)
        {
            var prod = db.ProductRelCategories.FirstOrDefault(p => p.ProductID == productID);
            {
                prod.CategoryID = categoryID;
            };
            db.SubmitChanges();

            return 1;
        }
    }
}
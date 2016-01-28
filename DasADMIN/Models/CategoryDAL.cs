using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using DasDAL;


namespace DasADMIN
{
    public class CategoryDAL
    {
        private static DasDBDataContext db = new DasDBDataContext();

        public static List<Category> GetAllCategories()
        {
            return db.Categories.Select(a => a).ToList();
        }

        public static int InsertCategory(
            string categoryName, 
            string categoryDescription, 
            string categoryImage, 
            string categoryParallax
            )
        {
            var cat = new Category()
            {
                CategoryName = categoryName,
                CategoryDescription = categoryDescription,
                CategoryImage = categoryImage,
                CategoryParallax = categoryParallax
            };
            db.Categories.InsertOnSubmit(cat);
            db.SubmitChanges();
            return 1;
        }

        public static int UpdateCategory(
            int CategoryID, 
            string CategoryName, 
            string CategoryDescription, 
            string CategoryImage, 
            string CategoryParallax
            )
        {
            var cat = db.Categories.FirstOrDefault(c => c.CategoryID == CategoryID);

            if (cat == null)
            {
                return 0;
            }
            cat.CategoryName = CategoryName;
            cat.CategoryDescription = CategoryDescription;
            cat.CategoryImage = CategoryImage;
            cat.CategoryParallax = CategoryParallax;

            db.SubmitChanges();

            return 1;
        }

        public static void Deletecategory(int CategoryID)
        {
            var cat = db.Categories.FirstOrDefault(c => c.CategoryID == CategoryID);
            if (cat == null)
            {
                return;
            }

            db.Categories.DeleteOnSubmit(cat);
            db.SubmitChanges();
        }
    }
}
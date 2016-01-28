using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using DasDAL;


namespace DasADMIN.Repo
{
    public class CategoryRepo
    {

        public static List<Category> GetAllCategories(DasDBDataContext dbcontext)
        {
            return dbcontext.Categories.Select(a => a).ToList();
        }

        public static int InsertCategory(
            DasDBDataContext dbcontext,
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
            dbcontext.Categories.InsertOnSubmit(cat);
            dbcontext.SubmitChanges();
            return 1;
        }

        public static int UpdateCategory(
            DasDBDataContext dbcontext,
            int categoryID,
            string categoryName,
            string categoryDescription,
            string categoryImage,
            string categoryParallax
            )
        {
            var cat = dbcontext.Categories.FirstOrDefault(c => c.CategoryID == categoryID);

            if (cat == null)
            {
                return 0;
            }
            cat.CategoryName = categoryName;
            cat.CategoryDescription = categoryDescription;
            cat.CategoryImage = categoryImage;
            cat.CategoryParallax = categoryParallax;

            dbcontext.SubmitChanges();

            return 1;
        }

        public static void Deletecategory(int categoryID, DasDBDataContext dbcontext)
        {
            var cat = dbcontext.Categories.FirstOrDefault(c => c.CategoryID == categoryID);
            if (cat == null)
            {
                return;
            }

            dbcontext.Categories.DeleteOnSubmit(cat);
            dbcontext.SubmitChanges();
        }
    }
}
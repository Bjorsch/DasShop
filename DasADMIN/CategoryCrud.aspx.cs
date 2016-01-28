using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DasADMIN.Repo;
using DasDAL;

namespace DasADMIN
{
    public partial class CategoryCrud : System.Web.UI.Page
    {
        private static DasDBDataContext dbcontext = new DasDBDataContext();

        public int categoryID
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
            if (IsPostBack == false)
            {
                GetSelectedCategory();
            }
        }

        protected void BtnUpdate_OnClick(object sender, EventArgs e)
        {

            CategoryRepo.UpdateCategory(
                Master.db,
                categoryID,
                TextBoxName.Text,
                TextBoxDesc.Text,
                TextBoxImage.Text,
                TextBoxParallax.Text
                );
            Response.Redirect("~/CategoryAdmin.aspx");
        }

        protected void BtnDelete_OnClick(object sender, EventArgs e)
        {

            CategoryRepo.Deletecategory(categoryID, Master.db);
            Response.Redirect("~/CategoryAdmin.aspx");
        }

        public void GetSelectedCategory()
        {
            var item = (from cat in dbcontext.Categories
                where cat.CategoryID == categoryID
                select
                    new
                    {
                        catName = cat.CategoryName,
                        catDesc = cat.CategoryDescription,
                        catImage = cat.CategoryImage,
                        catParallax = cat.CategoryParallax

                    }).FirstOrDefault();

            if (item == null)
            {
                Response.Redirect("CategoryAdmin.aspx");
                return;
            }
            TextBoxName.Text = item.catName;
            TextBoxDesc.Text = item.catDesc;
            TextBoxImage.Text = item.catImage;
            TextBoxParallax.Text = item.catParallax;
        }
    }
}
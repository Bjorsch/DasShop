using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DasADMIN.Repo;

namespace DasADMIN
{
    public partial class CategoryCreate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnCreate_OnClick(object sender, EventArgs e)
        {
            var dbcontext = Master.db;
            if(TextBoxName.Text !="" && TextBoxDesc.Text !="" && TextBoxImage.Text !="" && TextBoxParallax.Text !="")
            {
                CategoryRepo.InsertCategory(
                dbcontext,
                TextBoxName.Text,
                TextBoxDesc.Text,
                TextBoxImage.Text,
                TextBoxParallax.Text
                );
                Response.Redirect("CategoryAdmin.aspx");
            }
            
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DasADMIN.Repo;

namespace DasShop
{
    public partial class Admin : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            RepCategory.DataSource = CategoryRepo.GetAllCategories(Master.db);
            RepCategory.DataBind();           
        }
    }
}
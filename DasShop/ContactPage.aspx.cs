using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DasDAL;

namespace DasShop
{
    public partial class ContactPage : System.Web.UI.Page
    {
        private static DasDBDataContext db = new DasDBDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                GetInformation();
            }
            catch (Exception ex)
            {
                Global.WriteToDB(db, ex);
            }
        }

        private void GetInformation()
        {
            ClientScript.RegisterStartupScript(GetType(), "Javascript", "javascript:initialize(); ", true);
        }
    }
}
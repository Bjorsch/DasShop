using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DasDAL;
using System.Web.Security;

namespace DasADMIN
{
    public partial class AdminLogin : System.Web.UI.Page
    {
        private DasDBDataContext dbcontext = new DasDBDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnLogin_Click(object sender, EventArgs e)
        {
            var item = from l in dbcontext.Admins
                       where l.Username == txtUsername.Text && l.Password == txtPassword.Text
                       select l;
            if (item.Any())
            {
                FormsAuthentication.RedirectFromLoginPage
                (txtUsername.Text, RememberMe.Checked); 
            }
            else
            {
                Msg.Text = "Felaktiga uppgifter. Var god försök igen.";
            }
        }
    }
}
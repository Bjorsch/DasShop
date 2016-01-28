using DasDAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DasADMIN
{
    public partial class DasMasterAdmin : System.Web.UI.MasterPage
    {
        private DasDBDataContext m_db;
        public DasDBDataContext db
        {
            get
            {
                return m_db ?? (m_db = new DasDBDataContext());
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void BtnSignout_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            Response.Redirect("~/AdminLogin.aspx");
        }
    }
}
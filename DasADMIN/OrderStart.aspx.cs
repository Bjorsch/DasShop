using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DasADMIN.Repo;

namespace DasADMIN
{
    public partial class OrderAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            OrderRepeater.DataSource = OrderRepo.GetAllOrders(Master.db);
            OrderRepeater.DataBind();
        }
    }
}
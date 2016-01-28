using DasADMIN.Repo;
using DasDAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DasADMIN
{
    public partial class OrderDetails : System.Web.UI.Page
    {
        private DasDBDataContext dbcontext = new DasDBDataContext();

        public int TheOrderID
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
            set { }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            GetSelectedOrderInfo();
            GetSelectedOrderCustomerInfo();
            RepOrderHead.DataSource = GetAllOrderRows(Master.db);
            RepOrderHead.DataBind();
        }

        public List<OrderRow> GetAllOrderRows(DasDBDataContext dbcontext)
        {
            return dbcontext.OrderRows
                .Where(a => a.OrderHeadID == TheOrderID)
                .Select(a => a).ToList();
        }

        private void GetSelectedOrderCustomerInfo()
        {
            var item = (from o in dbcontext.OrderHeads
                        where o.OrderHeadID == TheOrderID
                        select
                        new
                        {
                            CustIDLiteral = o.CustomerID,
                            CustFirstnameLiteral = o.FirstName,
                            CustLastnameLiteral = o.LastName,
                            CustSSNLiteral = o.SSN,
                            CustStreetLiteral = o.Street,
                            CustZipLiteral = o.Zip,
                            CustCityLiteral = o.City,
                            CustCountryLiteral = o.Country,
                            CustEmailLiteral = o.Email,
                            CustPhoneLiteral = o.Phone
                        }).First();

            CustIDLiteral.Text = item.CustIDLiteral.ToString();
            CustFirstnameLiteral.Text = item.CustFirstnameLiteral;
            CustLastnameLiteral.Text = item.CustLastnameLiteral;
            CustSSNLiteral.Text = item.CustSSNLiteral;
            CustStreetLiteral.Text = item.CustStreetLiteral;
            CustZipLiteral.Text = item.CustZipLiteral;
            CustCityLiteral.Text = item.CustCityLiteral;
            CustCountryLiteral.Text = item.CustCountryLiteral;
            CustEmailLiteral.Text = item.CustEmailLiteral;
            CustPhoneLiteral.Text = item.CustPhoneLiteral;

        }

        private void GetSelectedOrderInfo()
        {
            var item = (from oh in dbcontext.OrderHeads
                        from or in dbcontext.OrderRows
                        where oh.OrderHeadID == TheOrderID
                        select
                        new
                        {
                            
                            OrderTotalAmountOfProductLiteral = oh.TotalAmountOfProducts,
                            OrderTotalCostLiteral = oh.TotalCost,
                            OrderSubTotalCostLiteral = oh.SubTotal,
                            OrderHeadIDLiteral = oh.OrderHeadID
                        }).First();
            OrderTotalAmountOfProductLiteral.Text = item.OrderTotalAmountOfProductLiteral + " stycken";
            OrderTotalCostLiteral.Text = item.OrderTotalCostLiteral + " kr";
            OrderSubTotalCostLiteral.Text = item.OrderSubTotalCostLiteral+ " kr";
            OrderHeadIDLiteral.Text = item.OrderHeadIDLiteral.ToString();

        }
    }
}
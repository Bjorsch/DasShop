using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Net.Mime;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DasDAL;

namespace DasShop
{
    public partial class ReceiptPage : System.Web.UI.Page
    {
        private static DasDBDataContext dbcontext = new DasDBDataContext();

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

            try
            {
                GetInformation();
            }
            catch (Exception exception)
            {
                Global.WriteToDB(dbcontext, exception);
            }
        }

        private void GetInformation()
        {
            GetSelectedOrderInfo();
            GetSelectedOrderCustomerInfo();
            RepOrderHead2.DataSource = GetAllOrderRows(dbcontext);
            RepOrderHead2.DataBind();
            EmailMethod();
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
                            CustPhoneLiteral = o.Phone,
                            litTimeOfOrder = o.OrderDate.ToShortDateString().ToString(CultureInfo.InvariantCulture)
                        }).First();

            CustFirstnameLiteral.Text = item.CustFirstnameLiteral;
            CustLastnameLiteral.Text = item.CustLastnameLiteral;
            CustStreetLiteral.Text = item.CustStreetLiteral;
            CustZipLiteral.Text = item.CustZipLiteral;
            CustCityLiteral.Text = item.CustCityLiteral;
            CustEmailLiteral.Text = item.CustEmailLiteral;
            CustPhoneLiteral.Text = item.CustPhoneLiteral;
            litTimeOfOrder.Text = item.litTimeOfOrder;
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

            OrderTotalAmountOfProductLiteral.Text = item.OrderTotalAmountOfProductLiteral + " produkter";
            //OrderTotalCostLiteral.Text = item.OrderTotalCostLiteral.ToString("####") + " SEK";
            OrderSubTotalCostLiteral.Text = item.OrderSubTotalCostLiteral.ToString("####") + " SEK";
            OrderHeadIDLiteral.Text = item.OrderHeadIDLiteral.ToString();
        }

        protected void EmailMethod()
        {           
            var item = (from oh in dbcontext.OrderHeads
                where oh.OrderHeadID == TheOrderID
                select new
                {
                    Email = oh.Email
                }).First();

            MailMessage mailMessage = new MailMessage(new MailAddress("brickkingdom@outlook.com"), new MailAddress(item.Email));
            mailMessage.Subject = "Orderbekräftelse från Brick Kingdom";
            string html = ScreenScrapeHtml("http://localhost:11687/AlternativeReceiptPage.aspx");            
            mailMessage.Body = html;
            mailMessage.IsBodyHtml = true;
            
            System.Net.NetworkCredential networkCredentials = new
            System.Net.NetworkCredential("brickkingdom@outlook.com", "Praktikant2015");

            SmtpClient smtpClient = new SmtpClient();
            smtpClient.EnableSsl = true;
            smtpClient.UseDefaultCredentials = false;
            smtpClient.Credentials = networkCredentials;
            smtpClient.Host = "smtp.live.com";
            smtpClient.Port = 587;
            smtpClient.Send(mailMessage);
        }

        private static string ScreenScrapeHtml(string url)
        {
            WebRequest objRequest = System.Net.HttpWebRequest.Create(url);
            StreamReader sr = new StreamReader(objRequest.GetResponse().GetResponseStream());
            string result = sr.ReadToEnd();
            sr.Close();
            return result;
        }
    }
}

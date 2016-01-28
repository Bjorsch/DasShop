using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Transactions;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;
using DasDAL;
using DasShop.Models;

namespace DasShop
{
    public partial class Checkout : System.Web.UI.Page
    {
        public int OhID
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

        DasDBDataContext db = new DasDBDataContext();
        protected string CartTotalCost;
        protected string CartTotalItems;
        private static decimal FreightCharge = 49.00m;
        protected decimal SubTotal;
        protected string ValidSsn;
        protected bool ValidOrder;

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
            BindCart();

            CartTotalItems = CartManger.GetProductCount().ToString();
            CartTotalCost = CartManger.GetTotalCost().ToString("####");
            SubTotal = CartManger.GetTotalCost() + FreightCharge;
        }

        private void BindCart()
        {
            repOrderrows.DataSource = CartManger.Items;
            repOrderrows.DataBind();
        }

        protected void btnPurchase_OnClick(object sender, EventArgs e)
        {
            ValidSsn = tbSsn.Text.Trim().Replace(" ", "");

            if (ValidSsn == "1234564441")
            {
                ValidOrder = false;
                SaveOrderToDb();
                litNoValidOrder.Text = "Personnumret är ogiltigt, din order avvisades";
            }
            else
            {
                ValidOrder = true;
                SaveOrderToDb();
                var item = (from oh in db.OrderHeads
                            where oh.SSN == tbSsn.Text
                            select oh.OrderHeadID).Max();
                ClearSession();
                Response.Redirect("ReceiptPage.aspx?id=" + item);
            }
        }

        private void ClearSession()
        {
            CartManger.ClearItems();
            CartTotalCost = "0";
            CartTotalItems = "0";
        }

        private void SaveOrderToDb()
        {
            var orderhead = new OrderHead();
            GetCustomerIdForOrderHead(orderhead);
            orderhead.UniqueOrderID = GetUniqueOrderId();
            GetCustomerInfoForOrderhead(orderhead);
            GetOrderInfoForOrderhead(orderhead);

            db.OrderHeads.InsertOnSubmit(orderhead);
            db.SubmitChanges();

            GetAndAddOrderrowsToOrderhead(orderhead);
        }

        private void GetAndAddOrderrowsToOrderhead(OrderHead orderhead)
        {
            var sessionOrderrow = CartManger.Items;
            foreach (var cartItem in sessionOrderrow)
            {
                var orderrow = new OrderRow();
                orderrow.OrderHeadID = orderhead.OrderHeadID;
                orderrow.ProductID = cartItem.ProductID;
                orderrow.Quantity = cartItem.Quantity;
                orderrow.ProductName = cartItem.ProductName;
                orderrow.ProductNumber = (db.Products
                                            .Where(p => p.ProductID == cartItem.ProductID)
                                            .Select(p => p.ProductNumber)).FirstOrDefault();
                orderrow.ProductPrice = cartItem.ProductPrice;

                db.OrderRows.InsertOnSubmit(orderrow);
                db.SubmitChanges();
            }
        }

        private void GetOrderInfoForOrderhead(OrderHead orderhead)
        {
            orderhead.TotalCost = decimal.Parse(CartTotalCost, CultureInfo.InvariantCulture);
            orderhead.SubTotal = SubTotal;
            orderhead.TotalAmountOfProducts = int.Parse(CartTotalItems);
            orderhead.IsOrderValid = ValidOrder;
            orderhead.OrderDate = DateTime.Now;
        }

        private void GetCustomerInfoForOrderhead(OrderHead orderhead)
        {
            orderhead.FirstName = tbFirstName.Text;
            orderhead.LastName = tbLastname.Text;
            orderhead.SSN = ValidSsn;
            orderhead.Street = tbStreet.Text;
            orderhead.Zip = tbZip.Text;
            orderhead.City = tbCity.Text;
            orderhead.Country = ddlCountry.SelectedValue;
            orderhead.Email = tbEmail.Text;
            orderhead.Phone = tbPhone.Text;
        }

        private void GetCustomerIdForOrderHead(OrderHead orderhead)
        {
            var existingCustomer = DoesCustomerExist();
            if (existingCustomer)
            {
                orderhead.CustomerID = GetCustomerIdByEmail();
            }
            else
            {
                var cust = new Customer()
                {
                    FirstName = tbFirstName.Text,
                    LastName = tbLastname.Text,
                    SSN = ValidSsn,
                    Street = tbStreet.Text,
                    Zip = tbZip.Text.Replace(" ", ""),
                    City = tbCity.Text,
                    Country = ddlCountry.SelectedValue,
                    Email = tbEmail.Text,
                    Phone = tbPhone.Text,
                };

                db.Customers.InsertOnSubmit(cust);
                db.SubmitChanges();

                orderhead.CustomerID = cust.CustomerID;
            }
        }

        private bool DoesCustomerExist()
        {
            var doesCustomerExist = false;

            var email = tbEmail.Text;
            var existingEmail = (
                from c in db.Customers
                select c.Email).ToList();

            foreach (var cust in existingEmail.Where(cust => cust == email))
                doesCustomerExist = true;

            return doesCustomerExist;
        }

        private int GetCustomerIdByEmail()
        {
            var query = (
                from c in db.Customers
                where c.Email == tbEmail.Text
                select c.CustomerID).FirstOrDefault();
            return query;
        }


        private int GetUniqueOrderId()
        {
            using (var transaction = new TransactionScope())
            {
                var entity = db.UniqueOrderIDs.First();
                var ourId = entity.Value;

                entity.Value++;
                db.SubmitChanges();

                transaction.Complete();

                return ourId;
            }
        }

        protected void lbClearCart_OnClick(object sender, EventArgs e)
        {
            CartManger.ClearItems();
            CartTotalCost = "0";
            CartTotalItems = "0";
            Response.Redirect("SecondIndex.aspx");
        }

        protected void ChangeCart(object sender, EventArgs e)
        {
            var self = (LinkButton)sender;
            var productId = int.Parse(self.CommandArgument);
            var cmd = self.CommandName;

            switch (cmd)
            {
                case "REMOVE":
                    CartManger.RemoveFromCart(productId);
                    break;

                case "ADD":
                    CartManger.AddQuantity(productId);
                    break;

                case "SUBTRACT":
                    CartManger.SubtractQuantity(productId);
                    break;
            }

            BindCart();
            CartTotalCost = CartManger.GetTotalCost().ToString("####");
            CartTotalItems = CartManger.GetProductCount().ToString();
            SubTotal = CartManger.GetTotalCost() + FreightCharge;
            
            Master.UpdateCart();
            
            if (int.Parse(CartTotalItems) == 0)
                Response.Redirect("SecondIndex.aspx");
        }

        protected void repOrderrows_OnItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                var data = (CartItem)e.Item.DataItem;
                var remove = (LinkButton)e.Item.FindControl("lbRemoveProductFromCart");
                var add = (LinkButton)e.Item.FindControl("lbAddQuantityToProduct");
                var subtract = (LinkButton)e.Item.FindControl("lbSubtractQuantityToProduct");

                remove.CommandArgument = data.ProductID.ToString();
                add.CommandArgument = data.ProductID.ToString();
                subtract.CommandArgument = data.ProductID.ToString();

                remove.CommandName = "REMOVE";
                add.CommandName = "ADD";
                subtract.CommandName = "SUBTRACT";
            }
        }

    }
}
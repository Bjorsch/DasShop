using System;
using System.Collections.Generic;
using System.Data.Linq.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DasDAL;
using DasShop.Models;

namespace DasShop
{
    public partial class Search : System.Web.UI.Page
    {
        private DasDBDataContext db = new DasDBDataContext();
        private string searchword;
        private static int _counter;
        public int Pages;
        public bool EndOfpagination;
        public int ProdID
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
            if (!IsPostBack)
            {
                tbSearch.Focus();
                lnkBtPagPrev.Visible = false;
                lnkBtPagNext.Visible = false;
                lbNoResults.Visible = false;
            }
        }

        protected void lbtSearch_OnClick(object sender, EventArgs e)
        {
            repSearchResult.DataSource = GetAllSearchResultProducts(searchword, "");
            repSearchResult.DataBind();
            lnkBtPagPrev.Visible = false;

            if (!EndOfpagination)
                lnkBtPagNext.Visible = true;
            else
            {
                lnkBtPagNext.Visible = false;
            }
        }

        protected List<ProductEntity> GetAllSearchResultProducts(string searchword, string mode)
        {
            searchword = tbSearch.Text;

            var query = (
               from prc in db.ProductRelCategories
               where prc.Product.ProductName.Contains(searchword)
                  || prc.Product.ProductDescription.Contains(searchword)
                  || prc.Category.CategoryName.Contains(searchword)
               orderby prc.Category.CategoryName
               select new ProductEntity()
               {
                   ProductID = prc.ProductID,
                   ProductName = prc.Product.ProductName,
                   ProductPrice = prc.Product.ProductPrice,
                   ProductImageBox = prc.Product.ProductImageBox,
                   CategoryName = prc.Category.CategoryName
               });

            var searchResault = query.ToList().Count;
            lbNoResults.Visible = (searchResault == 0) ? true : false;
            
            
            if (mode == "+")
            {
                _counter++;
            }
            else if (mode == "-")
            {
                _counter--;
            }
            else
            {
                _counter = 0;
            }

            int itemsPerPage = 5;
            double count = query.ToList().Count;
            Pages = (int)Math.Ceiling(count / itemsPerPage);

            query = query.Skip((itemsPerPage * (Pages - Pages + _counter))).Take(itemsPerPage);

            if (_counter < 0 || _counter >= Pages - 1)
                EndOfpagination = true;

            
            return query.ToList();
        }


        protected void Pagination(object sender, EventArgs e)
        {
            LinkButton clickedButton = (LinkButton)sender;
            clickedButton.ID.ToString();

            if (clickedButton.ID == "lnkBtPagPrev")
            {
                var searchResult = GetAllSearchResultProducts(searchword, "-");
                if (!EndOfpagination)
                    lnkBtPagNext.Visible = true;
                if (_counter == 0)
                    lnkBtPagPrev.Visible = false;

                repSearchResult.DataSource = searchResult;
            }
            else if (clickedButton.ID == "lnkBtPagNext")
            {
                var searchResult = GetAllSearchResultProducts(searchword, "+");
                if (EndOfpagination)
                {
                    lnkBtPagNext.Visible = false;
                    lnkBtPagPrev.Visible = true;
                }
                if (!EndOfpagination)
                    lnkBtPagPrev.Visible = true;

                repSearchResult.DataSource = searchResult;
            }

            repSearchResult.DataBind();

        }
    }
}
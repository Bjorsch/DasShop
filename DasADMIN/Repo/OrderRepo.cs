using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DasDAL;

namespace DasADMIN.Repo
{
    public class OrderRepo
    {
        private static DasDBDataContext db = new DasDBDataContext();

        public static List<OrderHead> GetAllOrders(DasDBDataContext dbcontext)
        {
            return db.OrderHeads.OrderByDescending(a => a.OrderDate).Select(a => a).ToList();
        }
     
    }
}
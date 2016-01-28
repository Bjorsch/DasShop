using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DasDAL
{
    public class Repository
    {
        private DasDBDataContext db;
        public Repository()
        {
            db = new DasDBDataContext();
        }

        public void Test()
        {
    

        }
        public void Test2()
        {
            var orders = db.OrderHeads.Where(c => c.CustomerID == 2).FirstOrDefault();
        }
    }
}

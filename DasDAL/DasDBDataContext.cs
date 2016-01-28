using System;
using System.Collections.Generic;
using System.Data.Linq.Mapping;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DasDAL
{
    public partial class DasDBDataContext
    {
        [Function(Name = "NEWID", IsComposable = true)]
        public Guid Random()
        {
            // To prove not used by our C# code
            throw new NotImplementedException();
        }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WebAplication1.Model;

namespace WebAplication1.Services
{
    public interface ICustomerFacingService : IDisposable
    {
        IEnumerable<CustomerFacing> GetCF();
        void AddCF(CustomerFacing customerFacing);
        void UpdateCF(CustomerFacing customerFacing);
        void RemoveCF(int id);
    }
}

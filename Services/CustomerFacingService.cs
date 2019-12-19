using System;
using System.Collections.Generic;
using System.Linq;
using System.Data.Entity;
using System.Web;
using WebAplication1.Model;
using WebAplication1.ViewModel;

namespace WebAplication1.Services
{
    public class CustomerFacingService : ICustomerFacingService
    {
        private ClaimDB db;
        public CustomerFacingService(ClaimDB db)
        {
            this.db = db;
        }

        public IEnumerable<CustomerFacing> GetCF()
        {
            return db.CustomerFacings
                .ToList();
        }

        public void AddCF(CustomerFacing cf)
        {
            db.CustomerFacings.Add(cf);
            db.SaveChanges();
        }

        public void UpdateCF(CustomerFacing cf)
        {
            db.Entry(cf).State = EntityState.Modified;
            db.SaveChanges();
        }

        public void RemoveCF(int idCF)
        {
            CustomerFacing cf = new CustomerFacing() { Id = idCF };
            db.CustomerFacings.Attach(cf);
            db.CustomerFacings.Remove(cf);
            db.SaveChanges();
        }
        public void Dispose()
        {
            db.Dispose();
        }
    }
}
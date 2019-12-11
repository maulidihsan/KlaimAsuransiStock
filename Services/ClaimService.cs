using System;
using System.Collections.Generic;
using System.Linq;
using System.Data.Entity;
using System.Web;
using WebAplication1.Model;
using WebAplication1.ViewModel;

namespace WebAplication1.Services
{
    public class ClaimService : IClaimService
    {
        private ClaimDB db;
        public ClaimService(ClaimDB db)
        {
            this.db = db;
        }

        public IEnumerable<Claim> GetClaims()
        {
            return db.Claims
                .Include(s => s.Statuses)
                .Include(s => s.Documents)
                .ToList();
        }

        public PaginatedItemsViewModel<Claim> GetClaimPaginated(int pageSize, int pageIndex)
        {
            var totalItems = db.Claims.LongCount();
            var itemsOnPage = db.Claims
                .Select(s => new { ai = s, status = s.Statuses.Where(w => !w.Done).OrderBy(o => o.Id).FirstOrDefault() })
                .AsEnumerable()
                .Select(s => s.ai)
                .Skip(pageSize * pageIndex)
                .Take(pageSize)
                .ToList();

            return new PaginatedItemsViewModel<Claim>(
                pageIndex, pageSize, totalItems, itemsOnPage);
        }

        public Claim ClaimDetails(int id)
        {
            return db.Claims
                .Include(s => s.Statuses)
                .Include(s => s.Documents)
                .FirstOrDefault(ci => ci.Id == id);
        }

        public void CreateClaim(Claim claim)
        {
            db.Claims.Add(claim);
            db.SaveChanges();
        }

        public void UpdateClaim(Claim claim)
        {
            db.Entry(claim).State = EntityState.Modified;
            db.SaveChanges();
        }

        public void RemoveClaim(Claim claim)
        {
            db.Claims.Remove(claim);
            db.SaveChanges();
        }
        public void Dispose()
        {
            db.Dispose();
        }
    }
}
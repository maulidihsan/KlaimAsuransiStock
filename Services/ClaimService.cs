using System;
using System.Collections.Generic;
using System.Linq;
using System.Data.Entity;
using System.Web;
using WebApplication1.Model;
using WebApplication1.ViewModel;

namespace WebApplication1.Services
{
    public class ClaimService : IClaimService
    {
        private ClaimDB db;
        private IStatusService statusService;
        public ClaimService(ClaimDB db, IStatusService check)
        {
            this.db = db;
            this.statusService = check;
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
                .Include(s => s.CustomerFacing)
                .Include(s => s.Statuses)
                .Include(s => s.Documents)
                .FirstOrDefault(ci => ci.Id == id);
        }

        public void CreateClaim(Claim claim)
        {
            db.Claims.Add(claim);
            db.SaveChanges();

            Status status = new Status()
            {
                ClaimId = claim.Id,
                StatusCode = "IN",
                Description = "Waiting for documents",
                Done = false,
                ValidFrom = DateTime.Now,
                ValidUntil = DateTime.Now.AddDays(15)
            };
            this.statusService.CreateStatus(status);
        }

        public void UpdateClaim(Claim claim)
        {
            db.Entry(claim).State = EntityState.Modified;
            db.SaveChanges();
        }

        public void RemoveClaim(int idClaim)
        {
            Claim claim = new Claim() { Id = idClaim };
            db.Claims.Attach(claim);
            db.Claims.Remove(claim);
            db.SaveChanges();
        }
        public void Dispose()
        {
            db.Dispose();
        }
    }
}
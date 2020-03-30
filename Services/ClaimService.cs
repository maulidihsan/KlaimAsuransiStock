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
                //.Select(s => new { s, V = s.LatestStatus = s.Statuses.Where(w => !w.Done).OrderBy(o => o.Id).FirstOrDefault().StatusCode })
                //.AsEnumerable()
                //.Include(s => s.Statuses.Where(w => !w.Done).OrderBy(o => o.Id).FirstOrDefault())
                .Select(s => s )
                .OrderBy(s => s.CreatedAt)
                .Skip(pageSize * pageIndex)
                .Take(pageSize)
                .ToList();

            foreach ( var item in itemsOnPage) {
                if (item.Statuses.Count > 0)
                item.LatestStatus = item.Statuses.Where(w => !w.Done).OrderBy(o => o.Id).FirstOrDefault();
            }
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

        public bool DokumenLengkap(int idClaim)
        {
            var klaim = db.Claims
                        .Include(s => s.Documents)
                        .FirstOrDefault(ci => ci.Id == idClaim);
            var doctype = new List<DocType> { DocType.ClaimFormAIG, DocType.Invoice, DocType.InvoicePengeluaran, DocType.LP1Bulan, DocType.QCReport, DocType.RekapPengeluaran, DocType.SuratJalan, DocType.SuratLaporan };
            var uploadedTypes = klaim.Documents.Select(i => i.Type).ToList();
            var set = new HashSet<DocType>(uploadedTypes);
            return set.SetEquals(doctype);
        }

    }
}
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
        private IDocumentService documentService;
        private INotificationService notificationService;
        public ClaimService(ClaimDB db, IStatusService statusService, IDocumentService documentService, INotificationService notificationService)
        {
            this.db = db;
            this.statusService = statusService;
            this.documentService = documentService;
            this.notificationService = notificationService;
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
                .Where(s => !s.CaseClosed )
                .OrderByDescending(s => s.CreatedAt)
                .Skip(pageSize * pageIndex)
                .Take(pageSize)
                .ToList();

            foreach ( var item in itemsOnPage) {
                if (item.Statuses.Count > 0)
                item.LatestStatus = item.Statuses.OrderByDescending(o => o.Id).FirstOrDefault();
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
            claim.UpdatedAt = DateTime.Now;
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

        public void ApprovalProcessCheck(int idClaim)
        {
            var klaim = this.ClaimDetails(idClaim);
            klaim.LatestStatus = this.statusService.GetStatus(idClaim);
            if ((klaim.Documents.Where(x => x.Approved).Count() == 8) && (klaim.LatestStatus.StatusCode == "WA"))
            {
                klaim.LatestStatus.Done = true;
                this.statusService.UpdateStatus(klaim.LatestStatus);
                Status status = new Status()
                {
                    ClaimId = idClaim,
                    StatusCode = "SP",
                    Description = "Upload Surat Pengajuan",
                    Done = false,
                    ValidFrom = DateTime.Now,
                    ValidUntil = DateTime.Now.AddDays(2)
                };
                this.statusService.CreateStatus(status);
            }
            else if (((klaim.Documents.Where(x => x.Approved).Count() + klaim.Documents.Where(x => x.Rejected).Count()) == 8) && (klaim.LatestStatus.StatusCode == "WA"))
            {
                var documentsToDelete = klaim.Documents.Where(x => x.Rejected).ToList();
                foreach (var doc in documentsToDelete)
                {
                    this.documentService.RemoveDocument(doc);
                }
                this.statusService.RemoveStatus(klaim.LatestStatus);
                klaim.LatestStatus = this.statusService.GetStatus(idClaim);
                klaim.LatestStatus.Done = false;
                this.statusService.UpdateStatus(klaim.LatestStatus);
            }
            else if (klaim.LatestStatus.StatusCode == "SO")
            {
                klaim.LatestStatus.Done = true;
                this.statusService.UpdateStatus(klaim.LatestStatus);
                Status status = new Status()
                {
                    ClaimId = idClaim,
                    StatusCode = "LSR",
                    Description = "Loss Subrogation Receipt",
                    Done = false,
                    ValidFrom = DateTime.Now,
                    ValidUntil = DateTime.Now.AddDays(2)
                };
                this.statusService.CreateStatus(status);
                Notification notification = new Notification()
                {
                    Message = "Settlement approved, waiting for LSR",
                    Read = false,
                    RecipientRole = "Treasury",
                    ClaimId = idClaim
                };
                this.notificationService.CreateNotification(notification);
            }
            else if (klaim.LatestStatus.StatusCode == "LSR")
            {
                klaim.LatestStatus.Done = true;
                this.statusService.UpdateStatus(klaim.LatestStatus);
                Status status = new Status()
                {
                    ClaimId = idClaim,
                    StatusCode = "DISP",
                    Description = "Disposal Process",
                    Done = false,
                    ValidFrom = DateTime.Now,
                    ValidUntil = DateTime.Now.AddDays(9)
                };
                this.statusService.CreateStatus(status);
                Notification notification = new Notification()
                {
                    Message = "LSR Approved, waiting for BA disposal",
                    Read = false,
                    RecipientRole = "LogisticDispo",
                    ClaimId = idClaim
                };
                this.notificationService.CreateNotification(notification);
            }
            else if (klaim.LatestStatus.StatusCode == "DISP")
            {
                klaim.LatestStatus.Done = true;
                this.statusService.UpdateStatus(klaim.LatestStatus);
                Status status = new Status()
                {
                    ClaimId = idClaim,
                    StatusCode = "OK",
                    Description = "Klaim Selesai",
                    ValidFrom = DateTime.Now,
                    ValidUntil = DateTime.Now,
                    Done = true
                };
                this.statusService.CreateStatus(status);
            }
        }
        public void LateSubmission(LateSubmission lateSubmission)
        {
            db.LateSubmissions.Add(lateSubmission);
            db.SaveChanges();
        }

        public string GetLateReason(int statusId)
        {
            return db.LateSubmissions.Where(x => x.StatusId == statusId).Select(x => x.Reason).DefaultIfEmpty("Reason not submitted yet").FirstOrDefault();
        }
    }
}
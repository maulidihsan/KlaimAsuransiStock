using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WebApplication1.Model;
using WebApplication1.ViewModel;

namespace WebApplication1.Services
{
    public interface IClaimService : IDisposable
    {
        IEnumerable<Claim> GetClaims();
        Claim ClaimDetails(int id);
        PaginatedItemsViewModel<Claim> GetClaimPaginated(int pageSize, int pageIndex);
        void CreateClaim(Claim claim);
        void UpdateClaim(Claim claim);
        void RemoveClaim(int id);
        bool DokumenLengkap(int id);
        void ApprovalProcessCheck(int id);
        void LateSubmission(LateSubmission lateSubmission);
        string GetLateReason(int idStatus);
    }
}

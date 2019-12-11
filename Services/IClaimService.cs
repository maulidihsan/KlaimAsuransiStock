using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WebAplication1.Model;
using WebAplication1.ViewModel;

namespace WebAplication1.Services
{
    public interface IClaimService : IDisposable
    {
        IEnumerable<Claim> GetClaims();
        Claim ClaimDetails(int id);
        PaginatedItemsViewModel<Claim> GetClaimPaginated(int pageSize, int pageIndex);
        void CreateClaim(Claim claim);
        void UpdateClaim(Claim claim);
        void RemoveClaim(Claim claim);
        // void ChangeStatus(Status status);
        // void UpdateStatus(Status status);
    }
}

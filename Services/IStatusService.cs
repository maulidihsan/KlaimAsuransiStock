using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WebApplication1.Model;

namespace WebApplication1.Services
{
    public interface IStatusService : IDisposable
    {
        Status GetStatus(int IdKlaim);
        void CreateStatus(Status status);
        void UpdateStatus(Status status);
        void RemoveStatus(Status status);
    }
}

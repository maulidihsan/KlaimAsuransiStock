using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WebApplication1.Model;

namespace WebApplication1.Services
{
    public interface IDocumentService : IDisposable
    {
        void CreateDocument(Document document);
        void UpdateDocument(Document document);
        void RemoveDocument(Document document);
    }
}

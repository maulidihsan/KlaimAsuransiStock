using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WebAplication1.Model;

namespace WebAplication1.Services
{
    public interface IDocumentService : IDisposable
    {
        void CreateDocument(Document document);
        void UpdateDocument(Document document);
        void RemoveDocument(Document document);
    }
}

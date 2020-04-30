using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using WebApplication1.Model;

namespace WebApplication1.Services
{
    public class DocumentService : IDocumentService
    {
        private ClaimDB db;
        public DocumentService(ClaimDB db)
        {
            this.db = db;
        }
        public void CreateDocument(Document document)
        {
            db.Documents.Add(document);
            db.SaveChanges();
        }

        public void UpdateDocument(Document document)
        {
            db.Entry(document).State = EntityState.Modified;
            db.SaveChanges();
        }

        public void RemoveDocument(Document document)
        {
            db.Documents.Remove(document);
            db.SaveChanges();
        }

        public Document GetDocument(int id)
        {
            return db.Documents.Where(i => i.Id == id).FirstOrDefault();
        }

        public void Dispose()
        {
            db.Dispose();
        }
    }
}
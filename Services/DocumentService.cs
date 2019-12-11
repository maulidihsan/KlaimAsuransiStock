﻿using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using WebAplication1.Model;

namespace WebAplication1.Services
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

        public void Dispose()
        {
            db.Dispose();
        }
    }
}
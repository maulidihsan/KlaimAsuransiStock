using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication1.Model
{
    public enum DocType
    {
        SuratPengajuan = 0,
        ClaimFormAIG = 1,
        SuratLaporan = 2,
        Invoice = 3,
        QCReport = 4,
        LP1Bulan = 5,
        SuratJalan = 6,
        InvoicePengeluaran = 7,
        RekapPengeluaran = 8,
        BADisposal = 9,
    }
    public class Document
    {
        public Document()
        {
            CreatedAt = DateTime.Now;
        }
        public int Id { get; set; }
        public DocType Type { get; set; }
        public string OriginalFileName { get; set; }
        public string FileName { get; set; }
        public string FilePath { get; set; }
        public bool  Approved { get; set; }
        public DateTime CreatedAt { get; set; }
        public Nullable<DateTime> UpdatedAt { get; set; }
        public int ClaimId { get; set; }
        public virtual Claim Claim { get; set; }
    }
}
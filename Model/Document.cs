using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication1.Model
{
    public enum DocType
    {
        SuratPengajuan = 0,
        InvoiceCargo = 1,
        Foto = 2,
        KargoRusak = 3,
        BABarangRusak = 4,
        BAKejadian = 5,
        LaporanBencana = 6,
        LP1 = 7,
        SuratJalan = 8,
        InvoicePengeluranBarang = 9,
        RekapPengeluaranBarang = 10,
        BADisposal = 11,
        BAKeterlambatan = 12,
        SuratPindahAlamat = 13
    }
    public class Document
    {
        public Document()
        {
            CreatedAt = DateTime.Now;
        }
        public int Id { get; set; }
        public DocType Type { get; set; }
        public string FileName { get; set; }
        public string FilePath { get; set; }
        public bool  Approved { get; set; }
        public DateTime CreatedAt { get; set; }
        public Nullable<DateTime> UpdatedAt { get; set; }
        public int ClaimId { get; set; }
        public virtual Claim Claim { get; set; }
    }
}
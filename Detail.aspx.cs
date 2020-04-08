using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication1.Model;
using WebApplication1.Services;

namespace WebApplication1
{
    public partial class Detail : System.Web.UI.Page
    {
        public IClaimService claimService { get; set; }
        public IStatusService statusService { get; set; }
        public IDocumentService documentService { get; set; }
        private Int32 id;
        protected Claim claimDetail { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            FPBUploadView.Visible = true;
            QCUploadView.Visible = true;
            TreasuryApproveView.Visible = true;
            TreasuryUploadView.Visible = true;
            AONApproveView.Visible = true;
            if (!Page.RouteData.Values.Keys.Contains("id"))
            {
                Response.Redirect("Default.aspx");
            }
            id = Convert.ToInt32(Page.RouteData.Values["id"]);
            claimDetail = this.claimService.ClaimDetails(id);
        }
        protected void UploadButton_Click(object sender, EventArgs e)
        {
            if (UplClaimForm.HasFile)
            {
                try
                {
                    if (UplClaimForm.PostedFile.ContentType == "image/jpeg")
                    {
                        if (UplClaimForm.PostedFile.ContentLength < 102400)
                        {
                            string originalFilename = UplClaimForm.PostedFile.FileName;
                            string extensions = System.IO.Path.GetExtension(originalFilename);
                            string filename = string.Format(@"{0}", Guid.NewGuid());
                            string filePath = Server.MapPath("~/Uploads/") + filename + extensions;
                            UplClaimForm.SaveAs(filePath);
                            Document newDoc = new Document
                            {
                                Type = DocType.ClaimFormAIG,
                                FileName = filename,
                                OriginalFileName = originalFilename,
                                FilePath = filePath,
                                Approved = false,
                                ClaimId = Convert.ToInt32(id)
                            };
                            this.documentService.CreateDocument(newDoc);
                        }
                    }
                }
                catch (Exception ex)
                {

                }
            }

            if (UplSuratLaporan.HasFile)
            {
                try
                {
                    if (UplSuratLaporan.PostedFile.ContentType == "image/jpeg")
                    {
                        if (UplSuratLaporan.PostedFile.ContentLength < 102400)
                        {
                            string originalFilename = UplSuratLaporan.PostedFile.FileName;
                            string extensions = System.IO.Path.GetExtension(originalFilename);
                            string filename = string.Format(@"{0}", Guid.NewGuid());
                            string filePath = Server.MapPath("~/Uploads/") + filename + extensions;
                            UplSuratLaporan.SaveAs(Server.MapPath("~/Uploads/") + filename);
                            Document newDoc = new Document
                            {
                                Type = DocType.SuratLaporan,
                                FileName = filename,
                                OriginalFileName = originalFilename,
                                FilePath = Server.MapPath("~/Uploads/") + filename,
                                Approved = false,
                                ClaimId = Convert.ToInt32(id)
                            };
                            this.documentService.CreateDocument(newDoc);
                        }
                    }
                }
                catch (Exception ex)
                {

                }
            }

            if (UplCopyInvoice.HasFile)
            {
                try
                {
                    if (UplCopyInvoice.PostedFile.ContentType == "image/jpeg")
                    {
                        if (UplCopyInvoice.PostedFile.ContentLength < 102400)
                        {
                            string originalFilename = UplCopyInvoice.PostedFile.FileName;
                            string extensions = System.IO.Path.GetExtension(originalFilename);
                            string filename = string.Format(@"{0}", Guid.NewGuid());
                            string filePath = Server.MapPath("~/Uploads/") + filename + extensions;
                            UplCopyInvoice.SaveAs(Server.MapPath("~/Uploads/") + filename);
                            Document newDoc = new Document
                            {
                                Type = DocType.Invoice,
                                FileName = filename,
                                OriginalFileName = originalFilename,
                                FilePath = Server.MapPath("~/Uploads/") + filename,
                                Approved = false,
                                ClaimId = Convert.ToInt32(id)
                            };
                            this.documentService.CreateDocument(newDoc);
                        }
                    }
                }
                catch (Exception ex)
                {

                }
            }

            if (UplLP.HasFile)
            {
                try
                {
                    if (UplLP.PostedFile.ContentType == "image/jpeg")
                    {
                        if (UplLP.PostedFile.ContentLength < 102400)
                        {
                            string originalFilename = UplLP.PostedFile.FileName;
                            string extensions = System.IO.Path.GetExtension(originalFilename);
                            string filename = string.Format(@"{0}", Guid.NewGuid());
                            string filePath = Server.MapPath("~/Uploads/") + filename + extensions;
                            UplLP.SaveAs(Server.MapPath("~/Uploads/") + filename);
                            Document newDoc = new Document
                            {
                                Type = DocType.LP1Bulan,
                                FileName = filename,
                                OriginalFileName = originalFilename,
                                FilePath = Server.MapPath("~/Uploads/") + filename,
                                Approved = false,
                                ClaimId = Convert.ToInt32(id)
                            };
                            this.documentService.CreateDocument(newDoc);
                        }
                    }
                }
                catch (Exception ex)
                {

                }
            }

            if (UplSuratJalan.HasFile)
            {
                try
                {
                    if (UplSuratJalan.PostedFile.ContentType == "image/jpeg")
                    {
                        if (UplSuratJalan.PostedFile.ContentLength < 102400)
                        {
                            string originalFilename = UplSuratJalan.PostedFile.FileName;
                            string extensions = System.IO.Path.GetExtension(originalFilename);
                            string filename = string.Format(@"{0}", Guid.NewGuid());
                            string filePath = Server.MapPath("~/Uploads/") + filename + extensions;
                            UplSuratJalan.SaveAs(Server.MapPath("~/Uploads/") + filename);
                            Document newDoc = new Document
                            {
                                Type = DocType.SuratJalan,
                                FileName = filename,
                                OriginalFileName = originalFilename,
                                FilePath = Server.MapPath("~/Uploads/") + filename,
                                Approved = false,
                                ClaimId = Convert.ToInt32(id)
                            };
                            this.documentService.CreateDocument(newDoc);
                        }
                    }
                }
                catch (Exception ex)
                {

                }
            }

            if (UplInvoicePengeluaran.HasFile)
            {
                try
                {
                    if (UplInvoicePengeluaran.PostedFile.ContentType == "image/jpeg")
                    {
                        if (UplInvoicePengeluaran.PostedFile.ContentLength < 102400)
                        {
                            string originalFilename = UplInvoicePengeluaran.PostedFile.FileName;
                            string extensions = System.IO.Path.GetExtension(originalFilename);
                            string filename = string.Format(@"{0}", Guid.NewGuid());
                            string filePath = Server.MapPath("~/Uploads/") + filename + extensions;
                            UplInvoicePengeluaran.SaveAs(Server.MapPath("~/Uploads/") + filename);
                            Document newDoc = new Document
                            {
                                Type = DocType.InvoicePengeluaran,
                                FileName = filename,
                                OriginalFileName = originalFilename,
                                FilePath = Server.MapPath("~/Uploads/") + filename,
                                Approved = false,
                                ClaimId = Convert.ToInt32(id)
                            };
                            this.documentService.CreateDocument(newDoc);
                        }
                    }
                }
                catch (Exception ex)
                {

                }
            }

            if (UplRekapPengeluaran.HasFile)
            {
                try
                {
                    if (UplRekapPengeluaran.PostedFile.ContentType == "image/jpeg")
                    {
                        if (UplRekapPengeluaran.PostedFile.ContentLength < 102400)
                        {
                            string originalFilename = UplRekapPengeluaran.PostedFile.FileName;
                            string extensions = System.IO.Path.GetExtension(originalFilename);
                            string filename = string.Format(@"{0}", Guid.NewGuid());
                            string filePath = Server.MapPath("~/Uploads/") + filename + extensions;
                            UplRekapPengeluaran.SaveAs(Server.MapPath("~/Uploads/") + filename);
                            Document newDoc = new Document
                            {
                                Type = DocType.RekapPengeluaran,
                                FileName = filename,
                                OriginalFileName = originalFilename,
                                FilePath = Server.MapPath("~/Uploads/") + filename,
                                Approved = false,
                                ClaimId = Convert.ToInt32(id)
                            };
                            this.documentService.CreateDocument(newDoc);
                        }
                    }
                }
                catch (Exception ex)
                {

                }
            }

            if (UplQCReport.HasFile)
            {
                try
                {
                    if (UplQCReport.PostedFile.ContentType == "image/jpeg")
                    {
                        if (UplQCReport.PostedFile.ContentLength < 102400)
                        {
                            string originalFilename = UplQCReport.PostedFile.FileName;
                            string extensions = System.IO.Path.GetExtension(originalFilename);
                            string filename = string.Format(@"{0}", Guid.NewGuid());
                            string filePath = Server.MapPath("~/Uploads/") + filename + extensions;
                            UplQCReport.SaveAs(Server.MapPath("~/Uploads/") + filename);
                            Document newDoc = new Document
                            {
                                Type = DocType.QCReport,
                                FileName = filename,
                                OriginalFileName = originalFilename,
                                FilePath = Server.MapPath("~/Uploads/") + filename,
                                Approved = false,
                                ClaimId = Convert.ToInt32(id)
                            };
                            this.documentService.CreateDocument(newDoc);
                        }
                    }
                }
                catch (Exception ex)
                {

                }
            }

            claimDetail.LatestStatus = this.statusService.GetStatus(id);
            if (this.claimService.DokumenLengkap(id) && claimDetail.LatestStatus.StatusCode == "IN")
            {
                claimDetail.LatestStatus.Done = true;
                this.statusService.UpdateStatus(claimDetail.LatestStatus);
                Status status = new Status()
                {
                    ClaimId = id,
                    StatusCode = "WA",
                    Description = "Waiting for Approval",
                    Done = false,
                    ValidFrom = DateTime.Now,
                    ValidUntil = DateTime.Now.AddDays(15)
                };
                this.statusService.CreateStatus(status);
            };
        }

        protected void UploadDokumenTambahan_Click(object sender, EventArgs e)
        {
            foreach (HttpPostedFile postedFile in UplLainLain.PostedFiles)
            {
                if (postedFile.ContentType == "image/jpeg")
                {
                    if (postedFile.ContentLength < 102400)
                    {
                        string originalFilename = postedFile.FileName;
                        string extensions = System.IO.Path.GetExtension(originalFilename);
                        string filename = string.Format(@"{0}", Guid.NewGuid());
                        string filePath = Server.MapPath("~/Uploads/") + filename + extensions;
                        postedFile.SaveAs(filePath);
                        Document newDoc = new Document
                        {
                            Type = DocType.Tambahan,
                            FileName = filename,
                            OriginalFileName = originalFilename,
                            FilePath = filePath,
                            Approved = false,
                            ClaimId = Convert.ToInt32(id)
                        };
                        this.documentService.CreateDocument(newDoc);
                    }
                }
            }
        }

        protected void UploadSuratPengajuan_Click(object sender, EventArgs e)
        {
            if (UplSuratPengajuan.HasFile)
            {
                try
                {
                    if (UplSuratPengajuan.PostedFile.ContentType == "image/jpeg")
                    {
                        if (UplSuratPengajuan.PostedFile.ContentLength < 102400)
                        {
                            string originalFilename = UplSuratPengajuan.PostedFile.FileName;
                            string extensions = System.IO.Path.GetExtension(originalFilename);
                            string filename = string.Format(@"{0}", Guid.NewGuid());
                            string filePath = Server.MapPath("~/Uploads/") + filename + extensions;
                            UplSuratPengajuan.SaveAs(filePath);
                            Document newDoc = new Document
                            {
                                Type = DocType.SuratPengajuan,
                                FileName = filename,
                                OriginalFileName = originalFilename,
                                FilePath = filePath,
                                Approved = false,
                                ClaimId = Convert.ToInt32(id)
                            };
                            this.documentService.CreateDocument(newDoc);
                        }
                    }
                }
                catch (Exception ex)
                {

                }
            }
            claimDetail.LatestStatus = this.statusService.GetStatus(id);
            if (claimDetail.LatestStatus.StatusCode == "SP")
            {
                claimDetail.LatestStatus.Done = true;
                this.statusService.UpdateStatus(claimDetail.LatestStatus);
                Status status = new Status()
                {
                    ClaimId = id,
                    StatusCode = "WO",
                    Description = "Waiting for AON Approval",
                    Done = false,
                    ValidFrom = DateTime.Now,
                    ValidUntil = DateTime.Now.AddDays(5)
                };
                this.statusService.CreateStatus(status);
            }
        }

        protected void UploadLSR_Click(object sender, EventArgs e)
        {
            if (UplLSR.HasFile)
            {
                try
                {
                    if (UplLSR.PostedFile.ContentType == "image/jpeg")
                    {
                        if (UplLSR.PostedFile.ContentLength < 102400)
                        {
                            string originalFilename = UplLSR.PostedFile.FileName;
                            string extensions = System.IO.Path.GetExtension(originalFilename);
                            string filename = string.Format(@"{0}", Guid.NewGuid());
                            string filePath = Server.MapPath("~/Uploads/") + filename + extensions;
                            UplLSR.SaveAs(filePath);
                            Document newDoc = new Document
                            {
                                Type = DocType.LSR,
                                FileName = filename,
                                OriginalFileName = originalFilename,
                                FilePath = filePath,
                                Approved = false,
                                ClaimId = Convert.ToInt32(id)
                            };
                            this.documentService.CreateDocument(newDoc);
                        }
                    }
                }
                catch (Exception ex)
                {

                }
            }
        }

        protected void UploadSettlement_Click(object sender, EventArgs e)
        {
            if (UplSettlementOffer.HasFile)
            {
                try
                {
                    if (UplSettlementOffer.PostedFile.ContentType == "image/jpeg")
                    {
                        if (UplSettlementOffer.PostedFile.ContentLength < 102400)
                        {
                            string originalFilename = UplSettlementOffer.PostedFile.FileName;
                            string extensions = System.IO.Path.GetExtension(originalFilename);
                            string filename = string.Format(@"{0}", Guid.NewGuid());
                            string filePath = Server.MapPath("~/Uploads/") + filename + extensions;
                            UplSettlementOffer.SaveAs(filePath);
                            Document newDoc = new Document
                            {
                                Type = DocType.SettlementOffer,
                                FileName = filename,
                                OriginalFileName = originalFilename,
                                FilePath = filePath,
                                Approved = false,
                                ClaimId = Convert.ToInt32(id)
                            };
                            this.documentService.CreateDocument(newDoc);
                        }
                    }
                }
                catch (Exception ex)
                {

                }
            }
        }

        protected void UploadDisposal_Click(object sender, EventArgs e)
        {
            if (UplBADisposal.HasFile)
            {
                try
                {
                    if (UplBADisposal.PostedFile.ContentType == "image/jpeg")
                    {
                        if (UplBADisposal.PostedFile.ContentLength < 102400)
                        {
                            string originalFilename = UplBADisposal.PostedFile.FileName;
                            string extensions = System.IO.Path.GetExtension(originalFilename);
                            string filename = string.Format(@"{0}", Guid.NewGuid());
                            string filePath = Server.MapPath("~/Uploads/") + filename + extensions;
                            UplBADisposal.SaveAs(filePath);
                            Document newDoc = new Document
                            {
                                Type = DocType.BADisposal,
                                FileName = filename,
                                OriginalFileName = originalFilename,
                                FilePath = filePath,
                                Approved = false,
                                ClaimId = Convert.ToInt32(id)
                            };
                            this.documentService.CreateDocument(newDoc);
                        }
                    }
                }
                catch (Exception ex)
                {

                }
            }
        }
        protected void Approval_Click(object sender, EventArgs e)
        {
            Button btn = sender as Button;
            int idDokumen;
            Document approveDocument;
            switch (btn.CommandArgument.ToString()) {
                case "ClaimFormAIG":
                    idDokumen = this.claimDetail.Documents.Where(x => x.Type == WebApplication1.Model.DocType.ClaimFormAIG).OrderByDescending(x => x.Id).FirstOrDefault().Id;
                    approveDocument = this.documentService.GetDocument(idDokumen);
                    approveDocument.Approved = true;
                    this.documentService.UpdateDocument(approveDocument);
                    break;
                case "SuratLaporan":
                    idDokumen = this.claimDetail.Documents.Where(x => x.Type == WebApplication1.Model.DocType.SuratLaporan).OrderByDescending(x => x.Id).FirstOrDefault().Id;
                    approveDocument = this.documentService.GetDocument(idDokumen);
                    approveDocument.Approved = true;
                    this.documentService.UpdateDocument(approveDocument);
                    break;
                case "Invoice":
                    idDokumen = this.claimDetail.Documents.Where(x => x.Type == WebApplication1.Model.DocType.Invoice).OrderByDescending(x => x.Id).FirstOrDefault().Id;
                    approveDocument = this.documentService.GetDocument(idDokumen);
                    approveDocument.Approved = true;
                    this.documentService.UpdateDocument(approveDocument);
                    break;
                case "LP1Bulan":
                    idDokumen = this.claimDetail.Documents.Where(x => x.Type == WebApplication1.Model.DocType.LP1Bulan).OrderByDescending(x => x.Id).FirstOrDefault().Id;
                    approveDocument = this.documentService.GetDocument(idDokumen);
                    approveDocument.Approved = true;
                    this.documentService.UpdateDocument(approveDocument);
                    break;
                case "SuratJalan":
                    idDokumen = this.claimDetail.Documents.Where(x => x.Type == WebApplication1.Model.DocType.SuratJalan).OrderByDescending(x => x.Id).FirstOrDefault().Id;
                    approveDocument = this.documentService.GetDocument(idDokumen);
                    approveDocument.Approved = true;
                    this.documentService.UpdateDocument(approveDocument);
                    break;
                case "InvoicePengeluaran":
                    idDokumen = this.claimDetail.Documents.Where(x => x.Type == WebApplication1.Model.DocType.InvoicePengeluaran).OrderByDescending(x => x.Id).FirstOrDefault().Id;
                    approveDocument = this.documentService.GetDocument(idDokumen);
                    approveDocument.Approved = true;
                    this.documentService.UpdateDocument(approveDocument);
                    break;
                case "RekapPengeluaran":
                    idDokumen = this.claimDetail.Documents.Where(x => x.Type == WebApplication1.Model.DocType.RekapPengeluaran).OrderByDescending(x => x.Id).FirstOrDefault().Id;
                    approveDocument = this.documentService.GetDocument(idDokumen);
                    approveDocument.Approved = true;
                    this.documentService.UpdateDocument(approveDocument);
                    break;
                case "QCReport":
                    idDokumen = this.claimDetail.Documents.Where(x => x.Type == WebApplication1.Model.DocType.QCReport).OrderByDescending(x => x.Id).FirstOrDefault().Id;
                    approveDocument = this.documentService.GetDocument(idDokumen);
                    approveDocument.Approved = true;
                    this.documentService.UpdateDocument(approveDocument);
                    break;
                case "SettlementOffer":
                    idDokumen = this.claimDetail.Documents.Where(x => x.Type == WebApplication1.Model.DocType.SettlementOffer).OrderByDescending(x => x.Id).FirstOrDefault().Id;
                    approveDocument = this.documentService.GetDocument(idDokumen);
                    approveDocument.Approved = true;
                    this.documentService.UpdateDocument(approveDocument);
                    break;
                case "LSR":
                    idDokumen = this.claimDetail.Documents.Where(x => x.Type == WebApplication1.Model.DocType.LSR).OrderByDescending(x => x.Id).FirstOrDefault().Id;
                    approveDocument = this.documentService.GetDocument(idDokumen);
                    approveDocument.Approved = true;
                    this.documentService.UpdateDocument(approveDocument);
                    break;
                case "BADisposal":
                    idDokumen = this.claimDetail.Documents.Where(x => x.Type == WebApplication1.Model.DocType.BADisposal).OrderByDescending(x => x.Id).FirstOrDefault().Id;
                    approveDocument = this.documentService.GetDocument(idDokumen);
                    approveDocument.Approved = true;
                    this.documentService.UpdateDocument(approveDocument);
                    break;
            }

            claimDetail.LatestStatus = this.statusService.GetStatus(id);
            if ((this.claimDetail.Documents.Where(x => x.Approved).Count() == 8) && (claimDetail.LatestStatus.StatusCode == "WA"))
            {
                claimDetail.LatestStatus.Done = true;
                this.statusService.UpdateStatus(claimDetail.LatestStatus);
                Status status = new Status()
                {
                    ClaimId = id,
                    StatusCode = "SP",
                    Description = "Upload Surat Pengajuan",
                    Done = false,
                    ValidFrom = DateTime.Now,
                    ValidUntil = DateTime.Now.AddDays(2)
                };
                this.statusService.CreateStatus(status);
            }
            if (claimDetail.LatestStatus.StatusCode == "SO")
            {
                claimDetail.LatestStatus.Done = true;
                this.statusService.UpdateStatus(claimDetail.LatestStatus);
                Status status = new Status()
                {
                    ClaimId = id,
                    StatusCode = "LSR",
                    Description = "Loss Subrogation Receipt",
                    Done = false,
                    ValidFrom = DateTime.Now,
                    ValidUntil = DateTime.Now.AddDays(2)
                };
                this.statusService.CreateStatus(status);
            }
            if (claimDetail.LatestStatus.StatusCode == "LSR")
            {
                claimDetail.LatestStatus.Done = true;
                this.statusService.UpdateStatus(claimDetail.LatestStatus);
                Status status = new Status()
                {
                    ClaimId = id,
                    StatusCode = "DISP",
                    Description = "Disposal Process",
                    Done = false,
                    ValidFrom = DateTime.Now,
                    ValidUntil = DateTime.Now.AddDays(9)
                };
                this.statusService.CreateStatus(status);
            }
            if (claimDetail.LatestStatus.StatusCode == "DISP")
            {
                claimDetail.LatestStatus.Done = true;
                this.statusService.UpdateStatus(claimDetail.LatestStatus);
            }
        }

        protected void RejectDocument_Click(object sender, EventArgs e)
        {
            Button btn = sender as Button;
            int idDokumen;
            Document rejectDocument;
            switch (btn.CommandArgument.ToString())
            {
                case "ClaimFormAIG":
                    idDokumen = this.claimDetail.Documents.Where(x => x.Type == WebApplication1.Model.DocType.ClaimFormAIG).OrderByDescending(x => x.Id).FirstOrDefault().Id;
                    rejectDocument = this.documentService.GetDocument(idDokumen);
                    rejectDocument.Rejected = true;
                    this.documentService.UpdateDocument(rejectDocument);
                    break;
                case "SuratLaporan":
                    idDokumen = this.claimDetail.Documents.Where(x => x.Type == WebApplication1.Model.DocType.SuratLaporan).OrderByDescending(x => x.Id).FirstOrDefault().Id;
                    rejectDocument = this.documentService.GetDocument(idDokumen);
                    rejectDocument.Rejected = true;
                    this.documentService.UpdateDocument(rejectDocument);
                    break;
                case "Invoice":
                    idDokumen = this.claimDetail.Documents.Where(x => x.Type == WebApplication1.Model.DocType.Invoice).OrderByDescending(x => x.Id).FirstOrDefault().Id;
                    rejectDocument = this.documentService.GetDocument(idDokumen);
                    rejectDocument.Rejected = true;
                    this.documentService.UpdateDocument(rejectDocument);
                    break;
                case "LP1Bulan":
                    idDokumen = this.claimDetail.Documents.Where(x => x.Type == WebApplication1.Model.DocType.LP1Bulan).OrderByDescending(x => x.Id).FirstOrDefault().Id;
                    rejectDocument = this.documentService.GetDocument(idDokumen);
                    rejectDocument.Rejected = true;
                    this.documentService.UpdateDocument(rejectDocument);
                    break;
                case "SuratJalan":
                    idDokumen = this.claimDetail.Documents.Where(x => x.Type == WebApplication1.Model.DocType.SuratJalan).OrderByDescending(x => x.Id).FirstOrDefault().Id;
                    rejectDocument = this.documentService.GetDocument(idDokumen);
                    rejectDocument.Rejected = true;
                    this.documentService.UpdateDocument(rejectDocument);
                    break;
                case "InvoicePengeluaran":
                    idDokumen = this.claimDetail.Documents.Where(x => x.Type == WebApplication1.Model.DocType.InvoicePengeluaran).OrderByDescending(x => x.Id).FirstOrDefault().Id;
                    rejectDocument = this.documentService.GetDocument(idDokumen);
                    rejectDocument.Rejected = true;
                    this.documentService.UpdateDocument(rejectDocument);
                    break;
                case "RekapPengeluaran":
                    idDokumen = this.claimDetail.Documents.Where(x => x.Type == WebApplication1.Model.DocType.RekapPengeluaran).OrderByDescending(x => x.Id).FirstOrDefault().Id;
                    rejectDocument = this.documentService.GetDocument(idDokumen);
                    rejectDocument.Rejected = true;
                    this.documentService.UpdateDocument(rejectDocument);
                    break;
                case "QCReport":
                    idDokumen = this.claimDetail.Documents.Where(x => x.Type == WebApplication1.Model.DocType.QCReport).OrderByDescending(x => x.Id).FirstOrDefault().Id;
                    rejectDocument = this.documentService.GetDocument(idDokumen);
                    rejectDocument.Rejected = true;
                    this.documentService.UpdateDocument(rejectDocument);
                    break;
            }
            claimDetail.LatestStatus = this.statusService.GetStatus(id);
            if (((this.claimDetail.Documents.Where(x => x.Approved).Count() + this.claimDetail.Documents.Where(x => x.Rejected).Count()) == 8) && (claimDetail.LatestStatus.StatusCode == "WA"))
            {
                foreach ( var doc in this.claimDetail.Documents.Where(x => x.Rejected))
                {
                    this.documentService.RemoveDocument(doc);
                }
                this.statusService.RemoveStatus(claimDetail.LatestStatus);
                claimDetail.LatestStatus = this.statusService.GetStatus(id);
                claimDetail.LatestStatus.Done = false;
                this.statusService.UpdateStatus(claimDetail.LatestStatus);
            }
        }

        protected void AONAction_Click(object sender, EventArgs e)
        {
            Button btn = sender as Button;
            string action = btn.CommandArgument.ToString();
            if (action == "approve")
            {
                claimDetail.LatestStatus = this.statusService.GetStatus(id);
                if (claimDetail.LatestStatus.StatusCode == "WO")
                {
                    claimDetail.LatestStatus.Done = true;
                    this.statusService.UpdateStatus(claimDetail.LatestStatus);
                    Status status = new Status()
                    {
                        ClaimId = id,
                        StatusCode = "SO",
                        Description = "Settlement Offer",
                        Done = false,
                        ValidFrom = DateTime.Now,
                        ValidUntil = DateTime.Now.AddDays(14)
                    };
                    this.statusService.CreateStatus(status);
                }
            }
            if (action == "feedback")
            {
                AONFeedBackView.Visible = true;
            }
        }

        protected void SubmitFeedBack_Click(object sender, EventArgs e)
        {
            claimDetail.LatestStatus = this.statusService.GetStatus(id);
            Feedback giveFeedback = new Feedback()
            {
                Text = textarea.Text
            };
            this.claimService.AddFeedback(giveFeedback);
            if (claimDetail.LatestStatus.StatusCode == "WO")
            {
                claimDetail.LatestStatus.Done = true;
                this.statusService.UpdateStatus(claimDetail.LatestStatus);
                Status status = new Status()
                {
                    ClaimId = id,
                    StatusCode = "FB",
                    Description = "Feedback from AON",
                    Done = false,
                    ValidFrom = DateTime.Now,
                    ValidUntil = DateTime.Now.AddDays(14)
                };
                this.statusService.CreateStatus(status);
            }
        }
    }
}
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
        private Int32 MAX_FILE_SIZE = 10485760;
        public IClaimService claimService { get; set; }
        public IStatusService statusService { get; set; }
        public IDocumentService documentService { get; set; }
        public INotificationService notificationService { get; set; }
        private Int32 id;
        protected Claim claimDetail { get; set; }
        protected List<string> docType = new List<string>() { 
            "image/jpeg",
            "application/msword",
            "application/vnd.openxmlformats-officedocument.wordprocessingml.document",
            "image/png",
            "application/pdf",
            "application/vnd.ms-excel",
            "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
            "application/zip",
            "application/vnd.rar"
        };
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (User.IsInRole("FBP") || User.IsInRole ("Admin"))
                {
                    FPBUploadView.Visible = true;
                    FBPLateSubmissionView.Visible = true;
                }
                if (User.IsInRole("QC") || User.IsInRole("Admin"))
                {
                    QCUploadView.Visible = true;
                }
                if (User.IsInRole("LogisticDispo") || User.IsInRole("Admin"))
                {
                    DisposalUploadView.Visible = true;
                }
                if (User.IsInRole("Treasury") || User.IsInRole("Admin"))
                {
                    TreasuryApproveView.Visible = true;
                    TreasuryUploadView.Visible = true;
                    TreasurySettlement.Visible = true;
                    TreasuryLSR.Visible = true;
                    TreasuryLateSubmissionView.Visible = true;
                    TreasuryFeedBackView.Visible = true;
                    DisposalConfirmView.Visible = true;
                }
                if (User.IsInRole("AON") || User.IsInRole("Admin"))
                {
                    AONApproveView.Visible = true;
                    AONSettlement.Visible = true;
                    AONLSR.Visible = true;
                    AONTambahanDokumen.Visible = true;
                }
            }
           
            if (!Page.RouteData.Values.Keys.Contains("id"))
            {
                Response.Redirect("Default.aspx");
            }
            id = Convert.ToInt32(Page.RouteData.Values["id"]);
            claimDetail = this.claimService.ClaimDetails(id);
            claimDetail.LatestStatus = statusService.GetStatus(id);
            if (!claimDetail.LatestStatus.Done && (claimDetail.LatestStatus.ValidUntil - DateTime.Now.Date).Days < 0) {
                ExplanationTxt1.Text = claimService.GetLateReason(claimDetail.LatestStatus.Id);
            }
        }
        protected void UploadButton_Click(object sender, EventArgs e)
        {
            if (UplClaimForm.HasFile)
            {
                try
                {
                    if (docType.Contains(UplClaimForm.PostedFile.ContentType))
                    {
                        if (UplClaimForm.PostedFile.ContentLength < this.MAX_FILE_SIZE)
                        {
                            string originalFilename = UplClaimForm.PostedFile.FileName;
                            string extensions = System.IO.Path.GetExtension(originalFilename);
                            string filename = string.Format(@"{0}", Guid.NewGuid());
                            string filePath = "/Uploads/" + filename + extensions;
                            UplClaimForm.SaveAs(Server.MapPath("~/Uploads/") + filename + extensions);
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
                    if (docType.Contains(UplSuratLaporan.PostedFile.ContentType))
                    {
                        if (UplSuratLaporan.PostedFile.ContentLength < this.MAX_FILE_SIZE)
                        {
                            string originalFilename = UplSuratLaporan.PostedFile.FileName;
                            string extensions = System.IO.Path.GetExtension(originalFilename);
                            string filename = string.Format(@"{0}", Guid.NewGuid());
                            string filePath = "/Uploads/" + filename + extensions;
                            UplSuratLaporan.SaveAs(Server.MapPath("~/Uploads/") + filename + extensions);
                            Document newDoc = new Document
                            {
                                Type = DocType.SuratLaporan,
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

            if (UplCopyInvoice.HasFile)
            {
                try
                {
                    if (docType.Contains(UplCopyInvoice.PostedFile.ContentType))
                    {
                        if (UplCopyInvoice.PostedFile.ContentLength < this.MAX_FILE_SIZE)
                        {
                            string originalFilename = UplCopyInvoice.PostedFile.FileName;
                            string extensions = System.IO.Path.GetExtension(originalFilename);
                            string filename = string.Format(@"{0}", Guid.NewGuid());
                            string filePath = "/Uploads/" + filename + extensions;
                            UplCopyInvoice.SaveAs(Server.MapPath("~/Uploads/") + filename + extensions);
                            Document newDoc = new Document
                            {
                                Type = DocType.Invoice,
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

            if (UplLP.HasFile)
            {
                try
                {
                    if (docType.Contains(UplLP.PostedFile.ContentType))
                    {
                        if (UplLP.PostedFile.ContentLength < this.MAX_FILE_SIZE)
                        {
                            string originalFilename = UplLP.PostedFile.FileName;
                            string extensions = System.IO.Path.GetExtension(originalFilename);
                            string filename = string.Format(@"{0}", Guid.NewGuid());
                            string filePath = "/Uploads/" + filename + extensions;
                            UplLP.SaveAs(Server.MapPath("~/Uploads/") + filename + extensions);
                            Document newDoc = new Document
                            {
                                Type = DocType.LP1Bulan,
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

            if (UplSuratJalan.HasFile)
            {
                try
                {
                    if (docType.Contains(UplSuratJalan.PostedFile.ContentType))
                    {
                        if (UplSuratJalan.PostedFile.ContentLength < this.MAX_FILE_SIZE)
                        {
                            string originalFilename = UplSuratJalan.PostedFile.FileName;
                            string extensions = System.IO.Path.GetExtension(originalFilename);
                            string filename = string.Format(@"{0}", Guid.NewGuid());
                            string filePath = "/Uploads/" + filename + extensions;
                            UplSuratJalan.SaveAs(Server.MapPath("~/Uploads/") + filename + extensions);
                            Document newDoc = new Document
                            {
                                Type = DocType.SuratJalan,
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

            if (UplInvoicePengeluaran.HasFile)
            {
                try
                {
                    if (docType.Contains(UplInvoicePengeluaran.PostedFile.ContentType))
                    {
                        if (UplInvoicePengeluaran.PostedFile.ContentLength < this.MAX_FILE_SIZE)
                        {
                            string originalFilename = UplInvoicePengeluaran.PostedFile.FileName;
                            string extensions = System.IO.Path.GetExtension(originalFilename);
                            string filename = string.Format(@"{0}", Guid.NewGuid());
                            string filePath = "/Uploads/" + filename + extensions;
                            UplInvoicePengeluaran.SaveAs(Server.MapPath("~/Uploads/") + filename + extensions);
                            Document newDoc = new Document
                            {
                                Type = DocType.InvoicePengeluaran,
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

            if (UplRekapPengeluaran.HasFile)
            {
                try
                {
                    if (docType.Contains(UplRekapPengeluaran.PostedFile.ContentType))
                    {
                        if (UplRekapPengeluaran.PostedFile.ContentLength < this.MAX_FILE_SIZE)
                        {
                            string originalFilename = UplRekapPengeluaran.PostedFile.FileName;
                            string extensions = System.IO.Path.GetExtension(originalFilename);
                            string filename = string.Format(@"{0}", Guid.NewGuid());
                            string filePath = "/Uploads/" + filename + extensions;
                            UplRekapPengeluaran.SaveAs(Server.MapPath("~/Uploads/") + filename + extensions);
                            Document newDoc = new Document
                            {
                                Type = DocType.RekapPengeluaran,
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

            if (UplQCReport.HasFile)
            {
                try
                {
                    if (docType.Contains(UplQCReport.PostedFile.ContentType))
                    {
                        if (UplQCReport.PostedFile.ContentLength < this.MAX_FILE_SIZE)
                        {
                            string originalFilename = UplQCReport.PostedFile.FileName;
                            string extensions = System.IO.Path.GetExtension(originalFilename);
                            string filename = string.Format(@"{0}", Guid.NewGuid());
                            string filePath = "/Uploads/" + filename + extensions;
                            UplQCReport.SaveAs(Server.MapPath("~/Uploads/") + filename + extensions);
                            Document newDoc = new Document
                            {
                                Type = DocType.QCReport,
                                FileName = filename,
                                OriginalFileName = originalFilename,
                                FilePath =filePath,
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

                Notification notification = new Notification()
                {
                    Message = "Claim documents waiting for approval",
                    Read = false,
                    RecipientRole = "Treasury",
                    ClaimId = id
                };
                this.notificationService.CreateNotification(notification);
            };
        }

        protected void UploadDokumenTambahan_Click(object sender, EventArgs e)
        {
            foreach (HttpPostedFile postedFile in UplLainLain.PostedFiles)
            {
                if (docType.Contains(postedFile.ContentType))
                {
                    if (postedFile.ContentLength < this.MAX_FILE_SIZE)
                    {
                        string originalFilename = postedFile.FileName;
                        string extensions = System.IO.Path.GetExtension(originalFilename);
                        string filename = string.Format(@"{0}", Guid.NewGuid());
                        string filePath = "/Uploads/" + filename + extensions;
                        postedFile.SaveAs(Server.MapPath("~/Uploads/") + filename + extensions);
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
            claimDetail.LatestStatus = this.statusService.GetStatus(id);
            if (claimDetail.LatestStatus.StatusCode == "FB")
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
                Notification notification = new Notification()
                {
                    Message = "Settlement offer uploaded",
                    Read = false,
                    RecipientRole = "AON",
                    ClaimId = id
                };
                this.notificationService.CreateNotification(notification);
            }
        }

        protected void UploadSuratPengajuan_Click(object sender, EventArgs e)
        {
            if (UplSuratPengajuan.HasFile)
            {
                try
                {
                    if (docType.Contains(UplSuratPengajuan.PostedFile.ContentType))
                    {
                        if (UplSuratPengajuan.PostedFile.ContentLength < this.MAX_FILE_SIZE)
                        {
                            string originalFilename = UplSuratPengajuan.PostedFile.FileName;
                            string extensions = System.IO.Path.GetExtension(originalFilename);
                            string filename = string.Format(@"{0}", Guid.NewGuid());
                            string filePath = "/Uploads/" + filename + extensions;
                            UplSuratPengajuan.SaveAs(Server.MapPath("~/Uploads/") + filename + extensions);
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
                Notification notification = new Notification()
                {
                    Message = "Claim waiting for approval",
                    Read = false,
                    RecipientRole = "AON",
                    ClaimId = id
                };
                this.notificationService.CreateNotification(notification);
            }
        }

        protected void UploadLSR_Click(object sender, EventArgs e)
        {
            if (UplLSR.HasFile)
            {
                try
                {
                    if (docType.Contains(UplLSR.PostedFile.ContentType))
                    {
                        if (UplLSR.PostedFile.ContentLength < this.MAX_FILE_SIZE)
                        {
                            string originalFilename = UplLSR.PostedFile.FileName;
                            string extensions = System.IO.Path.GetExtension(originalFilename);
                            string filename = string.Format(@"{0}", Guid.NewGuid());
                            string filePath = "/Uploads/" + filename + extensions;
                            UplLSR.SaveAs(Server.MapPath("~/Uploads/") + filename + extensions);
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
                    if (docType.Contains(UplSettlementOffer.PostedFile.ContentType))
                    {
                        if (UplSettlementOffer.PostedFile.ContentLength < this.MAX_FILE_SIZE)
                        {
                            string originalFilename = UplSettlementOffer.PostedFile.FileName;
                            string extensions = System.IO.Path.GetExtension(originalFilename);
                            string filename = string.Format(@"{0}", Guid.NewGuid());
                            string filePath = "/Uploads/" + filename + extensions;
                            UplSettlementOffer.SaveAs(Server.MapPath("~/Uploads/") + filename + extensions);
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
                    if (docType.Contains(UplBADisposal.PostedFile.ContentType))
                    {
                        if (UplBADisposal.PostedFile.ContentLength < this.MAX_FILE_SIZE)
                        {
                            string originalFilename = UplBADisposal.PostedFile.FileName;
                            string extensions = System.IO.Path.GetExtension(originalFilename);
                            string filename = string.Format(@"{0}", Guid.NewGuid());
                            string filePath = "/Uploads/" + filename + extensions;
                            UplBADisposal.SaveAs(Server.MapPath("~/Uploads/") + filename + extensions);
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

            this.claimService.ApprovalProcessCheck(id);
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
            this.claimService.ApprovalProcessCheck(id);
        }

        protected void AONAction_Click(object sender, EventArgs e)
        {
            BtnApproveFeedback.Visible = false;
            BtnFeedback.Visible = false;
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
        protected void CancelFeedBack_Click(object sender, EventArgs e)
        {
            BtnApproveFeedback.Visible = true;
            BtnFeedback.Visible = true;
            AONFeedBackView.Visible = false;
        }
        protected void SubmitFeedBack_Click(object sender, EventArgs e)
        {
            claimDetail.LatestStatus = this.statusService.GetStatus(id);
            claimDetail.Feedback = textarea.Text;
            this.claimService.UpdateClaim(claimDetail);
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
                Notification notification = new Notification()
                {
                    Message = "Feedback from AON",
                    Read = false,
                    RecipientRole = "Treasury",
                    ClaimId = id
                };
                this.notificationService.CreateNotification(notification);
            }
        }
        protected void LateSubmission_Click(object sender, EventArgs e)
        {
            claimDetail.LatestStatus = statusService.GetStatus(id);
            LateSubmission lateSubmission = new LateSubmission()
            {
                Reason = ExplanationTxt.Text,
                StatusId = claimDetail.LatestStatus.Id,
                Status = claimDetail.LatestStatus
            };
            claimService.LateSubmission(lateSubmission);
            Notification notification = new Notification()
            {
                Message = "Late document submission",
                Read = false,
                RecipientRole = "Treasury",
                ClaimId = id
            };
            this.notificationService.CreateNotification(notification);
        }
        protected void LateSubmissionAction_Click(object sender, EventArgs e)
        {
            Button btn = sender as Button;
            string action = btn.CommandArgument.ToString();
            if (action == "accept")
            {
                claimDetail.LatestStatus.ValidUntil = DateTime.Now.AddDays(3);
                statusService.UpdateStatus(claimDetail.LatestStatus);
            }
            else if (action == "reject")
            {
                claimDetail.CaseClosed = true;
                claimService.UpdateClaim(claimDetail);
            }
        }
        protected void Selesai_Click(object sender, EventArgs e)
        {
            claimDetail.CaseClosed = true;
            this.claimService.UpdateClaim(claimDetail);
        }
    }
}
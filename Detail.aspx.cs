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

            if (this.claimService.DokumenLengkap(id))
            {
                claimDetail.LatestStatus = this.statusService.GetStatus(id);
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
        protected void Approval_Click(object sender, EventArgs e)
        {
            LinkButton lnk = sender as LinkButton;
            Status updateStatus = this.statusService.GetById(Convert.ToInt32(lnk.CommandArgument));
            updateStatus.Done = true;
            this.statusService.UpdateStatus(updateStatus);
        }
    }
}
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
                                ClaimId = Convert.ToInt32(Page.RouteData.Values["id"])
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
                            string filename = string.Format(@"{0}", Guid.NewGuid());
                            UplSuratLaporan.SaveAs(Server.MapPath("~/Uploads/") + filename);
                            Document newDoc = new Document
                            {
                                Type = DocType.SuratLaporan,
                                FileName = filename,
                                FilePath = Server.MapPath("~/Uploads/") + filename,
                                Approved = false,
                                ClaimId = Convert.ToInt32(Page.RouteData.Values["id"])
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
                            string filename = string.Format(@"{0}", Guid.NewGuid());
                            UplCopyInvoice.SaveAs(Server.MapPath("~/Uploads/") + filename);
                            Document newDoc = new Document
                            {
                                Type = DocType.Invoice,
                                FileName = filename,
                                FilePath = Server.MapPath("~/Uploads/") + filename,
                                Approved = false,
                                ClaimId = Convert.ToInt32(Page.RouteData.Values["id"])
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
                            string filename = string.Format(@"{0}", Guid.NewGuid());
                            UplLP.SaveAs(Server.MapPath("~/Uploads/") + filename);
                            Document newDoc = new Document
                            {
                                Type = DocType.LP1Bulan,
                                FileName = filename,
                                FilePath = Server.MapPath("~/Uploads/") + filename,
                                Approved = false,
                                ClaimId = Convert.ToInt32(Page.RouteData.Values["id"])
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
                            string filename = string.Format(@"{0}", Guid.NewGuid());
                            UplSuratJalan.SaveAs(Server.MapPath("~/Uploads/") + filename);
                            Document newDoc = new Document
                            {
                                Type = DocType.SuratJalan,
                                FileName = filename,
                                FilePath = Server.MapPath("~/Uploads/") + filename,
                                Approved = false,
                                ClaimId = Convert.ToInt32(Page.RouteData.Values["id"])
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
                            string filename = string.Format(@"{0}", Guid.NewGuid());
                            UplInvoicePengeluaran.SaveAs(Server.MapPath("~/Uploads/") + filename);
                            Document newDoc = new Document
                            {
                                Type = DocType.InvoicePengeluaran,
                                FileName = filename,
                                FilePath = Server.MapPath("~/Uploads/") + filename,
                                Approved = false,
                                ClaimId = Convert.ToInt32(Page.RouteData.Values["id"])
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
                            string filename = string.Format(@"{0}", Guid.NewGuid());
                            UplInvoicePengeluaran.SaveAs(Server.MapPath("~/Uploads/") + filename);
                            Document newDoc = new Document
                            {
                                Type = DocType.RekapPengeluaran,
                                FileName = filename,
                                FilePath = Server.MapPath("~/Uploads/") + filename,
                                Approved = false,
                                ClaimId = Convert.ToInt32(Page.RouteData.Values["id"])
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
            LinkButton lnk = sender as LinkButton;
            Status updateStatus = this.statusService.GetById(Convert.ToInt32(lnk.CommandArgument));
            updateStatus.Done = true;
            this.statusService.UpdateStatus(updateStatus);

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
        }
    }
}
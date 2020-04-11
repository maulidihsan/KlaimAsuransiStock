<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Detail.aspx.cs" Inherits="WebApplication1.Detail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <section class="content-header">
      <!-- Breadcrumb -->
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home </a></li>
        <li class="active">Detail</li>
      </ol>
      <!-- Button Back -->
      <a href="/Default.aspx"><i class="fa fa-arrow-left"></i> Back</a>
   </section>

   <section class="content" runat="server">

     <div class="row">
       <form runat="server">
       <div class="col-md-7">
         <ul class="timeline">
             <% foreach (var status in claimDetail.Statuses.OrderByDescending(x => x.Id).ToList())
                 { %>
               <li>
                   <%  if (!status.Done) { %>
                   <i class="fa fa-clock-o bg-gray"></i>
                   <%} else { %>
                   <i class="fa fa-check bg-green"></i>
                   <% } %>

                   <div class="timeline-item">
                       <span class="time">
                           <% if (!status.Done) { %>
                              <% if ((status.ValidUntil - DateTime.Now.Date).Days < 0) { %>
                                 <a class="btn btn-danger btn-xs">Deadline melewati batas</a>
                              <% } %>
                              <% if ((status.ValidUntil - DateTime.Now.Date).Days > 0) { %>
                                 <a class="btn btn-danger btn-xs">Deadline: <%= (status.ValidUntil - DateTime.Now.Date).Days.ToString() %> hari lagi</a>
                              <% } %>
                           <% } %>
                           
                           <a class="btn btn-primary btn-xs"><%= status.StatusCode %></a>
                        </span>

                        <h3 class="timeline-header"><%= status.Description %></h3>

                        <div class="timeline-body with-border">
                            <% if (!status.Done && ((status.ValidUntil - DateTime.Now.Date).Days < 0)) { %>
                            <asp:PlaceHolder ID="FBPLateSubmissionView" runat="server" Visible="false">
                                <div class="box" runat="server">
                                    <a class="box-header bg-gray" data-toggle="collapse" href="#fbplatesubmission" role="button" aria-expanded="false" aria-controls="uploadfbp">
                                      Late Explanation
                                    </a>
                                    <div class="collapse" id="fbplatesubmission">                                   
                                        <div class="box-body">
                                            <div class="form-group">
                                                <label class="col-sm-2" for="claimformFile">Explanation</label>
                                                <div class="col-sm-7"><asp:TextBox id="ExplanationTxt" TextMode="multiline" CssClass="form-control" runat="server" /></div>
                                            </div>
                                        </div>
                                        <div class="box-footer">
                                            <div class="col-sm-2"></div>
                                            <div class="col-sm-7">
                                                <asp:Button ID="ExplanationBtn" CssClass="btn btn-primary" Text="Submit" OnClick="LateSubmission_Click" runat="server" />
                                            </div>
                                        </div>                                   
                                    </div>
                                </div>
                            </asp:PlaceHolder>
                            <asp:PlaceHolder ID="TreasuryLateSubmissionView" runat="server" Visible="false">
                                <div class="box" runat="server">
                                    <a class="box-header bg-gray" data-toggle="collapse" href="#latesubmission" role="button" aria-expanded="false" aria-controls="uploadfbp">
                                      Late Explanation
                                    </a>
                                    <div class="collapse" id="latesubmission">                                   
                                        <div class="box-body">
                                            <div class="form-group">
                                                <label class="col-sm-2" for="claimformFile">Explanation</label>
                                                <div class="col-sm-7"><asp:TextBox id="ExplanationTxt1" TextMode="multiline" CssClass="form-control" runat="server" Enabled="false" /></div>
                                            </div>
                                        </div>
                                        <div class="box-footer">
                                            <div class="col-sm-2"></div>
                                            <div class="col-sm-7">
                                                <asp:Button ID="Button1" CssClass="btn btn-primary" Text="Accept" CommandArgument="accept" OnClick="LateSubmissionAction_Click" runat="server" />
                                                <asp:Button ID="Button2" CssClass="btn btn-primary" Text="Close Claim" CommandArgument="reject" OnClick="LateSubmissionAction_Click" runat="server" />
                                            </div>
                                        </div>                                   
                                    </div>
                                </div>
                            </asp:PlaceHolder>
                            <% } %>
                            <% else { %>
                                <% if (status.StatusCode == "IN") { %>
                                <asp:PlaceHolder runat="server" ID="FPBUploadView" Visible="false">
                                    <div class="box">
                                        <a class="box-header bg-gray" data-toggle="collapse" href="#claimform" role="button" aria-expanded="false" aria-controls="uploadfbp">
                                          <div class="col-md-11">AIG Claim Form</div>
                                          <% if (claimDetail.Documents.Where(x => x.Type == WebApplication1.Model.DocType.ClaimFormAIG).Any())  { %>
                                          <div class="col-md-1"> 
                                            <i class="fa fa-check" style="color:green"></i>
                                          </div>
                                          <% } %>
                                        </a>
                                        <div class="collapse" id="claimform">
                                            <div class="box-body">
                                                <% if (!claimDetail.Statuses.Where(x => x.StatusCode == "IN").FirstOrDefault().Done ) { %>
                                                    <div class="form-group">
                                                        <label class="col-sm-2" for="UplClaimForm">File input</label>
                                                        <asp:FileUpload id="UplClaimForm" runat="server" ViewStateMode="Enabled" />
                                                    </div>
                                                <% } %>
                                                <% if (claimDetail.Documents.Where(x => x.Type == WebApplication1.Model.DocType.ClaimFormAIG).Any()) { %>
                                                    <div class="form-group">
                                                        <div class="col-sm-12"><a href="<%= claimDetail.Documents.Where(x => x.Type == WebApplication1.Model.DocType.ClaimFormAIG).OrderByDescending(x => x.Id).FirstOrDefault().FilePath %>"><%= claimDetail.Documents.Where(x => x.Type == WebApplication1.Model.DocType.ClaimFormAIG).OrderByDescending(x => x.Id).FirstOrDefault().OriginalFileName %></a></div>
                                                    </div>
                                                <% } %>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="box">
                                        <a class="box-header bg-gray" data-toggle="collapse" href="#suratlaporan" role="button" aria-expanded="false" aria-controls="uploadfbp">
                                          <div class="col-md-11">Surat Laporan Klaim Insiden</div>
                                          <% if (claimDetail.Documents.Where(x => x.Type == WebApplication1.Model.DocType.SuratLaporan).Any()) { %>
                                          <div class="col-md-1"> 
                                            <i class="fa fa-check" style="color:green"></i>
                                          </div>
                                          <% } %>
                                        </a>
                                        <div class="collapse" id="suratlaporan">
                                            <div class="box-body">
                                                 <% if (!claimDetail.Statuses.Where(x => x.StatusCode == "IN").FirstOrDefault().Done) { %>
                                                    <div class="form-group">
                                                        <label class="col-sm-2" for="UplSuratLaporan">File input</label>
                                                        <asp:FileUpload id="UplSuratLaporan" runat="server" ViewStateMode="Enabled" />
                                                    </div>
                                                <% } %>
                                                <% if (claimDetail.Documents.Where(x => x.Type == WebApplication1.Model.DocType.SuratLaporan).Any()) { %>
                                                    <div class="form-group">
                                                        <div class="col-sm-12"><a href="<%= claimDetail.Documents.Where(x => x.Type == WebApplication1.Model.DocType.SuratLaporan).OrderByDescending(x => x.Id).FirstOrDefault().FilePath %>"><%= claimDetail.Documents.Where(x => x.Type == WebApplication1.Model.DocType.SuratLaporan).OrderByDescending(x => x.Id).FirstOrDefault().OriginalFileName %></a></div>
                                                    </div>
                                                <% } %>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="box">
                                        <a class="box-header bg-gray" data-toggle="collapse" href="#copyinvoice" role="button" aria-expanded="false" aria-controls="uploadfbp">
                                          <div class="col-md-11">Invoice Barang</div>
                                          <% if (claimDetail.Documents.Where(x => x.Type == WebApplication1.Model.DocType.Invoice).Any()) { %>
                                          <div class="col-md-1"> 
                                            <i class="fa fa-check" style="color:green"></i>
                                          </div>
                                          <% } %>
                                        </a>
                                        <div class="collapse" id="copyinvoice">
                                            <div class="box-body">
                                                 <% if (!claimDetail.Statuses.Where(x => x.StatusCode == "IN").FirstOrDefault().Done) { %>
                                                    <div class="form-group">
                                                        <label class="col-sm-2" for="UplCopyInvoice">File input</label>
                                                        <asp:FileUpload id="UplCopyInvoice" runat="server" ViewStateMode="Enabled" />
                                                    </div>
                                                <% } %>
                                                <% if (claimDetail.Documents.Where(x => x.Type == WebApplication1.Model.DocType.Invoice).Any()) { %>
                                                    <div class="form-group">
                                                        <div class="col-sm-12"><a href="<%= claimDetail.Documents.Where(x => x.Type == WebApplication1.Model.DocType.Invoice).OrderByDescending(x => x.Id).FirstOrDefault().FilePath %>"><%= claimDetail.Documents.Where(x => x.Type == WebApplication1.Model.DocType.Invoice).OrderByDescending(x => x.Id).FirstOrDefault().OriginalFileName %></a></div>
                                                    </div>
                                                <% } %>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="box">
                                        <a class="box-header bg-gray" data-toggle="collapse" href="#lp" role="button" aria-expanded="false" aria-controls="uploadfbp">
                                          <div class="col-md-11">LP 1 Bulan Terakhir</div>
                                          <% if (claimDetail.Documents.Where(x => x.Type == WebApplication1.Model.DocType.LP1Bulan).Any()) { %>
                                          <div class="col-md-1"> 
                                            <i class="fa fa-check" style="color:green"></i>
                                          </div>
                                          <% } %>
                                        </a>
                                        <div class="collapse" id="lp">
                                            <div class="box-body">
                                                 <% if (!claimDetail.Statuses.Where(x => x.StatusCode == "IN").FirstOrDefault().Done) { %>
                                                    <div class="form-group">
                                                        <label class="col-sm-2" for="UplLP">File input</label>
                                                        <asp:FileUpload id="UplLP" runat="server" ViewStateMode="Enabled" />
                                                    </div>
                                                <% } %>
                                                <% if (claimDetail.Documents.Where(x => x.Type == WebApplication1.Model.DocType.LP1Bulan).Any()) { %>
                                                    <div class="form-group">
                                                        <div class="col-sm-12"><a href="<%= claimDetail.Documents.Where(x => x.Type == WebApplication1.Model.DocType.LP1Bulan).OrderByDescending(x => x.Id).FirstOrDefault().FilePath %>"><%= claimDetail.Documents.Where(x => x.Type == WebApplication1.Model.DocType.LP1Bulan).OrderByDescending(x => x.Id).FirstOrDefault().OriginalFileName %></a></div>
                                                    </div>
                                                <% } %>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="box">
                                        <a class="box-header bg-gray" data-toggle="collapse" href="#suratjalan" role="button" aria-expanded="false" aria-controls="uploadfbp">
                                          <div class="col-md-11">Surat Jalan</div>
                                          <% if (claimDetail.Documents.Where(x => x.Type == WebApplication1.Model.DocType.SuratJalan).Any()) { %>
                                          <div class="col-md-1"> 
                                            <i class="fa fa-check" style="color:green"></i>
                                          </div>
                                          <% } %>
                                        </a>
                                        <div class="collapse" id="suratjalan">
                                            <div class="box-body">
                                                 <% if (!claimDetail.Statuses.Where(x => x.StatusCode == "IN").FirstOrDefault().Done) { %>
                                                    <div class="form-group">
                                                        <label class="col-sm-2" for="UplSuratJalan">File input</label>
                                                        <asp:FileUpload id="UplSuratJalan" runat="server" ViewStateMode="Enabled" />
                                                    </div>
                                                <% } %>
                                                <% if (claimDetail.Documents.Where(x => x.Type == WebApplication1.Model.DocType.SuratJalan).Any()) { %>
                                                    <div class="form-group">
                                                        <div class="col-sm-12"><a href="<%= claimDetail.Documents.Where(x => x.Type == WebApplication1.Model.DocType.SuratJalan).OrderByDescending(x => x.Id).FirstOrDefault().FilePath %>"><%= claimDetail.Documents.Where(x => x.Type == WebApplication1.Model.DocType.SuratJalan).OrderByDescending(x => x.Id).FirstOrDefault().OriginalFileName %></a></div>
                                                    </div>
                                                <% } %>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="box">
                                        <a class="box-header bg-gray" data-toggle="collapse" href="#invoicepengeluaran" role="button" aria-expanded="false" aria-controls="uploadfbp">
                                          <div class="col-md-11">Invoice Pengeluaran Barang</div>
                                          <% if (claimDetail.Documents.Where(x => x.Type == WebApplication1.Model.DocType.InvoicePengeluaran).Any()) { %>
                                          <div class="col-md-1"> 
                                            <i class="fa fa-check" style="color:green"></i>
                                          </div>
                                          <% } %>
                                        </a>
                                        <div class="collapse" id="invoicepengeluaran">
                                            <div class="box-body">
                                                 <% if (!claimDetail.Statuses.Where(x => x.StatusCode == "IN").FirstOrDefault().Done) { %>
                                                    <div class="form-group">
                                                        <label class="col-sm-2" for="UplInvoicePengeluaran">File input</label>
                                                        <asp:FileUpload id="UplInvoicePengeluaran" runat="server" ViewStateMode="Enabled" />
                                                    </div>
                                                <% } %>
                                                <% if (claimDetail.Documents.Where(x => x.Type == WebApplication1.Model.DocType.InvoicePengeluaran).Any()) { %>
                                                    <div class="form-group">
                                                        <div class="col-sm-12"><a href="<%= claimDetail.Documents.Where(x => x.Type == WebApplication1.Model.DocType.InvoicePengeluaran).OrderByDescending(x => x.Id).FirstOrDefault().FilePath %>"><%= claimDetail.Documents.Where(x => x.Type == WebApplication1.Model.DocType.InvoicePengeluaran).OrderByDescending(x => x.Id).FirstOrDefault().OriginalFileName %></a></div>
                                                    </div>
                                                <% } %>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="box">
                                        <a class="box-header bg-gray" data-toggle="collapse" href="#rekap" role="button" aria-expanded="false" aria-controls="uploadfbp">
                                          <div class="col-md-11">Rekap Pengeluaran Barang</div>
                                          <% if (claimDetail.Documents.Where(x => x.Type == WebApplication1.Model.DocType.RekapPengeluaran).Any()) { %>
                                          <div class="col-md-1"> 
                                            <i class="fa fa-check" style="color:green"></i>
                                          </div>
                                          <% } %>
                                        </a>
                                        <div class="collapse" id="rekap">
                                            <div class="box-body">
                                                 <% if (!claimDetail.Statuses.Where(x => x.StatusCode == "IN").FirstOrDefault().Done) { %>
                                                    <div class="form-group">
                                                        <label class="col-sm-2" for="UplRekapPengeluaran">File input</label>
                                                        <asp:FileUpload id="UplRekapPengeluaran" runat="server" ViewStateMode="Enabled" />
                                                    </div>
                                                <% } %>
                                                <% if (claimDetail.Documents.Where(x => x.Type == WebApplication1.Model.DocType.RekapPengeluaran).Any()) { %>
                                                    <div class="form-group">
                                                        <div class="col-sm-12"><a href="<%= claimDetail.Documents.Where(x => x.Type == WebApplication1.Model.DocType.RekapPengeluaran).OrderByDescending(x => x.Id).FirstOrDefault().FilePath %>"><%= claimDetail.Documents.Where(x => x.Type == WebApplication1.Model.DocType.RekapPengeluaran).OrderByDescending(x => x.Id).FirstOrDefault().OriginalFileName %></a></div>
                                                    </div>
                                                <% } %>

                                            </div>
                                        </div>
                                    </div>
                                 </asp:PlaceHolder>
                                <asp:PlaceHolder runat="server" ID="QCUploadView" Visible="false">
                                    <div class="box">
                                        <a class="box-header bg-gray" data-toggle="collapse" href="#qcreport" role="button" aria-expanded="false" aria-controls="uploadfbp">
                                          <div class="col-md-11">QC Report</div>
                                          <% if (claimDetail.Documents.Where(x => x.Type == WebApplication1.Model.DocType.QCReport).Any())  { %>
                                          <div class="col-md-1"> 
                                            <i class="fa fa-check" style="color:green"></i>
                                          </div>
                                          <% } %>
                                        </a>
                                        <div class="collapse" id="qcreport">
                                            <div class="box-body">
                                                 <% if (!claimDetail.Statuses.Where(x => x.StatusCode == "IN").FirstOrDefault().Done) { %>
                                                    <div class="form-group">
                                                        <label class="col-sm-2" for="UplQCReport">File input</label>
                                                        <asp:FileUpload id="UplQCReport" runat="server" ViewStateMode="Enabled" />
                                                    </div>
                                                <% } %>
                                                <% if (claimDetail.Documents.Where(x => x.Type == WebApplication1.Model.DocType.QCReport).Any()) { %>
                                                    <div class="form-group">
                                                        <div class="col-sm-12"><a href="<%= claimDetail.Documents.Where(x => x.Type == WebApplication1.Model.DocType.QCReport).OrderByDescending(x => x.Id).FirstOrDefault().FilePath %>"><%= claimDetail.Documents.Where(x => x.Type == WebApplication1.Model.DocType.QCReport).OrderByDescending(x => x.Id).FirstOrDefault().OriginalFileName %></a></div>
                                                    </div>
                                                <% } %>
                                            </div>
                                        </div>
                                    </div>
                                </asp:PlaceHolder>
                                <% if (!status.Done) { %>
                                    <asp:Button runat="server" id="Button5" text="Upload" CssClass="btn btn-primary" onclick="UploadButton_Click" />
                                <% } %>
                                <% } %>
                                <% if (status.StatusCode == "WA") { %>
                                    <asp:PlaceHolder runat="server" ID="TreasuryApproveView" Visible="false">
                                    <div class="box">
                                        <a class="box-header bg-gray" data-toggle="collapse" href="#claimform1" role="button" aria-expanded="false" aria-controls="uploadfbp">
                                          <div class="col-md-11">AIG Claim Form</div>
                                          <% if (claimDetail.Documents.Where(x => x.Type == WebApplication1.Model.DocType.ClaimFormAIG).Select(x => x.Approved).DefaultIfEmpty(false).FirstOrDefault()) { %>
                                          <div class="col-md-1"> 
                                            <i class="fa fa-check" style="color:green"></i>
                                          </div>
                                          <% } else if (claimDetail.Documents.Where(x => x.Type == WebApplication1.Model.DocType.ClaimFormAIG).Select(x => x.Rejected).DefaultIfEmpty(false).FirstOrDefault()) { %>
                                          <div class="col-md-1"> 
                                            <i class="fa fa-times" style="color:red"></i>
                                          </div>
                                          <% } %>
                                        </a>
                                        <div class="collapse" id="claimform1">
                                            <div class="box-body">
                                               <div class="form-group">
                                                    <div class="col-sm-12"><a href="<%= claimDetail.Documents.Where(x => x.Type == WebApplication1.Model.DocType.ClaimFormAIG).OrderByDescending(x => x.Id).FirstOrDefault().FilePath %>"><%= claimDetail.Documents.Where(x => x.Type == WebApplication1.Model.DocType.ClaimFormAIG).OrderByDescending(x => x.Id).FirstOrDefault().OriginalFileName %></a></div>
                                               </div>
                                            </div>
                                            <% if (claimDetail.Documents.Where(x => x.Type == WebApplication1.Model.DocType.ClaimFormAIG && !x.Approved && !x.Rejected).Select(x => !x.Approved).DefaultIfEmpty(false).FirstOrDefault()) { %>
                                                <div class="box-footer">
                                                    <div class="col-sm-2"></div>
                                                    <div class="col-sm-7">
                                                        <asp:Button ID="BtnApproveClaimFormAiG" CssClass="btn btn-success" Text="Approve" CommandArgument="ClaimFormAIG" OnClick="Approval_Click" runat="server" />
                                                        <asp:Button ID="BtnRejectClaimFormAiG" CssClass="btn btn-danger" Text="Reject" CommandArgument="ClaimFormAIG" OnClick="RejectDocument_Click" runat="server" />
                                                    </div>
                                                </div>
                                            <% } %>
                                        </div>
                                    </div>
                                    <div class="box">
                                        <a class="box-header bg-gray" data-toggle="collapse" href="#suratlaporan1" role="button" aria-expanded="false" aria-controls="uploadfbp">
                                          <div class="col-md-11">Surat Laporan Klaim Insiden</div>
                                          <% if (claimDetail.Documents.Where(x => x.Type == WebApplication1.Model.DocType.SuratLaporan).Select(x => x.Approved).DefaultIfEmpty(false).FirstOrDefault()) { %>
                                          <div class="col-md-1"> 
                                            <i class="fa fa-check" style="color:green"></i>
                                          </div>
                                          <% } %>
                                        </a>
                                        <div class="collapse" id="suratlaporan1">
                                            <div class="box-body">
                                                <div class="form-group">
                                                    <div class="col-sm-12"><a href="<%= claimDetail.Documents.Where(x => x.Type == WebApplication1.Model.DocType.SuratLaporan).OrderByDescending(x => x.Id).FirstOrDefault().FilePath %>"><%= claimDetail.Documents.Where(x => x.Type == WebApplication1.Model.DocType.SuratLaporan).OrderByDescending(x => x.Id).FirstOrDefault().OriginalFileName %></a></div>
                                                </div>
                                            </div>
                                            <% if (claimDetail.Documents.Where(x => x.Type == WebApplication1.Model.DocType.SuratLaporan).Select(x => !x.Approved).DefaultIfEmpty(false).FirstOrDefault()) { %>
                                            <div class="box-footer">
                                                <div class="col-sm-2"></div>
                                                <div class="col-sm-7">
                                                    <asp:Button ID="Button9" CssClass="btn btn-success" Text="Approve" runat="server" CommandArgument="SuratLaporan" OnClick="Approval_Click" />
                                                    <asp:Button ID="Button10" CssClass="btn btn-danger" Text="Reject" runat="server" CommandArgument="SuratLaporan" OnClick="RejectDocument_Click" />
                                                </div>
                                            </div> 
                                            <% } %>
                                        </div>
                                    </div>
                                    <div class="box">
                                        <a class="box-header bg-gray" data-toggle="collapse" href="#copyinvoice1" role="button" aria-expanded="false" aria-controls="uploadfbp">
                                          <div class="col-md-11">Invoice Barang</div>
                                          <% if (claimDetail.Documents.Where(x => x.Type == WebApplication1.Model.DocType.Invoice).Select(x => x.Approved).DefaultIfEmpty(false).FirstOrDefault()) { %>
                                          <div class="col-md-1"> 
                                            <i class="fa fa-check" style="color:green"></i>
                                          </div>
                                          <% } %>
                                        </a>
                                        <div class="collapse" id="copyinvoice1">
                                            <div class="box-body">
                                                <div class="form-group">
                                                    <div class="col-sm-12"><a href="<%= claimDetail.Documents.Where(x => x.Type == WebApplication1.Model.DocType.Invoice).OrderByDescending(x => x.Id).FirstOrDefault().FilePath %>"><%= claimDetail.Documents.Where(x => x.Type == WebApplication1.Model.DocType.Invoice).OrderByDescending(x => x.Id).FirstOrDefault().OriginalFileName %></a></div>
                                                </div>
                                            </div>
                                            <% if (claimDetail.Documents.Where(x => x.Type == WebApplication1.Model.DocType.Invoice).Select(x => !x.Approved).DefaultIfEmpty(false).FirstOrDefault()) { %>
                                            <div class="box-footer">
                                                <div class="col-sm-2"></div>
                                                <div class="col-sm-7">
                                                    <asp:Button ID="Button11" CssClass="btn btn-success" Text="Approve" runat="server" CommandArgument="Invoice" OnClick="Approval_Click" />
                                                    <asp:Button ID="Button12" CssClass="btn btn-danger" Text="Reject" runat="server" CommandArgument="Invoice" OnClick="RejectDocument_Click" />
                                                </div>
                                            </div>
                                            <% } %>
                                        </div>
                                    </div>
                                    <div class="box">
                                        <a class="box-header bg-gray" data-toggle="collapse" href="#lp1" role="button" aria-expanded="false" aria-controls="uploadfbp">
                                          <div class="col-md-11">LP 1 Bulan Terakhir</div>
                                          <% if (claimDetail.Documents.Where(x => x.Type == WebApplication1.Model.DocType.LP1Bulan).Select(x => x.Approved).DefaultIfEmpty(false).FirstOrDefault())  { %>
                                          <div class="col-md-1"> 
                                            <i class="fa fa-check" style="color:green"></i>
                                          </div>
                                          <% } %>
                                        </a>
                                        <div class="collapse" id="lp1">
                                            <div class="box-body">
                                               <div class="form-group">
                                                    <div class="col-sm-12"><a href="<%= claimDetail.Documents.Where(x => x.Type == WebApplication1.Model.DocType.LP1Bulan).OrderByDescending(x => x.Id).FirstOrDefault().FilePath %>"><%= claimDetail.Documents.Where(x => x.Type == WebApplication1.Model.DocType.LP1Bulan).OrderByDescending(x => x.Id).FirstOrDefault().OriginalFileName %></a></div>
                                               </div>
                                            </div>
                                            <% if (claimDetail.Documents.Where(x => x.Type == WebApplication1.Model.DocType.LP1Bulan).Select(x => !x.Approved).DefaultIfEmpty(false).FirstOrDefault()) { %>
                                            <div class="box-footer">
                                                <div class="col-sm-2"></div>
                                                <div class="col-sm-7">
                                                    <asp:Button ID="Button13" CssClass="btn btn-success" Text="Approve" runat="server" CommandArgument="LP1Bulan" OnClick="Approval_Click" />
                                                    <asp:Button ID="Button14" CssClass="btn btn-danger" Text="Reject" runat="server" CommandArgument="LP1Bulan" OnClick="RejectDocument_Click" />
                                                </div>
                                            </div>
                                            <% } %>
                                        </div>
                                    </div>
                                    <div class="box">
                                        <a class="box-header bg-gray" data-toggle="collapse" href="#suratjalan1" role="button" aria-expanded="false" aria-controls="uploadfbp">
                                          <div class="col-md-11">Surat Jalan</div>
                                          <% if (claimDetail.Documents.Where(x => x.Type == WebApplication1.Model.DocType.SuratJalan).Select(x => x.Approved).DefaultIfEmpty(false).FirstOrDefault()) { %>
                                          <div class="col-md-1"> 
                                            <i class="fa fa-check" style="color:green"></i>
                                          </div>
                                          <% } %>
                                        </a>
                                        <div class="collapse" id="suratjalan1">
                                            <div class="box-body">
                                                <div class="form-group">
                                                    <div class="col-sm-12"><a href="<%= claimDetail.Documents.Where(x => x.Type == WebApplication1.Model.DocType.SuratJalan).OrderByDescending(x => x.Id).FirstOrDefault().FilePath %>"><%= claimDetail.Documents.Where(x => x.Type == WebApplication1.Model.DocType.SuratJalan).OrderByDescending(x => x.Id).FirstOrDefault().OriginalFileName %></a></div>
                                                </div>
                                            </div>
                                            <% if (claimDetail.Documents.Where(x => x.Type == WebApplication1.Model.DocType.SuratJalan).Select(x => !x.Approved).DefaultIfEmpty(false).FirstOrDefault()) { %>
                                            <div class="box-footer">
                                                <div class="col-sm-2"></div>
                                                <div class="col-sm-7">
                                                    <asp:Button ID="Button15" CssClass="btn btn-success" Text="Approve" runat="server" CommandArgument="SuratJalan" OnClick="Approval_Click" />
                                                    <asp:Button ID="Button16" CssClass="btn btn-danger" Text="Reject" runat="server" CommandArgument="SuratJalan" OnClick="RejectDocument_Click" />
                                                </div>
                                            </div>
                                            <% } %>
                                        </div>
                                    </div>
                                    <div class="box">
                                        <a class="box-header bg-gray" data-toggle="collapse" href="#invoicepengeluaran1" role="button" aria-expanded="false" aria-controls="uploadfbp">
                                          <div class="col-md-11">Invoice Pengeluaran Barang</div>
                                          <% if (claimDetail.Documents.Where(x => x.Type == WebApplication1.Model.DocType.InvoicePengeluaran).Select(x => x.Approved).DefaultIfEmpty(false).FirstOrDefault()) { %>
                                          <div class="col-md-1"> 
                                            <i class="fa fa-check" style="color:green"></i>
                                          </div>
                                          <% } %>
                                        </a>
                                        <div class="collapse" id="invoicepengeluaran1">
                                            <div class="box-body">
                                                <div class="form-group">
                                                    <div class="col-sm-12"><a href="<%= claimDetail.Documents.Where(x => x.Type == WebApplication1.Model.DocType.InvoicePengeluaran).OrderByDescending(x => x.Id).FirstOrDefault().FilePath %>"><%= claimDetail.Documents.Where(x => x.Type == WebApplication1.Model.DocType.InvoicePengeluaran).OrderByDescending(x => x.Id).FirstOrDefault().OriginalFileName %></a></div>
                                                </div>
                                            </div>
                                            <% if (claimDetail.Documents.Where(x => x.Type == WebApplication1.Model.DocType.InvoicePengeluaran).Select(x => !x.Approved).DefaultIfEmpty(false).FirstOrDefault()) { %>
                                            <div class="box-footer">
                                                <div class="col-sm-2"></div>
                                                <div class="col-sm-7">
                                                    <asp:Button ID="Button17" CssClass="btn btn-success" Text="Approve" runat="server" CommandArgument="InvoicePengeluaran" OnClick="Approval_Click" />
                                                    <asp:Button ID="Button18" CssClass="btn btn-danger" Text="Reject" runat="server" CommandArgument="InvoicePengeluaran" OnClick="RejectDocument_Click" />
                                                </div>
                                            </div>
                                            <% } %>
                                        </div>
                                    </div>
                                    <div class="box">
                                        <a class="box-header bg-gray" data-toggle="collapse" href="#rekap1" role="button" aria-expanded="false" aria-controls="uploadfbp">
                                          <div class="col-md-11">Rekap Pengeluaran Barang</div>
                                          <% if (claimDetail.Documents.Where(x => x.Type == WebApplication1.Model.DocType.RekapPengeluaran).Select(x => x.Approved).DefaultIfEmpty(false).FirstOrDefault()) { %>
                                          <div class="col-md-1"> 
                                            <i class="fa fa-check" style="color:green"></i>
                                          </div>
                                          <% } %>
                                        </a>
                                        <div class="collapse" id="rekap1">
                                            <div class="box-body">
                                                <div class="form-group">
                                                    <div class="col-sm-12"><a href="<%= claimDetail.Documents.Where(x => x.Type == WebApplication1.Model.DocType.RekapPengeluaran).OrderByDescending(x => x.Id).FirstOrDefault().FilePath %>"><%= claimDetail.Documents.Where(x => x.Type == WebApplication1.Model.DocType.RekapPengeluaran).OrderByDescending(x => x.Id).FirstOrDefault().OriginalFileName %></a></div>
                                                </div>
                                            </div>
                                            <% if (claimDetail.Documents.Where(x => x.Type == WebApplication1.Model.DocType.RekapPengeluaran).Select(x => !x.Approved).DefaultIfEmpty(false).FirstOrDefault()) { %>
                                            <div class="box-footer">
                                                <div class="col-sm-2"></div>
                                                <div class="col-sm-7">
                                                    <asp:Button ID="Button19" CssClass="btn btn-success" Text="Approve" runat="server" CommandArgument="RekapPengeluaran" OnClick="Approval_Click" />
                                                    <asp:Button ID="Button20" CssClass="btn btn-danger" Text="Reject" runat="server" CommandArgument="RekapPengeluaran" OnClick="RejectDocument_Click" />
                                                </div>
                                            </div>
                                            <% } %>
                                        </div>
                                    </div>
                                     <div class="box">
                                        <a class="box-header bg-gray" data-toggle="collapse" href="#qcreport1" role="button" aria-expanded="false" aria-controls="uploadfbp">
                                          <div class="col-md-11">QC Report</div>
                                          <% if (claimDetail.Documents.Where(x => x.Type == WebApplication1.Model.DocType.QCReport).Select(x => x.Approved).DefaultIfEmpty(false).FirstOrDefault())  { %>
                                          <div class="col-md-1"> 
                                            <i class="fa fa-check" style="color:green"></i>
                                          </div>
                                          <% } %>
                                        </a>
                                        <div class="collapse" id="qcreport1">
                                            <div class="box-body">
                                                <div class="form-group">
                                                    <div class="col-sm-12"><a href="<%= claimDetail.Documents.Where(x => x.Type == WebApplication1.Model.DocType.QCReport).OrderByDescending(x => x.Id).FirstOrDefault().FilePath %>"><%= claimDetail.Documents.Where(x => x.Type == WebApplication1.Model.DocType.QCReport).OrderByDescending(x => x.Id).FirstOrDefault().OriginalFileName %></a></div>
                                                </div>
                                            </div>
                                            <% if (claimDetail.Documents.Where(x => x.Type == WebApplication1.Model.DocType.QCReport).Select(x => !x.Approved).DefaultIfEmpty(false).FirstOrDefault())  { %>
                                            <div class="box-footer">
                                                <div class="col-sm-2"></div>
                                                <div class="col-sm-7">
                                                    <asp:Button ID="Button21" CssClass="btn btn-success" Text="Approve" runat="server" CommandArgument="QCReport" OnClick="Approval_Click" />
                                                    <asp:Button ID="Button22" CssClass="btn btn-danger" Text="Reject" runat="server" CommandArgument="QCReport" OnClick="RejectDocument_Click" />
                                                </div>
                                            </div>
                                            <% } %>
                                        </div>
                                    </div>
                                 </asp:PlaceHolder>
                                <% } %>
                                <% if (status.StatusCode == "SP") { %>
                                    <asp:PlaceHolder runat="server" ID="TreasuryUploadView" Visible="false">
                                        <div class="box">
                                            <a class="box-header bg-gray" data-toggle="collapse" href="#suratpengajuan" role="button" aria-expanded="false" aria-controls="uploadfbp">
                                              <div class="col-md-11">Surat Pengajuan</div>
                                              <% if (claimDetail.Documents.Where(x => x.Type == WebApplication1.Model.DocType.SuratPengajuan).Any())  { %>
                                              <div class="col-md-1"> 
                                                <i class="fa fa-check" style="color:green"></i>
                                              </div>
                                              <% } %>
                                            </a>
                                            <div class="collapse" id="suratpengajuan">
                                                <div class="box-body">
                                                     <% if (!claimDetail.Statuses.Where(x => x.StatusCode == "SP").FirstOrDefault().Done) { %>
                                                        <div class="form-group">
                                                            <label class="col-sm-2" for="UplSuratPengajuan">File input</label>
                                                            <asp:FileUpload id="UplSuratPengajuan" runat="server" ViewStateMode="Enabled" />
                                                        </div>
                                                    <% } %>
                                                    <% if (claimDetail.Documents.Where(x => x.Type == WebApplication1.Model.DocType.SuratPengajuan).Any()) { %>
                                                        <div class="form-group">
                                                            <div class="col-sm-12"><a href="<%= claimDetail.Documents.Where(x => x.Type == WebApplication1.Model.DocType.SuratPengajuan).OrderByDescending(x => x.Id).FirstOrDefault().FilePath %>"><%= claimDetail.Documents.Where(x => x.Type == WebApplication1.Model.DocType.SuratPengajuan).OrderByDescending(x => x.Id).FirstOrDefault().OriginalFileName %></a></div>
                                                        </div>
                                                    <% } %>
                                                </div>
                                            </div>
                                        </div>
                                        <% if (!claimDetail.Statuses.Where(x => x.StatusCode == "SP").FirstOrDefault().Done) { %>
                                        <asp:Button runat="server" id="Button6" CssClass="btn btn-primary" text="Upload" onclick="UploadSuratPengajuan_Click" />
                                        <% } %>
                                    </asp:PlaceHolder>
                                <% } %>
                                <% if (status.StatusCode == "WO") { %>
                                    <asp:PlaceHolder runat="server" ID="AONApproveView" Visible="false">
                                        <% if (!claimDetail.Statuses.Where(x => x.StatusCode == "WO").FirstOrDefault().Done) { %>
                                        <div class="box">
                                            <asp:Button runat="server" id="Button24" CssClass="btn btn-success" text="Approve" CommandArgument="approve" onclick="AONAction_Click" />
                                            <asp:Button runat="server" id="Button25" CssClass="btn btn-warning" text="Give Feedback" CommandArgument="feedback" onclick="AONAction_Click" />
                                            <asp:PlaceHolder runat="server" ID="AONFeedBackView" Visible="false">
                                                <asp:textbox id="textarea" textmode="multiline" runat="server"/>
                                                <asp:Button runat="server" id="Button26" CssClass="btn btn-primary" text="Give Feedback" onclick="SubmitFeedBack_Click" />
                                            </asp:PlaceHolder>
                                        </div>
                                        <% } %>
                                    </asp:PlaceHolder>
                                <% } %>
                                <% if (status.StatusCode == "FB") { %>
                                    <asp:PlaceHolder runat="server" ID="TreasuryFeedBackView" Visible="false">
                                        <div class="box">
                                            <div class="box-body">
                                                <div class="form-group">
                                                    <label class="col-sm-2" for="claimformFile">Feedback</label>
                                                    <div class="col-sm-7"><textarea id="feeback" class="form-control" disabled><%= claimDetail.Feedback %></textarea></div>
                                                </div>
                                                <% if (claimDetail.Documents.Where(x => x.Type == WebApplication1.Model.DocType.Tambahan).Any()) { %>
                                                    <div class="form-group">
                                                        <div class="col-sm-12"><a href="<%= claimDetail.Documents.Where(x => x.Type == WebApplication1.Model.DocType.Tambahan).OrderByDescending(x => x.Id).FirstOrDefault().FilePath %>"><%= claimDetail.Documents.Where(x => x.Type == WebApplication1.Model.DocType.Tambahan).OrderByDescending(x => x.Id).FirstOrDefault().OriginalFileName %></a></div>
                                                    </div>
                                                <% } %>
                                                 <% if (!claimDetail.Statuses.Where(x => x.StatusCode == "FB").FirstOrDefault().Done) { %>
                                                <div class="form-group">
                                                    <label class="col-sm-2" for="UplLainLain">File input</label>
                                                    <asp:FileUpload id="UplLainLain" runat="server" AllowMultiple="true"  ViewStateMode="Enabled" />
                                                </div>
                                                <asp:Button runat="server" id="Button23" CssClass="btn btn-primary" text="Upload" onclick="UploadDokumenTambahan_Click" />
                                                <% } %>
                                            </div>
                                        </div>
                                    </asp:PlaceHolder>
                                    <asp:PlaceHolder runat="server" ID="AONTambahanDokumen" Visible="false">
                                        <div class="box">
                                            <div class="box-body">
                                                <div class="form-group">
                                                    <label class="col-sm-2" for="claimformFile">Feedback</label>
                                                    <div class="col-sm-7"><textarea id="feeback1" class="form-control" disabled><%= claimDetail.Feedback %></textarea></div>
                                                </div>
                                                <% if (claimDetail.Documents.Where(x => x.Type == WebApplication1.Model.DocType.Tambahan).Any()) { %>
                                                    <div class="form-group">
                                                        <div class="col-sm-12"><a href="<%= claimDetail.Documents.Where(x => x.Type == WebApplication1.Model.DocType.Tambahan).OrderByDescending(x => x.Id).FirstOrDefault().FilePath %>"><%= claimDetail.Documents.Where(x => x.Type == WebApplication1.Model.DocType.Tambahan).OrderByDescending(x => x.Id).FirstOrDefault().OriginalFileName %></a></div>
                                                    </div>
                                                <% } %>
                                            </div>
                                        </div>
                                    </asp:PlaceHolder>
                                <% } %>
                                <% if (status.StatusCode == "SO") { %>
                                    <asp:PlaceHolder runat="server" ID="AONSettlement" Visible="false">
                                        <div class="box">
                                            <a class="box-header bg-gray" data-toggle="collapse" href="#settlement" role="button" aria-expanded="false" aria-controls="uploadfbp">
                                              <div class="col-md-11">Settlement Offer</div>
                                              <% if (claimDetail.Documents.Where(x => x.Type == WebApplication1.Model.DocType.SettlementOffer).Any())  { %>
                                              <div class="col-md-1"> 
                                                <i class="fa fa-check" style="color:green"></i>
                                              </div>
                                              <% } %>
                                            </a>
                                            <div class="collapse" id="settlement">
                                                <div class="box-body">
                                                    <% if (!claimDetail.Statuses.Where(x => x.StatusCode == "SO").FirstOrDefault().Done) { %>
                                                        <div class="form-group">
                                                            <label class="col-sm-2" for="UplSuratPengajuan">File input</label>
                                                            <asp:FileUpload id="UplSettlementOffer" runat="server" ViewStateMode="Enabled" />
                                                        </div>
                                                    <% } %>
                                                    <% if (claimDetail.Documents.Where(x => x.Type == WebApplication1.Model.DocType.SettlementOffer).Any()) { %>
                                                        <div class="form-group">
                                                            <div class="col-sm-12"><a href="<%= claimDetail.Documents.Where(x => x.Type == WebApplication1.Model.DocType.SettlementOffer).OrderByDescending(x => x.Id).FirstOrDefault().FilePath %>"><%= claimDetail.Documents.Where(x => x.Type == WebApplication1.Model.DocType.SettlementOffer).OrderByDescending(x => x.Id).FirstOrDefault().OriginalFileName %></a></div>
                                                        </div>
                                                    <% } %>
                                                </div>
                                            </div>
                                        </div>
                                         <% if (!claimDetail.Statuses.Where(x => x.StatusCode == "SO").FirstOrDefault().Done) { %>
                                        <asp:Button runat="server" id="Button27" text="Upload" CssClass="btn btn-primary" onclick="UploadSettlement_Click" />
                                        <% } %>
                                    </asp:PlaceHolder>
                                    <asp:PlaceHolder runat="server" ID="TreasurySettlement" Visible="false">
                                        <div class="box">
                                            <a class="box-header bg-gray" data-toggle="collapse" href="#settlement1" role="button" aria-expanded="false" aria-controls="uploadfbp">
                                              <div class="col-md-11">Settlement Offer</div>
                                              <% if (claimDetail.Documents.Where(x => x.Type == WebApplication1.Model.DocType.SettlementOffer).Select(x => x.Approved).DefaultIfEmpty(false).FirstOrDefault())  { %>
                                              <div class="col-md-1"> 
                                                <i class="fa fa-check" style="color:green"></i>
                                              </div>
                                              <% } %>
                                            </a>
                                            <div class="collapse" id="settlement1">
                                                <% if (claimDetail.Documents.Where(x => x.Type == WebApplication1.Model.DocType.SettlementOffer).Any()) { %>
                                                <div class="box-body">
                                                    <div class="form-group">
                                                        <div class="col-sm-12"><a href="<%= claimDetail.Documents.Where(x => x.Type == WebApplication1.Model.DocType.SettlementOffer).OrderByDescending(x => x.Id).FirstOrDefault().FilePath %>"><%= claimDetail.Documents.Where(x => x.Type == WebApplication1.Model.DocType.SettlementOffer).OrderByDescending(x => x.Id).FirstOrDefault().OriginalFileName %></a></div>
                                                    </div>
                                                </div>
                                                    <% if (!claimDetail.Statuses.Where(x => x.StatusCode == "SO").FirstOrDefault().Done) { %>
                                                    <div class="box-footer">
                                                        <div class="col-sm-2"></div>
                                                        <div class="col-sm-7">
                                                            <asp:Button ID="Button28" CssClass="btn btn-success" Text="Approve" runat="server" CommandArgument="SettlementOffer" OnClick="Approval_Click" />
                                                        </div>
                                                    </div>
                                                    <% } %>
                                                <% } %>
                                            </div>
                                        </div>
                                    </asp:PlaceHolder>
                                <% } %>
                                <% if (status.StatusCode == "LSR") { %>
                                    <asp:PlaceHolder runat="server" ID="TreasuryLSR" Visible="false">
                                        <div class="box">
                                            <a class="box-header bg-gray" data-toggle="collapse" href="#lsr" role="button" aria-expanded="false" aria-controls="uploadfbp">
                                              <div class="col-md-11">Loss Subrogation Receipt</div>
                                              <% if (claimDetail.Documents.Where(x => x.Type == WebApplication1.Model.DocType.LSR).Any())  { %>
                                              <div class="col-md-1"> 
                                                <i class="fa fa-check" style="color:green"></i>
                                              </div>
                                              <% } %>
                                            </a>
                                            <div class="collapse" id="lsr">
                                                <div class="box-body">
                                                     <% if (!claimDetail.Statuses.Where(x => x.StatusCode == "LSR").FirstOrDefault().Done) { %>
                                                        <div class="form-group">
                                                            <label class="col-sm-2" for="UplSuratPengajuan">File input</label>
                                                            <asp:FileUpload id="UplLSR" runat="server" ViewStateMode="Enabled" />
                                                        </div>
                                                    <% } %>
                                                    <% if (claimDetail.Documents.Where(x => x.Type == WebApplication1.Model.DocType.LSR).Any()) { %>
                                                        <div class="form-group">
                                                            <div class="col-sm-12"><a href="<%= claimDetail.Documents.Where(x => x.Type == WebApplication1.Model.DocType.LSR).OrderByDescending(x => x.Id).FirstOrDefault().FilePath %>"><%= claimDetail.Documents.Where(x => x.Type == WebApplication1.Model.DocType.LSR).OrderByDescending(x => x.Id).FirstOrDefault().OriginalFileName %></a></div>
                                                        </div>
                                                    <% } %>
                                                </div>
                                            </div>
                                        </div>
                                         <% if (!claimDetail.Statuses.Where(x => x.StatusCode == "LSR").FirstOrDefault().Done) { %>
                                        <asp:Button runat="server" id="Button29" text="Upload" CssClass="btn btn-primary" onclick="UploadLSR_Click" />
                                        <% } %>
                                    </asp:PlaceHolder>
                                    <asp:PlaceHolder runat="server" ID="AONLSR" Visible="false">
                                        <div class="box">
                                            <a class="box-header bg-gray" data-toggle="collapse" href="#lsr1" role="button" aria-expanded="false" aria-controls="uploadfbp">
                                              <div class="col-md-11">Loss Subrogation Receipt</div>
                                              <% if (claimDetail.Documents.Where(x => x.Type == WebApplication1.Model.DocType.LSR).Select(x => x.Approved).DefaultIfEmpty(false).FirstOrDefault())  { %>
                                              <div class="col-md-1"> 
                                                <i class="fa fa-check" style="color:green"></i>
                                              </div>
                                              <% } %>
                                            </a>
                                            <div class="collapse" id="lsr1">
                                                <% if (claimDetail.Documents.Where(x => x.Type == WebApplication1.Model.DocType.LSR).Any()) { %>
                                                <div class="box-body">
                                                    <div class="form-group">
                                                        <div class="col-sm-12"><a href="<%= claimDetail.Documents.Where(x => x.Type == WebApplication1.Model.DocType.LSR).OrderByDescending(x => x.Id).FirstOrDefault().FilePath %>"><%= claimDetail.Documents.Where(x => x.Type == WebApplication1.Model.DocType.LSR).OrderByDescending(x => x.Id).FirstOrDefault().OriginalFileName %></a></div>
                                                    </div>
                                                </div>
                                                    <% if (!claimDetail.Statuses.Where(x => x.StatusCode == "LSR").FirstOrDefault().Done) { %>
                                                    <div class="box-footer">
                                                        <div class="col-sm-2"></div>
                                                        <div class="col-sm-7">
                                                            <asp:Button ID="Button30" CssClass="btn btn-success" Text="Approve" runat="server" CommandArgument="LSR" OnClick="Approval_Click" />
                                                        </div>
                                                    </div>
                                                    <% } %>
                                                <% } %>
                                            </div>
                                        </div>
                                    </asp:PlaceHolder>
                                <% } %>
                                <% if (status.StatusCode == "DISP") { %>
                                    <asp:PlaceHolder runat="server" ID="DisposalUploadView" Visible="false">
                                        <div class="box">
                                            <a class="box-header bg-gray" data-toggle="collapse" href="#disposal" role="button" aria-expanded="false" aria-controls="uploadfbp">
                                              <div class="col-md-11">BA Disposal</div>
                                              <% if (claimDetail.Documents.Where(x => x.Type == WebApplication1.Model.DocType.BADisposal).Any())  { %>
                                              <div class="col-md-1"> 
                                                <i class="fa fa-check" style="color:green"></i>
                                              </div>
                                              <% } %>
                                            </a>
                                            <div class="collapse" id="disposal">
                                                <div class="box-body">
                                                     <% if (!claimDetail.Statuses.Where(x => x.StatusCode == "DISP").FirstOrDefault().Done) { %>
                                                        <div class="form-group">
                                                            <label class="col-sm-2" for="UplSuratPengajuan">File input</label>
                                                            <asp:FileUpload id="UplBADisposal" runat="server" ViewStateMode="Enabled" />
                                                        </div>
                                                    <% } %>
                                                    <% if (claimDetail.Documents.Where(x => x.Type == WebApplication1.Model.DocType.BADisposal).Any()) { %>
                                                        <div class="form-group">
                                                            <div class="col-sm-12"><a href="<%= claimDetail.Documents.Where(x => x.Type == WebApplication1.Model.DocType.BADisposal).OrderByDescending(x => x.Id).FirstOrDefault().FilePath %>"><%= claimDetail.Documents.Where(x => x.Type == WebApplication1.Model.DocType.BADisposal).OrderByDescending(x => x.Id).FirstOrDefault().OriginalFileName %></a></div>
                                                        </div>
                                                    <% } %>
                                                </div>
                                            </div>
                                        </div>
                                         <% if (!claimDetail.Statuses.Where(x => x.StatusCode == "DISP").FirstOrDefault().Done) { %>
                                        <asp:Button runat="server" id="Button31" text="Upload" CssClass="btn btn-primary" onclick="UploadDisposal_Click" />
                                        <% } %>
                                    </asp:PlaceHolder>
                                    <asp:PlaceHolder runat="server" ID="DisposalConfirmView" Visible="false">
                                        <div class="box">
                                            <a class="box-header bg-gray" data-toggle="collapse" href="#disposal1" role="button" aria-expanded="false" aria-controls="uploadfbp">
                                              <div class="col-md-11">BA Disposal</div>
                                              <% if (claimDetail.Documents.Where(x => x.Type == WebApplication1.Model.DocType.BADisposal).Select(x => x.Approved).DefaultIfEmpty(false).FirstOrDefault())  { %>
                                              <div class="col-md-1"> 
                                                <i class="fa fa-check" style="color:green"></i>
                                              </div>
                                              <% } %>
                                            </a>
                                            <div class="collapse" id="disposal1">
                                                <% if (claimDetail.Documents.Where(x => x.Type == WebApplication1.Model.DocType.BADisposal).Any()) { %>
                                                <div class="box-body">
                                                    <div class="form-group">
                                                        <div class="col-sm-12"><a href="<%= claimDetail.Documents.Where(x => x.Type == WebApplication1.Model.DocType.BADisposal).OrderByDescending(x => x.Id).FirstOrDefault().FilePath %>"><%= claimDetail.Documents.Where(x => x.Type == WebApplication1.Model.DocType.BADisposal).OrderByDescending(x => x.Id).FirstOrDefault().OriginalFileName %></a></div>
                                                    </div>
                                                </div>
                                                    <% if (!claimDetail.Statuses.Where(x => x.StatusCode == "DISP").FirstOrDefault().Done) { %>
                                                    <div class="box-footer">
                                                        <div class="col-sm-2"></div>
                                                        <div class="col-sm-7">
                                                            <asp:Button ID="Button32" CssClass="btn btn-success" Text="Approve" runat="server" CommandArgument="BADisposal" OnClick="Approval_Click" />
                                                        </div>
                                                    </div>
                                                    <% } %>
                                                <% } %>
                                            </div>
                                        </div>
                                    </asp:PlaceHolder>
                                <% } %>
                            <%} %>
                        </div>
                    </div>
               </li>
           <% } %>
             <!-- end step -->
         </ul>
        </div>

        <!-- form data -->
        <div class="col-md-5">
         <div class="box box-info">
            <div class="box-header with-border">
              <h1 class="box-title">Raise Klaim</h1>
            </div>
            <!-- form start -->            
              <div class="box-body">
                <!-- Form isi Raise Klaim -->
                <div class="form-group">
                  <label class="col-sm-4 control-label">Nama Distributor</label>
                  <p class="col-sm-6 form-control-static"><%= claimDetail.Distributor %></p>
                </div>
                <div class="form-group">
                  <label class="col-sm-4 control-label">Kode Distributor</label>
                  <p class="col-sm-6 form-control-static"><%= claimDetail.DistributorCode %></p>
                </div>
                <div class="form-group">
                  <label class="col-sm-4 control-label">Insiden Klaim</label>
                  <p class="col-sm-6 form-control-static"><%= claimDetail.Cause %></p>
                </div>
                <div class="form-group">
                  <label class="col-sm-4 control-label">Tanggal Kejadian</label>
                  <p class="col-sm-6 form-control-static"><%= claimDetail.Date.ToString() %></p>
                </div>
                <div class="form-group">
                  <label class="col-sm-4 control-label">Area</label>
                  <p class="col-sm-6 form-control-static"><%= claimDetail.CustomerFacing.CFArea %></p>
                </div>
                <div class="form-group">
                  <label class="col-sm-4 control-label">CF to be Notified</label>
                  <p class="col-sm-6 form-control-static"><%= claimDetail.CustomerFacing.CFEmail %></p>
                </div>
                <div class="form-group">
                  <label class="col-sm-4 control-label">PIC Name</label>
                  <p class="col-sm-6 form-control-static"><%= claimDetail.PICName %></p>
                </div>
              </div>            
         </div>
        </div>

        </form>
     </div>
   </section>

</asp:Content>

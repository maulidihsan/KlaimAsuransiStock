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

           <!-- State Awal -->

           <!-- Disposal Proccess Awal -->
            <li>
              <i class="fa fa-refresh bg-orange"></i>

                <div class="timeline-item">
                       <span class="time">
                           <a class="btn btn-danger btn-xs">Deadline: 21</a>
                           <a class="btn btn-primary btn-xs">disp</a>
                        </span>

                        <h3 class="timeline-header">Disposal Proccess</h3>

                        <div class="timeline-body with-border">
                            <div class="box">
                                <a class="box-header bg-gray" data-toggle="collapse" href="#disposalproccess" role="button" aria-expanded="false" aria-controls="uploadfbp">
                                  <div class="col-md-11"> 
                                      Disposal Documentation
                                  </div>
                                  <div class="col-md-1"> 
                                      <i class="fa fa-check" style="color:green"></i>
                                  </div>
                                </a>
                                <div class="collapse" id="disposalproccess">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label class="col-sm-2" for="claimformFile">File input</label>
                                            <div class="col-sm-7"><input type="file"></div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-"></div>
                                            <div class="col-sm-7">
                                                <asp:Button ID="BtnSubmitDisp" CssClass="btn btn-primary" Text="Submit" runat="server" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                </div>
            </li>

            
            <!-- LSR Approval Awal -->
            <li>
              <i class="fa fa-refresh bg-orange"></i>

                <div class="timeline-item">
                       <span class="time">
                           <a class="btn btn-danger btn-xs">Deadline: 21</a>
                           <a class="btn btn-primary btn-xs">LSR</a>
                        </span>

                        <h3 class="timeline-header">LSR Approved</h3>

                        <div class="timeline-body with-border">
                            <!-- LSR Approval -->
                            <div class="box">
                                <a class="box-header bg-gray" data-toggle="collapse" href="#lsr1" role="button" aria-expanded="false" aria-controls="uploadfbp">
                                  LSR Approval
                                </a>
                                <div class="collapse" id="lsr1">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label class="col-sm-2" for="claimformFile">File input</label>
                                            <div class="col-sm-7"><input type="file"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Upload LSR -->
                            <div class="box">
                                <a class="box-header bg-gray" data-toggle="collapse" href="#lsr2" role="button" aria-expanded="false" aria-controls="uploadfbp">
                                  Upload LSR
                                </a>
                                <div class="collapse" id="lsr2">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label class="col-sm-2" for="claimformFile">File input</label>
                                            <div class="col-sm-7"><input type="file"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                </div>
            </li>


            <!-- Settlement Offer Awal -->
            <li>
              <i class="fa fa-refresh bg-orange"></i>

                <div class="timeline-item">
                       <span class="time">
                           <a class="btn btn-danger btn-xs">Deadline: 21</a>
                           <a class="btn btn-primary btn-xs">SO</a>
                        </span>

                        <h3 class="timeline-header">Settlement Offer</h3>

                        <div class="timeline-body with-border">
                            <!-- Settlement Offer Approval -->
                            <div class="box">
                                <a class="box-header bg-gray" data-toggle="collapse" href="#settlementoffer1" role="button" aria-expanded="false" aria-controls="uploadfbp">
                                  Settlement Offer Approval
                                </a>
                                <div class="collapse" id="settlementoffer1">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label class="col-sm-2" for="claimformFile">File input</label>
                                            <div class="col-sm-7"><input type="file"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Upload Settlement Offer -->
                            <div class="box">
                                <a class="box-header bg-gray" data-toggle="collapse" href="#settlementoffer2" role="button" aria-expanded="false" aria-controls="uploadfbp">
                                  Upload Settlement Offer
                                </a>
                                <div class="collapse" id="settlementoffer2">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label class="col-sm-2" for="claimformFile">File input</label>
                                            <div class="col-sm-7"><input type="file"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                </div>
            </li>


            <!-- Late Submission Awal -->
            <li>
              <i class="fa fa-refresh bg-orange"></i>

                <div class="timeline-item">
                       <span class="time">
                           <a class="btn btn-danger btn-xs">Deadline: 21</a>
                           <a class="btn btn-primary btn-xs">LS</a>
                        </span>

                        <h3 class="timeline-header">Late Submission</h3>

                        <div class="timeline-body with-border">
                            <div class="box" runat="server">
                                <a class="box-header bg-gray" data-toggle="collapse" href="#latesubmission" role="button" aria-expanded="false" aria-controls="uploadfbp">
                                  Late Explanation
                                </a>
                                <div class="collapse" id="latesubmission">                                   
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label class="col-sm-2" for="claimformFile">Explanation</label>
                                            <div class="col-sm-7"><asp:TextBox id="tblate" TextMode="multiline" CssClass="form-control" runat="server" /></div>
                                        </div>
                                    </div>
                                    <div class="box-footer">
                                        <div class="col-sm-2"></div>
                                        <div class="col-sm-7">
                                            <asp:Button ID="Submitlate" CssClass="btn btn-primary" Text="Submit" runat="server" />
                                        </div>
                                    </div>                                   
                                </div>
                            </div>
                        </div>
                </div>
            </li>


            <!-- Document Approval Awal -->
            <li>
              <i class="fa fa-refresh bg-orange"></i>

                <div class="timeline-item">
                       <span class="time">
                           <a class="btn btn-danger btn-xs">Deadline: 21</a>
                           <a class="btn btn-primary btn-xs">DA</a>
                        </span>

                        <h3 class="timeline-header">Document Approval</h3>

                        <div class="timeline-body with-border">
                            <!-- FBP Document Approval -->
                            <div class="box">
                                <a class="box-header bg-gray" data-toggle="collapse" href="#documentapproval1" role="button" aria-expanded="false" aria-controls="uploadfbp">
                                  FBP Document Approval
                                </a>
                                <div class="collapse" id="documentapproval1">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label class="col-sm-2" for="claimformFile">File input</label>
                                            <div class="col-sm-7"><input type="file"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Treasury Document Approval -->
                            <div class="box">
                                <a class="box-header bg-gray" data-toggle="collapse" href="#documentapproval2" role="button" aria-expanded="false" aria-controls="uploadfbp">
                                  Treasury Document Approval
                                </a>
                                <div class="collapse" id="documentapproval2">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label class="col-sm-2" for="claimformFile">File input</label>
                                            <div class="col-sm-7"><input type="file"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- QC Document Approval -->
                            <div class="box">
                                <a class="box-header bg-gray" data-toggle="collapse" href="#documentapproval3" role="button" aria-expanded="false" aria-controls="uploadfbp">
                                  QC Document Approval
                                </a>
                                <div class="collapse" id="documentapproval3">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label class="col-sm-2" for="claimformFile">File input</label>
                                            <div class="col-sm-7"><input type="file"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                </div>
            </li>


            <!-- Required Documents Awal -->
            <li>
              <i class="fa fa-refresh bg-orange"></i>

                <div class="timeline-item">
                       <span class="time">
                           <a class="btn btn-danger btn-xs">Deadline: document approval</a>
                           <a class="btn btn-primary btn-xs">IN</a>
                        </span>

                        <h3 class="timeline-header">Required Documents </h3>

                        <div class="timeline-body with-border">
                            <!-- FBP Required Documents -->
                            <div class="box">
                                <a class="box-header bg-gray" data-toggle="collapse" href="#requireddocuments1" role="button" aria-expanded="false" aria-controls="uploadfbp">
                                  FBP Required Documents
                                </a>
                                <div class="collapse" id="requireddocuments1">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label class="col-sm-2" for="claimformFile">File input</label>
                                            <div class="col-sm-7"><input type="file"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Treasury Required Documents -->
                            <div class="box">
                                <a class="box-header bg-gray" data-toggle="collapse" href="#requireddocuments2" role="button" aria-expanded="false" aria-controls="uploadfbp">
                                  Treasury Required Documents
                                </a>
                                <div class="collapse" id="requireddocuments2">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label class="col-sm-2" for="claimformFile">File input</label>
                                            <div class="col-sm-7"><input type="file"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- QC Required Documents -->
                            <div class="box">
                                <a class="box-header bg-gray" data-toggle="collapse" href="#requireddocuments3" role="button" aria-expanded="false" aria-controls="uploadfbp">
                                  QC Required Documents
                                </a>
                                <div class="collapse" id="requireddocuments3">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label class="col-sm-2" for="claimformFile">File input</label>
                                            <div class="col-sm-7"><input type="file"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                </div>
            </li>


            <!-- State Late -->

            <!-- Disposal Proccess Akhir -->
            <li>
              <i class="fa fa-times bg-red"></i>

                <div class="timeline-item">
                       <span class="time">
                           <a class="btn btn-danger btn-xs">Deadline: 21</a>
                           <a class="btn btn-primary btn-xs">disp</a>
                        </span>

                        <h3 class="timeline-header">Disposal Proccess</h3>

                        <div class="timeline-body with-border">
                            <div class="box">
                                <a class="box-header bg-gray" data-toggle="collapse" href="#disposalproccess" role="button" aria-expanded="false" aria-controls="uploadfbp">
                                  <div class="col-md-11"> 
                                      Disposal Documentation
                                  </div>
                                  <div class="col-md-1"> 
                                      <i class="fa fa-check" style="color:green"></i>
                                  </div>
                                </a>
                                <div class="collapse" id="disposalproccess">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label class="col-sm-2" for="claimformFile">File input</label>
                                            <div class="col-sm-7"><input type="file"></div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-"></div>
                                            <div class="col-sm-7">
                                                <asp:Button ID="Button7" CssClass="btn btn-primary" Text="Submit" runat="server" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                </div>
            </li>

            
            <!-- LSR Approval Akhir -->
            <li>
              <i class="fa fa-times bg-red"></i>

                <div class="timeline-item">
                       <span class="time">
                           <a class="btn btn-danger btn-xs">Deadline: 21</a>
                           <a class="btn btn-primary btn-xs">LSR</a>
                        </span>

                        <h3 class="timeline-header">LSR Approved</h3>

                        <div class="timeline-body with-border">
                            <!-- LSR Approval -->
                            <div class="box">
                                <a class="box-header bg-gray" data-toggle="collapse" href="#lsr1" role="button" aria-expanded="false" aria-controls="uploadfbp">
                                  LSR Approval
                                </a>
                                <div class="collapse" id="lsr1">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label class="col-sm-2" for="claimformFile">File input</label>
                                            <div class="col-sm-7"><input type="file"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Upload LSR -->
                            <div class="box">
                                <a class="box-header bg-gray" data-toggle="collapse" href="#lsr2" role="button" aria-expanded="false" aria-controls="uploadfbp">
                                  Upload LSR
                                </a>
                                <div class="collapse" id="lsr2">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label class="col-sm-2" for="claimformFile">File input</label>
                                            <div class="col-sm-7"><input type="file"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                </div>
            </li>


            <!-- Settlement Offer Akhir -->
            <li>
              <i class="fa fa-times bg-red"></i>

                <div class="timeline-item">
                       <span class="time">
                           <a class="btn btn-danger btn-xs">Deadline: 21</a>
                           <a class="btn btn-primary btn-xs">SO</a>
                        </span>

                        <h3 class="timeline-header">Settlement Offer</h3>

                        <div class="timeline-body with-border">
                            <!-- Settlement Offer Approval -->
                            <div class="box">
                                <a class="box-header bg-gray" data-toggle="collapse" href="#settlementoffer1" role="button" aria-expanded="false" aria-controls="uploadfbp">
                                  Settlement Offer Approval
                                </a>
                                <div class="collapse" id="settlementoffer1">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label class="col-sm-2" for="claimformFile">File input</label>
                                            <div class="col-sm-7"><input type="file"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Upload Settlement Offer -->
                            <div class="box">
                                <a class="box-header bg-gray" data-toggle="collapse" href="#settlementoffer2" role="button" aria-expanded="false" aria-controls="uploadfbp">
                                  Upload Settlement Offer
                                </a>
                                <div class="collapse" id="settlementoffer2">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label class="col-sm-2" for="claimformFile">File input</label>
                                            <div class="col-sm-7"><input type="file"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                </div>
            </li>


            <!-- Late Submission Akhir -->
            <li>
              <i class="fa fa-times bg-red"></i>

                <div class="timeline-item">
                       <span class="time">
                           <a class="btn btn-danger btn-xs">Deadline: 21</a>
                           <a class="btn btn-primary btn-xs">LS</a>
                        </span>

                        <h3 class="timeline-header">Late Submission</h3>

                        <div class="timeline-body with-border">
                            <div class="box" runat="server">
                                <a class="box-header bg-gray" data-toggle="collapse" href="#latesubmission" role="button" aria-expanded="false" aria-controls="uploadfbp">
                                  Late Explanation
                                </a>
                                <div class="collapse" id="latesubmission">                                   
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label class="col-sm-2" for="claimformFile">Explanation</label>
                                            <div class="col-sm-7"><asp:TextBox id="TextBox4" TextMode="multiline" CssClass="form-control" runat="server" /></div>
                                        </div>
                                    </div>
                                    <div class="box-footer">
                                        <div class="col-sm-2"></div>
                                        <div class="col-sm-7">
                                            <asp:Button ID="Button8" CssClass="btn btn-primary" Text="Submit" runat="server" />
                                        </div>
                                    </div>                                   
                                </div>
                            </div>
                        </div>
                </div>
            </li>


            <!-- Document Approval Akhir -->
            <li>
              <i class="fa fa-times bg-red"></i>

                <div class="timeline-item">
                       <span class="time">
                           <a class="btn btn-danger btn-xs">Deadline: 21</a>
                           <a class="btn btn-primary btn-xs">DA</a>
                        </span>

                        <h3 class="timeline-header">Document Approval</h3>

                        <div class="timeline-body with-border">
                            <!-- FBP Document Approval -->
                            <div class="box">
                                <a class="box-header bg-gray" data-toggle="collapse" href="#documentapproval1" role="button" aria-expanded="false" aria-controls="uploadfbp">
                                  FBP Document Approval
                                </a>
                                <div class="collapse" id="documentapproval1">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label class="col-sm-2" for="claimformFile">File input</label>
                                            <div class="col-sm-7"><input type="file"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Treasury Document Approval -->
                            <div class="box">
                                <a class="box-header bg-gray" data-toggle="collapse" href="#documentapproval2" role="button" aria-expanded="false" aria-controls="uploadfbp">
                                  Treasury Document Approval
                                </a>
                                <div class="collapse" id="documentapproval2">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label class="col-sm-2" for="claimformFile">File input</label>
                                            <div class="col-sm-7"><input type="file"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- QC Document Approval -->
                            <div class="box">
                                <a class="box-header bg-gray" data-toggle="collapse" href="#documentapproval3" role="button" aria-expanded="false" aria-controls="uploadfbp">
                                  QC Document Approval
                                </a>
                                <div class="collapse" id="documentapproval3">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label class="col-sm-2" for="claimformFile">File input</label>
                                            <div class="col-sm-7"><input type="file"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                </div>
            </li>


            <!-- Required Documents Akhir -->
            <li>
              <i class="fa fa-times bg-red"></i>

                <div class="timeline-item">
                       <span class="time">
                           <a class="btn btn-danger btn-xs">Deadline: document approval</a>
                           <a class="btn btn-primary btn-xs">IN</a>
                        </span>

                        <h3 class="timeline-header">Required Documents </h3>

                        <div class="timeline-body with-border">
                            <!-- FBP Required Documents -->
                            <div class="box">
                                <a class="box-header bg-gray" data-toggle="collapse" href="#requireddocuments1" role="button" aria-expanded="false" aria-controls="uploadfbp">
                                  FBP Required Documents
                                </a>
                                <div class="collapse" id="requireddocuments1">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label class="col-sm-2" for="claimformFile">File input</label>
                                            <div class="col-sm-7"><input type="file"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Treasury Required Documents -->
                            <div class="box">
                                <a class="box-header bg-gray" data-toggle="collapse" href="#requireddocuments2" role="button" aria-expanded="false" aria-controls="uploadfbp">
                                  Treasury Required Documents
                                </a>
                                <div class="collapse" id="requireddocuments2">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label class="col-sm-2" for="claimformFile">File input</label>
                                            <div class="col-sm-7"><input type="file"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- QC Required Documents -->
                            <div class="box">
                                <a class="box-header bg-gray" data-toggle="collapse" href="#requireddocuments3" role="button" aria-expanded="false" aria-controls="uploadfbp">
                                  QC Required Documents
                                </a>
                                <div class="collapse" id="requireddocuments3">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label class="col-sm-2" for="claimformFile">File input</label>
                                            <div class="col-sm-7"><input type="file"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                </div>
            </li>



            <!-- State Upload -->

            <!-- Disposal Proccess Approve -->
            <li>
              <i class="fa fa-refresh bg-orange"></i>

                <div class="timeline-item">
                       <span class="time">
                           <a class="btn btn-danger btn-xs">Deadline: 21</a>
                           <a class="btn btn-primary btn-xs">disp</a>
                        </span>

                        <h3 class="timeline-header">Disposal Proccess</h3>

                        <div class="timeline-body with-border">
                            <div class="box">
                                <a class="box-header bg-gray" data-toggle="collapse" href="#disposalproccess" role="button" aria-expanded="false" aria-controls="uploadfbp">
                                  <div class="col-md-11"> 
                                      Disposal Documentation
                                  </div>
                                  <div class="col-md-1"> 
                                      <i class="fa fa-check" style="color:green"></i>
                                  </div>
                                </a>
                                <div class="collapse" id="disposalproccess">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label class="col-sm-2" for="claimformFile">File input</label>
                                            <div class="col-sm-7"><input type="file"></div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-"></div>
                                            <div class="col-sm-7">
                                                <asp:Button ID="Button1" CssClass="btn btn-primary" Text="Submit" runat="server" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                </div>
            </li>

            
            <!-- LSR Approval Approve -->
            <li>
              <i class="fa fa-refresh bg-orange"></i>

                <div class="timeline-item">
                       <span class="time">
                           <a class="btn btn-danger btn-xs">Deadline: 21</a>
                           <a class="btn btn-primary btn-xs">LSR</a>
                        </span>

                        <h3 class="timeline-header">LSR Approved</h3>

                        <div class="timeline-body with-border">
                            <!-- LSR Approval -->
                            <div class="box">
                                <a class="box-header bg-gray" data-toggle="collapse" href="#lsr1" role="button" aria-expanded="false" aria-controls="uploadfbp">
                                  LSR Approval
                                </a>
                                <div class="collapse" id="lsr1">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label class="col-sm-2" for="claimformFile">File input</label>
                                            <div class="col-sm-7"><input type="file"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Upload LSR -->
                            <div class="box">
                                <a class="box-header bg-gray" data-toggle="collapse" href="#lsr2" role="button" aria-expanded="false" aria-controls="uploadfbp">
                                  Upload LSR
                                </a>
                                <div class="collapse" id="lsr2">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label class="col-sm-2" for="claimformFile">File input</label>
                                            <div class="col-sm-7"><input type="file"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                </div>
            </li>


            <!-- Settlement Offer Approve -->
            <li>
              <i class="fa fa-refresh bg-orange"></i>

                <div class="timeline-item">
                       <span class="time">
                           <a class="btn btn-danger btn-xs">Deadline: 21</a>
                           <a class="btn btn-primary btn-xs">SO</a>
                        </span>

                        <h3 class="timeline-header">Settlement Offer</h3>

                        <div class="timeline-body with-border">
                            <!-- Settlement Offer Approval -->
                            <div class="box">
                                <a class="box-header bg-gray" data-toggle="collapse" href="#settlementoffer1" role="button" aria-expanded="false" aria-controls="uploadfbp">
                                  Settlement Offer Approval
                                </a>
                                <div class="collapse" id="settlementoffer1">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label class="col-sm-2" for="claimformFile">File input</label>
                                            <div class="col-sm-7"><input type="file"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Upload Settlement Offer -->
                            <div class="box">
                                <a class="box-header bg-gray" data-toggle="collapse" href="#settlementoffer2" role="button" aria-expanded="false" aria-controls="uploadfbp">
                                  Upload Settlement Offer
                                </a>
                                <div class="collapse" id="settlementoffer2">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label class="col-sm-2" for="claimformFile">File input</label>
                                            <div class="col-sm-7"><input type="file"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                </div>
            </li>


            <!-- Late Submission Approve -->
            <li>
              <i class="fa fa-refresh bg-orange"></i>

                <div class="timeline-item">
                       <span class="time">
                           <a class="btn btn-danger btn-xs">Deadline: 21</a>
                           <a class="btn btn-primary btn-xs">LS</a>
                        </span>

                        <h3 class="timeline-header">Late Submission</h3>

                        <div class="timeline-body with-border">
                            <div class="box" runat="server">
                                <a class="box-header bg-gray" data-toggle="collapse" href="#latesubmission" role="button" aria-expanded="false" aria-controls="uploadfbp">
                                  Late Explanation
                                </a>
                                <div class="collapse" id="latesubmission">                                   
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label class="col-sm-2" for="claimformFile">Explanation</label>
                                            <div class="col-sm-7"><asp:TextBox id="TextBox1" TextMode="multiline" CssClass="form-control" runat="server" /></div>
                                        </div>
                                    </div>
                                    <div class="box-footer">
                                        <div class="col-sm-2"></div>
                                        <div class="col-sm-7">
                                            <asp:Button ID="Button2" CssClass="btn btn-primary" Text="Submit" runat="server" />
                                        </div>
                                    </div>                                   
                                </div>
                            </div>
                        </div>
                </div>
            </li>


            <!-- Document Approval Approve -->
            <li>
              <i class="fa fa-refresh bg-orange"></i>

                <div class="timeline-item">
                       <span class="time">
                           <a class="btn btn-danger btn-xs">Deadline: 21</a>
                           <a class="btn btn-primary btn-xs">DA</a>
                        </span>

                        <h3 class="timeline-header">Document Approval</h3>

                        <div class="timeline-body with-border">
                            <!-- FBP Document Approval -->
                            <div class="box">
                                <a class="box-header bg-gray" data-toggle="collapse" href="#documentapproval1" role="button" aria-expanded="false" aria-controls="uploadfbp">
                                  FBP Document Approval
                                </a>
                                <div class="collapse" id="documentapproval1">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label class="col-sm-2" for="claimformFile">File input</label>
                                            <div class="col-sm-7"><input type="file"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Treasury Document Approval -->
                            <div class="box">
                                <a class="box-header bg-gray" data-toggle="collapse" href="#documentapproval2" role="button" aria-expanded="false" aria-controls="uploadfbp">
                                  Treasury Document Approval
                                </a>
                                <div class="collapse" id="documentapproval2">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label class="col-sm-2" for="claimformFile">File input</label>
                                            <div class="col-sm-7"><input type="file"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- QC Document Approval -->
                            <div class="box">
                                <a class="box-header bg-gray" data-toggle="collapse" href="#documentapproval3" role="button" aria-expanded="false" aria-controls="uploadfbp">
                                  QC Document Approval
                                </a>
                                <div class="collapse" id="documentapproval3">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label class="col-sm-2" for="claimformFile">File input</label>
                                            <div class="col-sm-7"><input type="file"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                </div>
            </li>


            <!-- Required Documents Approve -->
            <li>
              <i class="fa fa-refresh bg-orange"></i>

                <div class="timeline-item">
                       <span class="time">
                           <a class="btn btn-danger btn-xs">Deadline: document approval</a>
                           <a class="btn btn-primary btn-xs">IN</a>
                        </span>

                        <h3 class="timeline-header">Required Documents </h3>

                        <div class="timeline-body with-border">
                            <!-- FBP Required Documents -->
                            <div class="box">
                                <a class="box-header bg-gray" data-toggle="collapse" href="#requireddocuments1" role="button" aria-expanded="false" aria-controls="uploadfbp">
                                  FBP Required Documents
                                </a>
                                <div class="collapse" id="requireddocuments1">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label class="col-sm-2" for="claimformFile">File input</label>
                                            <div class="col-sm-7"><input type="file"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Treasury Required Documents -->
                            <div class="box">
                                <a class="box-header bg-gray" data-toggle="collapse" href="#requireddocuments2" role="button" aria-expanded="false" aria-controls="uploadfbp">
                                  Treasury Required Documents
                                </a>
                                <div class="collapse" id="requireddocuments2">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label class="col-sm-2" for="claimformFile">File input</label>
                                            <div class="col-sm-7"><input type="file"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- QC Required Documents -->
                            <div class="box">
                                <a class="box-header bg-gray" data-toggle="collapse" href="#requireddocuments3" role="button" aria-expanded="false" aria-controls="uploadfbp">
                                  QC Required Documents
                                </a>
                                <div class="collapse" id="requireddocuments3">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label class="col-sm-2" for="claimformFile">File input</label>
                                            <div class="col-sm-7"><input type="file"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                </div>
            </li>

            
            <!-- State Selesai -->

            <!-- Disposal Proccess Akhir -->
            <li>
              <i class="fa fa-check bg-green"></i>

                <div class="timeline-item">
                       <span class="time">
                           <a class="btn btn-danger btn-xs">Deadline: 21</a>
                           <a class="btn btn-primary btn-xs">disp</a>
                        </span>

                        <h3 class="timeline-header">Disposal Proccess</h3>

                        <div class="timeline-body with-border">
                            <div class="box">
                                <a class="box-header bg-gray" data-toggle="collapse" href="#disposalproccess" role="button" aria-expanded="false" aria-controls="uploadfbp">
                                  <div class="col-md-11"> 
                                      Disposal Documentation
                                  </div>
                                  <div class="col-md-1"> 
                                      <i class="fa fa-check" style="color:green"></i>
                                  </div>
                                </a>
                                <div class="collapse" id="disposalproccess">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label class="col-sm-2" for="claimformFile">File input</label>
                                            <div class="col-sm-7"><input type="file"></div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-"></div>
                                            <div class="col-sm-7">
                                                <asp:Button ID="Button3" CssClass="btn btn-primary" Text="Submit" runat="server" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                </div>
            </li>

            
            <!-- LSR Approval Akhir -->
            <li>
              <i class="fa fa-check bg-green"></i>

                <div class="timeline-item">
                       <span class="time">
                           <a class="btn btn-danger btn-xs">Deadline: 21</a>
                           <a class="btn btn-primary btn-xs">LSR</a>
                        </span>

                        <h3 class="timeline-header">LSR Approved</h3>

                        <div class="timeline-body with-border">
                            <!-- LSR Approval -->
                            <div class="box">
                                <a class="box-header bg-gray" data-toggle="collapse" href="#lsr1" role="button" aria-expanded="false" aria-controls="uploadfbp">
                                  LSR Approval
                                </a>
                                <div class="collapse" id="lsr1">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label class="col-sm-2" for="claimformFile">File input</label>
                                            <div class="col-sm-7"><input type="file"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Upload LSR -->
                            <div class="box">
                                <a class="box-header bg-gray" data-toggle="collapse" href="#lsr2" role="button" aria-expanded="false" aria-controls="uploadfbp">
                                  Upload LSR
                                </a>
                                <div class="collapse" id="lsr2">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label class="col-sm-2" for="claimformFile">File input</label>
                                            <div class="col-sm-7"><input type="file"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                </div>
            </li>


            <!-- Settlement Offer Akhir -->
            <li>
              <i class="fa fa-check bg-green"></i>

                <div class="timeline-item">
                       <span class="time">
                           <a class="btn btn-danger btn-xs">Deadline: 21</a>
                           <a class="btn btn-primary btn-xs">SO</a>
                        </span>

                        <h3 class="timeline-header">Settlement Offer</h3>

                        <div class="timeline-body with-border">
                            <!-- Settlement Offer Approval -->
                            <div class="box">
                                <a class="box-header bg-gray" data-toggle="collapse" href="#settlementoffer1" role="button" aria-expanded="false" aria-controls="uploadfbp">
                                  Settlement Offer Approval
                                </a>
                                <div class="collapse" id="settlementoffer1">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label class="col-sm-2" for="claimformFile">File input</label>
                                            <div class="col-sm-7"><input type="file"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Upload Settlement Offer -->
                            <div class="box">
                                <a class="box-header bg-gray" data-toggle="collapse" href="#settlementoffer2" role="button" aria-expanded="false" aria-controls="uploadfbp">
                                  Upload Settlement Offer
                                </a>
                                <div class="collapse" id="settlementoffer2">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label class="col-sm-2" for="claimformFile">File input</label>
                                            <div class="col-sm-7"><input type="file"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                </div>
            </li>


            <!-- Late Submission Akhir -->
            <li>
              <i class="fa fa-check bg-green"></i>

                <div class="timeline-item">
                       <span class="time">
                           <a class="btn btn-danger btn-xs">Deadline: 21</a>
                           <a class="btn btn-primary btn-xs">LS</a>
                        </span>

                        <h3 class="timeline-header">Late Submission</h3>

                        <div class="timeline-body with-border">
                            <div class="box" runat="server">
                                <a class="box-header bg-gray" data-toggle="collapse" href="#latesubmission" role="button" aria-expanded="false" aria-controls="uploadfbp">
                                  Late Explanation
                                </a>
                                <div class="collapse" id="latesubmission">                                   
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label class="col-sm-2" for="claimformFile">Explanation</label>
                                            <div class="col-sm-7"><asp:TextBox id="TextBox2" TextMode="multiline" CssClass="form-control" runat="server" /></div>
                                        </div>
                                    </div>
                                    <div class="box-footer">
                                        <div class="col-sm-2"></div>
                                        <div class="col-sm-7">
                                            <asp:Button ID="Button4" CssClass="btn btn-primary" Text="Submit" runat="server" />
                                        </div>
                                    </div>                                   
                                </div>
                            </div>
                        </div>
                </div>
            </li>


            <!-- Document Approval Akhir -->
            <li>
              <i class="fa fa-check bg-green"></i>

                <div class="timeline-item">
                       <span class="time">
                           <a class="btn btn-danger btn-xs">Deadline: 21</a>
                           <a class="btn btn-primary btn-xs">DA</a>
                        </span>

                        <h3 class="timeline-header">Document Approval</h3>

                        <div class="timeline-body with-border">
                            <!-- FBP Document Approval -->
                            <div class="box">
                                <a class="box-header bg-gray" data-toggle="collapse" href="#documentapproval1" role="button" aria-expanded="false" aria-controls="uploadfbp">
                                  FBP Document Approval
                                </a>
                                <div class="collapse" id="documentapproval1">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label class="col-sm-2" for="claimformFile">File input</label>
                                            <div class="col-sm-7"><input type="file"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Treasury Document Approval -->
                            <div class="box">
                                <a class="box-header bg-gray" data-toggle="collapse" href="#documentapproval2" role="button" aria-expanded="false" aria-controls="uploadfbp">
                                  Treasury Document Approval
                                </a>
                                <div class="collapse" id="documentapproval2">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label class="col-sm-2" for="claimformFile">File input</label>
                                            <div class="col-sm-7"><input type="file"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- QC Document Approval -->
                            <div class="box">
                                <a class="box-header bg-gray" data-toggle="collapse" href="#documentapproval3" role="button" aria-expanded="false" aria-controls="uploadfbp">
                                  QC Document Approval
                                </a>
                                <div class="collapse" id="documentapproval3">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label class="col-sm-2" for="claimformFile">File input</label>
                                            <div class="col-sm-7"><input type="file"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                </div>
            </li>


            <!-- Required Documents Akhir -->
            <li>
              <i class="fa fa-check bg-green"></i>

                <div class="timeline-item">
                       <span class="time">
                           <a class="btn btn-danger btn-xs">Deadline: document approval</a>
                           <a class="btn btn-primary btn-xs">IN</a>
                        </span>

                        <h3 class="timeline-header">Required Documents </h3>

                        <div class="timeline-body with-border">
                            <!-- FBP Required Documents -->
                            <div class="box">
                                <a class="box-header bg-gray" data-toggle="collapse" href="#requireddocuments1" role="button" aria-expanded="false" aria-controls="uploadfbp">
                                  FBP Required Documents
                                </a>
                                <div class="collapse" id="requireddocuments1">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label class="col-sm-2" for="claimformFile">File input</label>
                                            <div class="col-sm-7"><input type="file"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Treasury Required Documents -->
                            <div class="box">
                                <a class="box-header bg-gray" data-toggle="collapse" href="#requireddocuments2" role="button" aria-expanded="false" aria-controls="uploadfbp">
                                  Treasury Required Documents
                                </a>
                                <div class="collapse" id="requireddocuments2">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label class="col-sm-2" for="claimformFile">File input</label>
                                            <div class="col-sm-7"><input type="file"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- QC Required Documents -->
                            <div class="box">
                                <a class="box-header bg-gray" data-toggle="collapse" href="#requireddocuments3" role="button" aria-expanded="false" aria-controls="uploadfbp">
                                  QC Required Documents
                                </a>
                                <div class="collapse" id="requireddocuments3">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label class="col-sm-2" for="claimformFile">File input</label>
                                            <div class="col-sm-7"><input type="file"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                </div>
            </li>



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


<%--<ul class="timeline">
           <% foreach (var status in claimDetail.Statuses)
               { %>
               <li>
                   <%  if (!status.Done) { %>
                   <i class="fa fa-clock-o bg-gray"></i>
                   <%} else { %>
                   <i class="fa fa-check bg-green"></i>
                   <% } %>

                   <div class="timeline-item">
                       <span class="time">
                           <a class="btn btn-danger btn-xs">Deadline: <%= status.ValidUntil.ToString() %></a>
                           <a class="btn btn-primary btn-xs"><%= status.StatusCode %></a>
                        </span>

                        <h3 class="timeline-header"><%= status.Description %></h3>

                        <div class="timeline-body with-border">
                            <%  if (status.StatusCode == "IN") { %>
                            <div class="box">
                                <a class="box-header bg-gray" data-toggle="collapse" href="#claimform" role="button" aria-expanded="false" aria-controls="uploadfbp">
                                  AIG Claim Form
                                </a>
                                <div class="collapse" id="claimform">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label class="col-sm-2" for="claimformFile">File input</label>
                                            <div class="col-sm-7"><input type="file" id="claimformFile"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="box">
                                <a class="box-header bg-gray" data-toggle="collapse" href="#laporanklaim" role="button" aria-expanded="false" aria-controls="uploadfbp">
                                  Surat Laporan Klaim
                                </a>
                                <div class="collapse" id="laporanklaim">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label class="col-sm-2" for="laporanklaimFile">File input</label>
                                            <div class="col-sm-7"><input type="file" id="laporanklaimFile"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="box">
                                <a class="box-header bg-gray" data-toggle="collapse" href="#invoicebarang" role="button" aria-expanded="false" aria-controls="uploadfbp">
                                  Invoice Barang Rusak
                                </a>
                                <div class="collapse" id="invoicebarang">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label class="col-sm-2" for="invoicebarangFile">File input</label>
                                            <div class="col-sm-7"><input type="file" id="invoicebarangFile"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="box">
                                <a class="box-header bg-gray" data-toggle="collapse" href="#lp" role="button" aria-expanded="false" aria-controls="uploadfbp">
                                  LP 1 bulan terakhir
                                </a>
                                <div class="collapse" id="lp">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label class="col-sm-2" for="lpFile">File input</label>
                                            <div class="col-sm-7"><input type="file" id="lpFile"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="box">
                                <a class="box-header bg-gray" data-toggle="collapse" href="#suratjalan" role="button" aria-expanded="false" aria-controls="uploadfbp">
                                  Surat Jalan 7 Hari Terakhir
                                </a>
                                <div class="collapse" id="suratjalan">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label class="col-sm-2" for="suratjalanFile">File input</label>
                                            <div class="col-sm-7"><input type="file" id="suratjalanFile"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="box">
                                <a class="box-header bg-gray" data-toggle="collapse" href="#invoicepengeluaran" role="button" aria-expanded="false" aria-controls="uploadfbp">
                                  Invoice Pengeluaran Barang
                                </a>
                                <div class="collapse" id="invoicepengeluaran">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label class="col-sm-2" for="invoicepengeluaranFile">File input</label>
                                            <div class="col-sm-7"><input type="file" id="invoicepengeluaranFile"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="box">
                                <a class="box-header bg-gray" data-toggle="collapse" href="#rekappengeluaran" role="button" aria-expanded="false" aria-controls="uploadfbp">
                                  Rekap pengeluaran barang
                                </a>
                                <div class="collapse" id="rekappengeluaran">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label class="col-sm-2" for="rekappengeluaranFile">File input</label>
                                            <div class="col-sm-7"><input type="file" id="rekappengeluaranFile"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="box">
                                <a class="box-header bg-gray" data-toggle="collapse" href="#qcreport" role="button" aria-expanded="false" aria-controls="uploadfbp">
                                  QC Report
                                </a>
                                <div class="collapse" id="qcreport">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label class="col-sm-2" for="qcreportFile">File input</label>
                                            <div class="col-sm-7"><input type="file" id="qcreportFile"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="box">
                                <a class="box-header bg-gray" data-toggle="collapse" href="#suratpengajuanklaim" role="button" aria-expanded="false" aria-controls="uploadfbp">
                                  Surat Pengajuan Klaim
                                </a>
                                <div class="collapse" id="suratpengajuanklaim">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label class="col-sm-2" for="suratpengajuanklaimFile">File input</label>
                                            <div class="col-sm-7"><input type="file" id="suratpengajuanklaimFile"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <% } %>

                          <div class="box">
                              <a class="box-header bg-gray" data-toggle="collapse" href="#uploadtreasury" role="button" aria-expanded="false" aria-controls="uploadtreasury">
                                  FBP Upload
                              </a>
                              <div class="collapse" id="uploadtreasury">
                                <div class="box-body">
                                    <div class="form-group">
                                     <label class="col-sm-2" for="InputFile">File input</label>
                                     <div class="col-sm-7"><input type="file" id="InputFile"></div>
                                    </div>
                                    <div class="form-group">
                                    <label class="col-sm-2">File input</label>
                                    <div class="col-sm-7"><button type="submit" class="btn btn-primary">Submit</button></div>
                                    </div>
                                </div>
                              </div>
                          </div>

                        </div>
                    </div>
               </li>
           <% } %>
           </ul>--%>
<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Detail.aspx.cs" Inherits="WebApplication1.Detail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <section class="content-header">
      <h1>
        Detail
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home </a></li>
        <li class="active">Detail</li>
      </ol>
   </section>

   <section class="content">
       
       <div class="col-md-7">
           <ul class="timeline">
            <!-- timeline item -->
            <li>
              <i class="fa fa-clock-o bg-gray"></i>

              <div class="timeline-item">
                <span class="time">
                    <a class="btn btn-danger btn-xs">Deadline: 21 Nov 2019</a>
                    <a class="btn btn-primary btn-xs">DISC</a>
                </span>

                <h3 class="timeline-header">Waiting for Document</h3>

                <div class="timeline-body with-border">
                  <div class="box">
                  <a class="box-header bg-gray" data-toggle="collapse" href="#uploadfbp" role="button" aria-expanded="false" aria-controls="uploadfbp">
                      FBP Upload
                  </a>
                  <div class="collapse" id="uploadfbp">
                    <div class="box-body">
                        <div class="form-group">
                         <label class="col-sm-2" for="exampleInputFile">File input</label>
                         <div class="col-sm-7"><input type="file" id="exampleInputFile"></div>
                        </div>
                    </div>
                  </div>
                  </div>

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

                <div class="timeline-footer bg-gray">
                  <p>uploaded</p>
                </div>
              </div>
            </li>
            <!-- END timeline item -->
            <!-- timeline item -->
            <li>
              <i class="fa fa-user bg-aqua"></i>

              <div class="timeline-item">
                <span class="time"><i class="fa fa-clock-o"></i> 5 mins ago</span>

                <h3 class="timeline-header no-border"><a href="#">Sarah Young</a> accepted your friend request</h3>
              </div>
            </li>
            <!-- END timeline item -->
            <!-- timeline item -->
            <li>
              <i class="fa fa-check bg-green"></i>

              <div class="timeline-item">
                <span class="time"><i class="fa fa-clock-o"></i> 27 mins ago</span>

                <h3 class="timeline-header"><a href="#">Jay White</a> commented on your post</h3>

                <div class="timeline-body">
                  Take me to your leader!
                  Switzerland is small and neutral!
                  We are more like Germany, ambitious and misunderstood!
                </div>
                <div class="timeline-footer">
                  <a class="btn btn-warning btn-flat btn-xs">View comment</a>
                </div>
              </div>
            </li>
            <!-- END timeline item -->
            
          </ul>
       </div>

       <div class="col-md-5">
         <div class="box box-info">
            <div class="box-header with-border">
              <h1 class="box-title">Raise Klaim</h1>
            </div>
            <!-- form start -->
            <form class="form-horizontal">
              <div class="box-body">

                <!-- Form isi Raise Klaim -->
                <div class="form-group">
                  <label class="col-sm-4 control-label">Nama Distributor</label>
                  <p class="col-sm-6 form-control-static">PT Djarum</p>
                </div>
                <div class="form-group">
                  <label class="col-sm-4 control-label">Kode Distributor</label>
                  <p class="col-sm-6 form-control-static">PT Djarum</p>
                </div>
                <div class="form-group">
                  <label class="col-sm-4 control-label">Insiden Klaim</label>
                  <p class="col-sm-6 form-control-static">Gempa bumi</p>
                </div>
                <div class="form-group">
                  <label class="col-sm-4 control-label">Tanggal Kejadian</label>
                  <p class="col-sm-6 form-control-static">25/11/2019</p>
                </div>
                <div class="form-group">
                  <label class="col-sm-4 control-label">Area</label>
                  <p class="col-sm-6 form-control-static">East Java</p>
                </div>
                <div class="form-group">
                  <label class="col-sm-4 control-label">CF to be Notified</label>
                  <p class="col-sm-6 form-control-static">Joe@mail.com</p>
                </div>
              </div>

            </form>
         </div>
        </div>
   </section>

</asp:Content>

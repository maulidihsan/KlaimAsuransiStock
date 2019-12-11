<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RaiseClaim.aspx.cs" Inherits="WebApplication1.RaiseClaim" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <section class="content-header">
      
      <!-- Breadcrumb -->
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Raise Klaim</li>
      </ol>

      <a href="Default.aspx"><i class="fa fa-arrow-left"></i> Back</a>

    </section>

    <section class="content">
        <div class="col-md-8">
         <div class="box box-info">
            <div class="box-header with-border">
              <h1 class="box-title">Raise Klaim</h1>
            </div>
            <!-- form start -->
            <form class="form-horizontal">
              <div class="box-body">

                <!-- Form isi Raise Klaim -->
                <div class="form-group">
                  <label class="col-sm-3 control-label">Nama Distributor</label>
                  <div class="col-sm-7"><input class="form-control" id="namadistributor"></div>
                </div>
                <div class="form-group">
                  <label class="col-sm-3 control-label">Kode Distributor</label>
                  <div class="col-sm-7"><input class="form-control" id="kodedistributor"></div>
                </div>
                <div class="form-group">
                  <label class="col-sm-3 control-label">Insiden Klaim</label>
                  <div class="col-sm-7"><input class="form-control" id="insidenklaim" placeholder="ie. Gempa bumi"></div>
                </div>
                <div class="form-group">
                  <label class="col-sm-3 control-label">Tanggal Kejadian</label>
                  <div class="col-sm-7"><input class="form-control" id="tanggalkejadian" placeholder="dd/mm/yyyy"></div>
                </div>
                <div class="form-group">
                  <label class="col-sm-3 control-label">Area</label>
                  <div class="col-sm-7">
                  <select class="form-control">
                    <option>option 1</option>
                    <option>option 2</option>
                    <option>option 3</option>
                    <option>option 4</option>
                    <option>option 5</option>
                  </select>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-3 control-label">CF to be Notified</label>
                  <div class="col-sm-7"><input class="form-control" id="cf" disabled></div>
                </div>
              </div>

              <!-- button submit -->
              <div class="box-footer">
                <button type="submit" class="btn btn-primary pull-right">Submit</button>
              </div>

            </form>
         </div>
        </div>
    </section>
    
</asp:Content>

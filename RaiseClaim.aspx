<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RaiseClaim.aspx.cs" Inherits="WebApplication1.RaiseClaim" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <section class="content-header">
      
      <!-- Breadcrumb -->
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Raise Klaim</li>
      </ol>
      <!-- Link Back to Dashboard -->
      <a href="Default.aspx"><i class="fa fa-arrow-left"></i> Back</a>
    </section>

    <section class="content" runat="server">   
        <div class="row">
            <div class="col-md-7">
                <div class="box box-info">

                    <div class="box-header">
                      <h1 class="box-title">Raise Klaim</h1>
                    </div>

                    <!-- form start -->
                    <div class="box-body">
                        <!-- Form isi Raise Klaim -->
                        <div class="row" style="margin-bottom:10px">
                          <label class="col-sm-3 control-label">Nama Distributor</label>
                          <div class="col-sm-7"><asp:TextBox id="tbNama" CssClass="form-control" runat="server" /></div>
                        </div>
                        <div class="row" style="margin-bottom:3px">
                            <div class="col-md-3"></div>
                            <div class="col-md-7"><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbNama" ErrorMessage="Name cannot be blank" ForeColor="Red"/></div>                            
                        </div>
                        <div class="row" style="margin-bottom:10px">
                          <label class="col-sm-3 control-label">Kode Distributor</label>
                          <div class="col-sm-7"><asp:TextBox id="tbKode" CssClass="form-control" runat="server" /></div>
                        </div>
                        <div class="row" style="margin-bottom:3px">
                            <div class="col-md-3"></div>
                            <div class="col-md-7"><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="tbKode" ErrorMessage="Kode Distributor cannot be blank" ForeColor="Red"/></div>                            
                        </div>
                        <div class="row" style="margin-bottom:10px">
                          <label class="col-sm-3 control-label">Insiden Klaim</label>
                          <div class="col-sm-7"><asp:TextBox id="tbInsiden" CssClass="form-control" runat="server" /></div>
                        </div>
                        <div class="row" style="margin-bottom:3px">
                            <div class="col-md-3"></div>
                            <div class="col-md-7"><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="tbInsiden" ErrorMessage="Insiden Klaim cannot be blank" ForeColor="Red"/></div>                            
                        </div>
                        <div class="row" style="margin-bottom:10px">
                          <label class="col-sm-3 control-label">Tanggal Kejadian</label>
                          <div class="col-sm-7"><asp:TextBox id="tbTanggal" CssClass="form-control" textmode="date" runat="server" /></div>
                        </div>
                        <div class="row" style="margin-bottom:3px">
                            <div class="col-md-3"></div>
                            <div class="col-md-7"><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="tbTanggal" ErrorMessage="Tanggal Kejadian cannot be blank" ForeColor="Red"/></div>                            
                        </div>
                        <div class="row" style="margin-bottom:10px">
                        <label class="col-sm-3 control-label">Area</label>
                            <div class="col-sm-7">
                                <asp:DropDownList ID="CFDropdown" CssClass="form-control select2" AutoPostBack="True" onselectedindexchanged="cfSelected" runat="server">
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="row" style="margin-bottom:3px">
                            <div class="col-md-3"></div>
                            <div class="col-md-7"></div>                            
                        </div>
                        <div class="row" style="margin-bottom:10px">
                          <label class="col-sm-3 control-label">CF to be Notified</label>
                          <div class="col-sm-7">
                              <asp:TextBox id="tbCF" CssClass="form-control" Enabled="false" runat="server" />
                          </div>
                        </div>
                        <div class="row" style="margin-bottom:3px">
                            <div class="col-md-3"></div>
                            <div class="col-md-7"></div>                            
                        </div>
                      </div>

                    <div class="box-footer">
                        <div class="row">
                            <!-- button submit raise claim -->              
                            <div class="col-sm-3"></div>
                            <div class="col-sm-7">
                                <asp:Button ID="Submit" OnClick="Submit_Click" CssClass="btn btn-primary" Text="Submit" runat="server" />
                            </div>           
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </section>
    
</asp:Content>

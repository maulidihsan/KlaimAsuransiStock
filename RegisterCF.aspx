<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RegisterCF.aspx.cs" Inherits="WebApplication1.RegisterCF" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <section class="content-header" runat="server">
      <!-- Breadcrumb -->
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Register CF </a></li>
      </ol>      
   </section>

   <section class="content" runat="server">
       <h2>Customer Facing</h2>
       <div class="row">
            <div class="col-md-5">
                <div class="box box-info">
                    <div class="box-header with-border">
                        <h1 class="box-title">Register a new CF</h1>
                    </div>
                    <div class="box-body">      
                        <p><asp:Literal runat="server" ID="StatusMessage" /></p>   
                        <div class="row" style="margin-bottom:10px">
                            <div class="col-md-4"><asp:Label runat="server" AssociatedControlID="">Lokasi</asp:Label></div>
                            <div class="col-md-7"><asp:TextBox runat="server" CssClass="form-control" ID="lokasiCF" /></div>
                        </div>
                        <div class="row" style="margin-bottom:10px">
                            <div class="col-md-4"><asp:Label runat="server" AssociatedControlID="">Nama</asp:Label></div>
                            <div class="col-md-7"><asp:TextBox runat="server" CssClass="form-control" ID="Name" /></div>
                        </div>
                        <div class="row" style="margin-bottom:10px">
                            <div class="col-md-4"><asp:Label runat="server" AssociatedControlID="">Email</asp:Label></div>
                            <div class="col-md-7"><asp:TextBox runat="server" CssClass="form-control" ID="Email" /></div>
                        </div>
                        <div class="row" style="margin-bottom:10px">
                            <div class="col-md-4"></div>
                            <div class="col-md-7"><asp:Button runat="server" CssClass="btn btn-info" Text="Register" /></div>
                        </div>
                    </div>
                </div>
            </div>
           <div class="col-md-7">
               <div class="box box-info">
                   <div class="box-header with-border">
                        <h1 class="box-title">List CF</h1>
                    </div>
                    <div class="box-body">
                        <div class="table-responsive">
                            <table class="table no-margin">
                                <thead>
                                    <tr>
                                      <th>Lokasi</th>
                                      <th>Nama</th>
                                      <th>Email</th>
                                      <th></th>                                      
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                      <td>Jawa</td>
                                      <td>Lia</td>
                                      <td>lia@email.com</td>
                                      <td><asp:Button runat="server" CssClass="btn btn-danger" Text="Delete" /></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
               </div>
           </div>
       </div>
    </section>
</asp:Content>





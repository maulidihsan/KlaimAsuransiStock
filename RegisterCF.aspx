<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="WebApplication1.Register" %>
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
            <div class="col-md-4">
                <div class="box box-info">
                    <div class="box-header with-border">
                        <h1 class="box-title">Register a new CF</h1>
                    </div>
                    <div class="box-body">
                        <p><asp:Literal runat="server" ID="StatusMessage" /></p>                
                        <div class="row" style="margin-bottom:10px">
                            <div class="col-md-5"><asp:Label runat="server" AssociatedControlID="Name">Nama</asp:Label></div>
                            <div class="col-md-6"><asp:TextBox runat="server" CssClass="form-control" ID="Name" /></div>
                        </div>
                        <div class="row" style="margin-bottom:10px">
                            <div class="col-md-5"><asp:Label runat="server" AssociatedControlID="Email">Email</asp:Label></div>
                            <div class="col-md-6"><asp:TextBox runat="server" CssClass="form-control" TextMode="Email" ID="Email" /></div>
                        </div>
                        <div class="row" style="margin-bottom:10px">
                            <div class="col-md-5"><asp:Label runat="server" AssociatedControlID="Password">Password</asp:Label></div>
                            <div class="col-md-6"><asp:TextBox runat="server" CssClass="form-control" ID="Password" TextMode="Password" /></div>
                        </div>
                        <div class="row" style="margin-bottom:10px">
                            <div class="col-md-5"><asp:Label runat="server" AssociatedControlID="ConfirmPassword">Confirm password</asp:Label></div>
                            <div class="col-md-6"><asp:TextBox runat="server" CssClass="form-control" ID="ConfirmPassword" TextMode="Password" /></div>
                        </div>
                        <div class="row" style="margin-bottom:10px">
                            <div class="col-md-5"><asp:Label runat="server" AssociatedControlID="RoleDropdown">Role</asp:Label></div>
                            <div class="col-md-6"><asp:DropDownList ID="RoleDropdown" CssClass="form-control select2" AutoPostBack="True" runat="server">
                            </asp:DropDownList></div>
                        </div>
                        <div class="row" style="margin-bottom:10px">
                            <div class="col-md-5"></div>
                            <div class="col-md-6"><asp:Button runat="server" CssClass="btn btn-info" OnClick="CreateUser_Click" Text="Register" /></div>
                        </div>
                    </div>
                </div>
            </div>
           <div class="col-md-8">
               <div class="box box-info">
                   <div class="box-header with-border">
                        <h1 class="box-title">List CF</h1>
                    </div>
                    <div class="box-body">

                    </div>
               </div>
           </div>
       </div>
    </section>
</asp:Content>





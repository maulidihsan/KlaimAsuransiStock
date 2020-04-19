<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="WebApplication1.Register" %>
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
               <div class="col-md-12">
                   <h4 style="font-size: medium">Register a new user</h4>
                   <hr />
                   <p>
                       <asp:Literal runat="server" ID="StatusMessage" />
                   </p>                
                   <div style="margin-bottom:10px">
                       <asp:Label runat="server" AssociatedControlID="Name">Nama</asp:Label>
                       <div>
                           <asp:TextBox runat="server" ID="Name" />                
                       </div>
                   </div>
                   <div style="margin-bottom:10px">
                       <asp:Label runat="server" AssociatedControlID="Email">Email</asp:Label>
                       <div>
                           <asp:TextBox runat="server" TextMode="Email" ID="Email" />                
                       </div>
                   </div>
                   <div style="margin-bottom:10px">
                       <asp:Label runat="server" AssociatedControlID="Password">Password</asp:Label>
                       <div>
                           <asp:TextBox runat="server" ID="Password" TextMode="Password" />                
                       </div>
                   </div>
                   <div style="margin-bottom:10px">
                       <asp:Label runat="server" AssociatedControlID="ConfirmPassword">Confirm password</asp:Label>
                       <div>
                           <asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password" />                
                       </div>
                   </div>
                   <div style="margin-bottom:10px">
                       <asp:Label runat="server" AssociatedControlID="RoleDropdown">Role</asp:Label>
                       <asp:DropDownList ID="RoleDropdown" CssClass="form-control select2" AutoPostBack="True" runat="server">
                       </asp:DropDownList>
                   </div>
                   <div>
                       <div>
                           <asp:Button runat="server" OnClick="CreateUser_Click" Text="Register" />
                       </div>
                   </div>
               </div>
       </div>
   </section>
</asp:Content>
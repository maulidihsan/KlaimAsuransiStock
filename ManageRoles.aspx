<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManageRoles.aspx.cs" Inherits="WebApplication1.ManageRoles" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <section class="content-header">
      <!-- Breadcrumb -->
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home </a></li>
        <li class="active">Manage Roles</li>
      </ol>
      <!-- Button Back -->
      <a href="/Default.aspx"><i class="fa fa-arrow-left"></i> Back</a>
   </section>

   <section class="content" runat="server">
       <div class="row">
           <form runat="server">
               <div class="col-md-12">
                   <h4 style="font-size: medium">Create new roles</h4>
                   <hr />
                   <p>
                       <asp:Literal runat="server" ID="StatusMessage" />
                   </p>                
                   <div style="margin-bottom:10px">
                       <asp:Label runat="server" AssociatedControlID="RoleName">Nama Role</asp:Label>
                       <div>
                           <asp:TextBox runat="server" ID="RoleName" />                
                       </div>
                   </div>
                   <div>
                       <div>
                           <asp:Button runat="server" OnClick="CreateRole_Click" Text="Tambahkan Role" />
                       </div>
                   </div>
               </div>
           </form>
       </div>
   </section>
</asp:Content>
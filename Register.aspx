<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="WebApplication1.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <section class="content-header">
      <!-- Breadcrumb -->
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Register </a></li>
      </ol>      
   </section>

   <section class="content" runat="server">
       <div class="row">
            <div class="col-md-8">
                <div class="box box-info">
                    <div class="box-header with-border">
                        <h1 class="box-title">Register a new user</h1>
                    </div>
                    <div class="box-body">
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
            </div>
       </div>
   </section>
</asp:Content>





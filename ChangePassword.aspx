<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="WebApplication1.ChangePassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <section class="content-header">
      
      <!-- Breadcrumb -->
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Change Password</li>
      </ol>
      <!-- Link Back to Dashboard -->
      <a href="Default.aspx"><i class="fa fa-arrow-left"></i> Back</a>
    </section>

    <section class="content" runat="server">   
        <div class="row">
            <div class="col-md-7">
                <div class="box box-info">

                    <div class="box-header">
                      <h1 class="box-title">Change Password</h1>
                    </div>

                    <!-- form start -->
                    <div class="box-body">
                         <p><asp:Literal runat="server" ID="StatusMessage" /></p>   
                        <!-- Form isi Raise Klaim -->
                        <div class="row" style="margin-bottom:10px">
                            <div class="col-md-3"><asp:Label runat="server" AssociatedControlID="CurrentPassword">Current Password</asp:Label></div>
                            <div class="col-md-7"><asp:TextBox runat="server" CssClass="form-control" ID="CurrentPassword" TextMode="Password" /></div>
                        </div>
                        <div class="row" style="margin-bottom:3px">
                            <div class="col-md-3"></div>
                            <div class="col-md-7"><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="CurrentPassword" ErrorMessage="cannot be blank" ForeColor="Red"/></div>                            
                        </div>
                        <div class="row" style="margin-bottom:10px">
                            <div class="col-md-3"><asp:Label runat="server" AssociatedControlID="Password">Password</asp:Label></div>
                            <div class="col-md-7"><asp:TextBox runat="server" CssClass="form-control" ID="Password" TextMode="Password" /></div>
                        </div>
                        <div class="row" style="margin-bottom:3px">
                            <div class="col-md-3"></div>
                            <div class="col-md-7"><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Password" ErrorMessage="cannot be blank" ForeColor="Red"/></div>                            
                        </div>
                        <div class="row" style="margin-bottom:10px">
                            <div class="col-md-3"><asp:Label runat="server" AssociatedControlID="ConfirmPassword">Confirm password</asp:Label></div>
                            <div class="col-md-7"><asp:TextBox runat="server" CssClass="form-control" ID="ConfirmPassword" TextMode="Password" /></div>                            
                        </div>
                        <div class="row" style="margin-bottom:3px">
                            <div class="col-md-3"></div>
                            <div class="col-md-7">
                                <asp:CompareValidator ID="cvPassword" runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword" ErrorMessage="Password and confirm password must be same" ForeColor="Red" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ConfirmPassword" ErrorMessage="Confirm Password cannot be blank" ForeColor="Red"/>
                            </div>     
                        </div>
                         <div class="row" style="margin-bottom:10px">
                            <div class="col-md-3"></div>
                            <div class="col-md-7"><asp:Button runat="server" CausesValidation="true" CssClass="btn btn-info" OnClick="ChangePassword_Click" Text="Change Password" /></div>                                
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
</asp:Content>

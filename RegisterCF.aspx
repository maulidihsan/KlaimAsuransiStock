<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RegisterCF.aspx.cs" Inherits="WebApplication1.RegisterCF" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <section class="content-header" runat="server">
      <!-- Breadcrumb -->
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Register </a></li>
        <li class="active">New CF</li>
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
                            <div class="col-md-7"><asp:TextBox runat="server" CssClass="form-control" ID="tbLokasiCF" /></div>
                        </div>
                        <div class="row" style="margin-bottom:3px">
                            <div class="col-md-4"></div>
                            <div class="col-md-7"><asp:RequiredFieldValidator ID="RequiredFieldValidatortbLokasiCF" runat="server" ControlToValidate="tbLokasiCF" ErrorMessage="Location cannot be blank" ForeColor="Red"/></div>                            
                        </div>
                        <div class="row" style="margin-bottom:10px">
                            <div class="col-md-4"><asp:Label runat="server" AssociatedControlID="">Nama</asp:Label></div>
                            <div class="col-md-7"><asp:TextBox runat="server" CssClass="form-control" ID="tbName" /></div>
                        </div>
                        <div class="row" style="margin-bottom:3px">
                            <div class="col-md-4"></div>
                            <div class="col-md-7"><asp:RequiredFieldValidator ID="RequiredFieldValidatortbName" runat="server" ControlToValidate="tbName" ErrorMessage="Name cannot be blank" ForeColor="Red"/></div>                            
                        </div>
                        <div class="row" style="margin-bottom:10px">
                            <div class="col-md-4"><asp:Label runat="server" AssociatedControlID="">Email</asp:Label></div>
                            <div class="col-md-7"><asp:TextBox runat="server" CssClass="form-control" ID="tbEmail" /></div>
                        </div>
                        <div class="row" style="margin-bottom:3px">
                            <div class="col-md-4"></div>
                            <div class="col-md-7"><asp:RequiredFieldValidator ID="RequiredFieldValidatortbEmail" runat="server" ControlToValidate="tbEmail" ErrorMessage="Email cannot be blank" ForeColor="Red"/></div>                            
                        </div>
                        <div class="row" style="margin-bottom:10px">
                            <div class="col-md-4"></div>
                            <div class="col-md-7"><asp:Button runat="server" CausesValidation="true" CssClass="btn btn-info" Text="Register" OnClick="CreateCF_Click" /></div>
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
                            <asp:ListView ID="CFListView" ItemPlaceholderID="itemPlaceholder" ItemType="WebApplication1.Model.CustomerFacing" runat="server">
                                <EmptyDataTemplate>
                                    <table>
                                        <tr>
                                            <td>No data was returned.</td>
                                        </tr>
                                    </table>
                                </EmptyDataTemplate>
                                <LayoutTemplate>
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
                                            <tr runat="server" id="itemPlaceholder" />
                                        </tbody>
                                    </table>
                                </LayoutTemplate>
                                <ItemTemplate>
                                  <tr>
                                    <td><asp:Label ID="Label1" runat="server" Text='<%# Eval("CFArea")%>' /></td>
                                    <td><asp:Label ID="Label2" runat="server" Text='<%# Eval("CFName")%>' /></td>
                                    <td><asp:Label ID="Label3" runat="server" Text='<%# Eval("CFEmail")%>' /></td>
                                    <td><asp:Button ID="btnDelete" runat="server" CausesValidation="false" CssClass="btn btn-danger" Text="Delete" CommandArgument='<%# Eval("Id")%>' OnClick="DeleteCF_Click" /></td>
                                  </tr>
                                </ItemTemplate>
                          </asp:ListView>
                        </div>
                    </div>
               </div>
           </div>
       </div>
    </section>
</asp:Content>





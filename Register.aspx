<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="WebApplication1.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <section class="content-header">
      <!-- Breadcrumb -->
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Register </a></li>
        <li class="active">New User</li>
      </ol>      
   </section>

   <section class="content" runat="server">
       <div class="row">
           <h2></h2>
            <div class="col-md-6">
                <div class="box box-info">
                    <div class="box-header with-border">
                        <h1 class="box-title">Register a new user</h1>
                    </div>
                    <div class="box-body">
                        <p><asp:Literal runat="server" ID="StatusMessage" /></p>                
                        <div class="row" style="margin-bottom:10px">
                            <div class="col-md-3"><asp:Label runat="server" AssociatedControlID="Name">Name</asp:Label></div>
                            <div class="col-md-7"><asp:TextBox runat="server" CssClass="form-control" ID="Name" /></div>                            
                        </div>
                        <div class="row" style="margin-bottom:3px">
                            <div class="col-md-3"></div>
                            <div class="col-md-7"><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Name" ErrorMessage="Name cannot be blank" ForeColor="Red"/></div>                            
                        </div>
                        <div class="row" style="margin-bottom:10px">
                            <div class="col-md-3"><asp:Label runat="server" AssociatedControlID="Email">Email</asp:Label></div>
                            <div class="col-md-7"><asp:TextBox runat="server" CssClass="form-control" TextMode="Email" ID="Email" /></div>
                        </div>
                        <div class="row" style="margin-bottom:3px">
                            <div class="col-md-3"></div>
                            <div class="col-md-7"><asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="Email" ErrorMessage="Enter proper email format" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" /></div>                            
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
                            <div class="col-md-3"><asp:Label runat="server" AssociatedControlID="RoleDropdown">Role</asp:Label></div>
                            <div class="col-md-7"><asp:DropDownList ID="RoleDropdown" CssClass="form-control select2" AutoPostBack="True" runat="server"></asp:DropDownList></div>
                        </div>
                        <div class="row" style="margin-bottom:3px">
                            <div class="col-md-3"></div>
                            <div class="col-md-7"></div>                            
                        </div>
                        <div class="row" style="margin-bottom:10px">
                            <div class="col-md-3"></div>
                            <div class="col-md-7"><asp:Button runat="server" CssClass="btn btn-info" OnClick="CreateUser_Click" Text="Register" /></div>                                
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-md-6">
                <div class="box box-info">
                   <div class="box-header with-border">
                        <h1 class="box-title">List User</h1>
                    </div>
                    <div class="box-body">
                        <div class="table-responsive">
                            <asp:ListView ID="UserListView" ItemPlaceholderID="itemPlaceholder" ItemType="WebApplication1.Model.Profile" runat="server">
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
                                              <th>Nama</th>
                                              <th>Email</th>
                                              <th>Role</th>
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
                                    <td><asp:Label ID="Label1" runat="server" Text='<%# Eval("Name")%>' /></td>
                                    <td><asp:Label ID="Label2" runat="server" Text='<%# Eval("Email")%>' /></td>
                                    <td><%# string.Join( " ", ((List<string>)Eval("Roles")).ToArray() ) %></td>
                                    <td><asp:Button ID="btnDelete" runat="server" CssClass="btn btn-danger" Text="Delete" CommandArgument='<%# Eval("Email")%>' OnClick="DeleteUser_Click" /></td>
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





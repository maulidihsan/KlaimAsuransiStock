<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication1._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
   
    <section class="content-header">
      <h1>
        Stock at Distribution
      </h1>
      <!-- Breadcrumb -->
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Dashboard</li>
      </ol>
      <!-- Button Raise Claim -->
      <a href="RaiseClaim.aspx" class="btn btn-primary">Raise Klaim</a>
    </section>

   <section class="content">
       <div class="box">
            <div class="box-header">
              <h3 class="box-title">Dashboard</h3>
            </div>
            <!-- tabel dasboard -->
            <div class="box-body">
                <asp:ListView ID="ClaimListView" ItemPlaceholderID="itemPlaceholder" ItemType="WebApplication1.Model.Claim" runat="server">
                    <EmptyDataTemplate>
                        <table>
                            <tr>
                                <td>No data was returned.</td>
                            </tr>
                        </table>
                    </EmptyDataTemplate>
                    <LayoutTemplate>
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                  <th style="text-align:center">No.</th>
                                  <th scope="col">Insiden Klaim</th>
                                  <th scope="col">Distributor</th>
                                  <th scope="col">Tanggal Pelaporan</th>
                                  <th scope="col">Status</th>
                                </tr>
                            </thead>
                            <tr runat="server" id="itemPlaceholder" />
                        </table>
                    </LayoutTemplate>
                    <ItemTemplate>
                      <tr data-toggle="collapse" data-target="#accordion<%# Container.DisplayIndex %>" class="clickable">
                        <td style="width:10%; text-align:center" scope="row"><%#Container.DisplayIndex + listClaim.ActualPage * listClaim.ItemsPerPage + 1 %></td>
                        <td width="20%">
                          <asp:Label ID="lblInsidenKlaim" runat="server" Text='<%# Eval("Cause")%>' />
                        </td>
                        <td width="10%">
                          <asp:Label ID="lblDistributor" runat="server" Text='<%# Eval("Distributor")%>' />
                        </td>
                        <td>
                          <asp:Label ID="lblTanggal" runat="server" Text='<%# Eval("CreatedAt")%>' /></td>
                        <td>
                          <div class="small-box bg-green col-md-7">     
                              <div class="inner">
                                <div class="row">
                                    <div class="col-md-4"><div class="small-box bg-yellow"><p>DISP</p></div> </div>                                
                                    <div class="col-md-8"><p class="pull-right">5 days left</p></div>     
                                </div>                                
                                <div class="row">
                                    <div class="col-md-9"><h4>Disposal Process</h4></div>
                                    <div class="col-md-3"><i class="fa fa-check-circle bg-green fa-2x"></i></div>
                                </div>           
                              </div>
                          </div>
                        </td>
                      </tr>

                      <tr class="collapse" id="accordion<%# Container.DisplayIndex %>">
                          <td></td>
                          <td><a href="Detail/id/<%# Eval("Id") %>" class="btn btn-primary">Detail</a></td>
                          <td></td>
                          <td>
                              Nama PIC : <asp:Label ID="ExpandPIC" runat="server" Text='<%# Eval("PICName")%>' />
                              <br/> <br/>
                              Tanggal Kejadian :<asp:Label ID="Label1" runat="server" Text='<%# Eval("Date")%>' />
                          </td>
                          <td>
                              <div class="box box-solid box-danger" style="width:50%">
                                  <div class="box-header">
                                      Deadline
                                  </div>
                                  <div class="box-body">
                                      21 September 2019
                                  </div>
                              </div>
                          </td>
                      </tr>
                    </ItemTemplate>
              </asp:ListView>
     
            </div>
            <div class="box-footer clearfix">
              <span>
                 Page <%: (listClaim.ActualPage + 1)%> of <%: listClaim.TotalPages%>
              </span>
              <ul class="pagination pagination-sm no-margin pull-right">
                <li>
                    <asp:HyperLink ID="PaginationPrevious" runat="server">
                        &laquo;
                    </asp:HyperLink>
                </li>
                <li>
                    <asp:HyperLink ID="PaginationNext" runat="server">
                        &raquo;
                    </asp:HyperLink>
                </li>
              </ul>
            </div>
        </div>
    </section>

</asp:Content>

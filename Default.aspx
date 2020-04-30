﻿<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication1._Default" %>

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
      <a href="/RaiseClaim.aspx" class="btn btn-primary">Raise Klaim</a>
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
                                  <th align="center">No.</th>
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
                        <td width="10%" align="center" scope="row"><%#Container.DisplayIndex + listClaim.ActualPage * listClaim.ItemsPerPage + 1 %></td>
                        <td width="20%">
                          <asp:Label ID="lblInsidenKlaim" runat="server" Text='<%# Eval("Cause")%>' />
                        </td>
                        <td width="10%">
                          <asp:Label ID="lblDistributor" runat="server" Text='<%# Eval("Distributor")%>' />
                        </td>
                        <td>
                          <asp:Label ID="lblTanggal" runat="server" Text='<%# Eval("CreatedAt")%>' /></td>
                        <td>
                          <div class="info-box bg-green" style="width: 60%">
                            <div class="info-box-body">
                                    <span class="small-box bg-yellow col-md-2"><%# Eval("LatestStatus.StatusCode") %></span>
                                    <asp:PlaceHolder runat="server" Visible='<%# (Convert.ToDateTime(Eval("LatestStatus.ValidUntil")) - DateTime.Now.Date).Days > 0 %>'>
                                        <span class="col-md-3 pull-right"><%# (Convert.ToDateTime(Eval("LatestStatus.ValidUntil")) - DateTime.Now.Date).Days.ToString() %> days left</span>
                                    </asp:PlaceHolder>
                                    <asp:PlaceHolder runat="server" Visible='<%# (Convert.ToDateTime(Eval("LatestStatus.ValidUntil")) - DateTime.Now.Date).Days < 0 %>'>
                                        <span class="col-md-3 pull-right">Melewati deadline</span>
                                    </asp:PlaceHolder>
                                    <div class="progress">
                                        <div runat="server" visible="false">
                                            <div class="progress-bar" style='<%# "width:" + ((Convert.ToDateTime(Eval("LatestStatus.ValidFrom")) - DateTime.Now.Date).Days / (Convert.ToDateTime(Eval("LatestStatus.ValidUntil")) - Convert.ToDateTime(Eval("LatestStatus.ValidFrom"))).Days * 100) + "%"  %>'></div>
                                        </div>
                                    </div>
                            </div>
                          </div>
                        </td>
                      </tr>

                      <tr class="collapse" id="accordion<%# Container.DisplayIndex %>">
                          <td align="center"><a href="/Detail/id/<%# Eval("Id") %>" class="btn btn-primary">Detail</a></td>
                          <td>
                              Nama PIC: <asp:Label ID="ExpandPIC" runat="server" Text='<%# Eval("PICName")%>' />
                              <br/> <br/>
                              Tanggal Kejadian: <asp:Label ID="Label1" runat="server" Text='<%# Eval("Date", "{0:dd MMMM yyyy}")%>' />
                          </td>
                          <td></td>
                          <td></td>
                          <td>
                              <div class="box box-solid box-danger" width="50%">
                                  <div class="box-header">
                                      Deadline
                                  </div>
                                  <div class="box-body">
                                      <%# Eval("LatestStatus.ValidUntil", "{0:dd MMMM yyyy}") %>
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

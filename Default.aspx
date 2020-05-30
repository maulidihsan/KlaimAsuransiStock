<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication1._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <section class="content-header">
        <!-- Breadcrumb -->
        <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
            <li class="active">Dashboard</li>
        </ol>
        <h1>Stock at Distribution
        </h1>
        <h2></h2>
        <!-- Button Raise Claim -->
        <asp:PlaceHolder ID="BtnRaise" Visible="false" runat="server">
            <a href="/RaiseClaim.aspx" class="btn btn-primary">Raise Klaim</a>
        </asp:PlaceHolder>
    </section>

    <section class="content">
        <div class="box">
            <!-- tabel dasboard -->
            <div class="box-body">
                <asp:ListView ID="ClaimListView" ItemPlaceholderID="itemPlaceholder" OnItemDataBound="ClaimListView_ItemDataBound" ItemType="WebApplication1.Model.Claim"  runat="server">
                    <EmptyDataTemplate>
                        <table>
                            <tr>
                                <td>No data was returned.</td>
                            </tr>
                        </table>
                    </EmptyDataTemplate>
                    <LayoutTemplate>
                        <table class="table table-hover">
                            <!-- judul kolom pada dashboard -->
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
                                <div class="small-box bg-green" style="width: 60%">
                                    <div class="inner">
                                        <div class="row">
                                            <!-- kode status -->
                                            <div class="col-md-5">
                                                <span class="small-box bg-yellow col-md-8"><%# Eval("LatestStatus.StatusCode") %></span>
                                            </div>
                                            <!-- sisa waktu -->
                                            <div class="col-md-7">
                                                <asp:PlaceHolder runat="server" Visible='<%# (Convert.ToDateTime(Eval("LatestStatus.ValidUntil")) - DateTime.Now.Date).Days > 0 %>'>
                                                    <span class="pull-right"><%# (Convert.ToDateTime(Eval("LatestStatus.ValidUntil")) - DateTime.Now.Date).Days.ToString() %> days left</span>
                                                </asp:PlaceHolder>
                                                <asp:PlaceHolder runat="server" Visible='<%# (Convert.ToDateTime(Eval("LatestStatus.ValidUntil")) - DateTime.Now.Date).Days < 0 %>'>
                                                    <span class="pull-right">Melewati deadline</span>
                                                </asp:PlaceHolder>
                                            </div>
                                        </div>
                                        <!-- progress bar -->
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="progress" runat="server">
                                                    <asp:PlaceHolder runat="server" Visible='<%# (Convert.ToDateTime(Eval("LatestStatus.ValidUntil")) - DateTime.Now.Date).Days < 0 %>'>
                                                        <div class="progress-bar progress-bar-red" style="width: 100%"></div> 
                                                    </asp:PlaceHolder>
                                                    <asp:PlaceHolder runat="server" Visible='<%# (Convert.ToDateTime(Eval("LatestStatus.ValidUntil")) - DateTime.Now.Date).Days > 0 %>'>
                                                        <div class="progress-bar progress-bar-yellow" style='<%# "width: " + ((double)(DateTime.Now.Date - Convert.ToDateTime(Eval("LatestStatus.ValidFrom"))).Days / (Convert.ToDateTime(Eval("LatestStatus.ValidUntil")) - Convert.ToDateTime(Eval("LatestStatus.ValidFrom"))).Days * 100) + "%;"  %>'></div>
                                                    </asp:PlaceHolder>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <h5></h5>
                                        </div>
                                        <!-- status yang harus dikerjakan -->
                                        <div class="row">
                                            <div class="col-md-12">
                                                <asp:Label ID="Labelstatus" runat="server" Text='<%# Eval("LatestStatus.Description")%>' /></div>
                                        </div>
                                    </div>

                                </div>
                            </td>
                        </tr>
                        <!-- baris expand -->
                        <tr class="collapse" id="accordion<%# Container.DisplayIndex %>" style="background-color:lightyellow">
                            <td style="center"><a href="/Detail/id/<%# Eval("Id") %>" class="btn btn-primary">Detail</a>
                                <br /><br /><asp:Button runat="server" CssClass="btn btn-danger" ID="BtnDelete" CommandArgument='<%# Eval("Id") %>' Text="Delete Klaim" OnClick="Delete_Click" /></td>
                            <td>Nama PIC:
                                <asp:Label ID="ExpandPIC" runat="server" Text='<%# Eval("CustomerFacing.CFName")%>' /><br /><br />
                                Tanggal Kejadian:
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("Date", "{0:dd MMMM yyyy}")%>' />
                            </td>
                            <td></td>
                            <td></td>
                            <td>
                                <div class="box box-solid box-danger" style="width: 60%">
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
            <!-- Next page table -->
            <div class="box-footer clearfix">
                <span>Page <%: (listClaim.ActualPage + 1)%> of <%: listClaim.TotalPages%>
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

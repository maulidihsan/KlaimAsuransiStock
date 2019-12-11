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
            <!-- /.box-header -->
            <div class="box-body">
              <table class="table table-hover">
                  <thead>
                    <tr>
                      <th scope="col">#</th>
                      <th scope="col">First</th>
                      <th scope="col">Last</th>
                      <th scope="col">Handle</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr data-toggle="collapse" data-target="#accordion1" class="clickable">
                      <th scope="row">1</th>
                      <td>Mark</td>
                      <td>Otto</td>
                      <td>@mdo</td>
                    </tr>
                    <tr class="collapse" id="accordion1">
                      <td>hi</td>
                      <td>hi</td>
                    </tr>
                    <tr data-toggle="collapse" data-target="#accordion2" class="clickable">
                      <th scope="row">2</th>
                      <td>Jacob</td>
                      <td>Thornton</td>
                      <td>@fat</td>
                    </tr>
                    <tr class="collapse" id="accordion2">
                      <td>hii</td>
                      <td>hii</td>
                    </tr>
                    <tr>
                      <th scope="row">3</th>
                      <td colspan="2">Larry the Bird</td>
                      <td>@twitter</td>
                    </tr>
                  </tbody>
                </table>
            </div>
        </div>
    </section>

</asp:Content>

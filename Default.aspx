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
      <a href="RaiseClaim.aspx" class="btn btn-primary">Raise Klaim</a>
    </section>

   <section class="content">
       <div class="box">
            <div class="box-header">
              <h3 class="box-title">Dashboard</h3>
            </div>
            <!-- tabel dasboard -->
            <div class="box-body">
              <table class="table table-hover">
                  <thead>
                    <tr>
                      <th scope="col">Insiden Klaim</th>
                      <th scope="col">Distributor</th>
                      <th scope="col">Tanggal Pelaporan</th>
                      <th scope="col">Status</th>
                    </tr>
                  </thead>
                  <tbody>
                    <!-- list isi tabel -->
                    <tr data-toggle="collapse" data-target="#accordion1" class="clickable">
                      <td>1</td>
                      <td>Mark</td>
                      <td>Otto</td>
                      <td>
                        <div class="info-box bg-green">
                            <div class="info-box-content">
                            <div class="row">
                                <p class="small-box bg-yellow col-md-2">DISP</p>
                                <p class="col-md-3 pull-right">5 days left</p>
                            </div>
                            <div class="row">
                                <div class="progress">
                                    <div class="progress-bar" style="width: 50%"></div>
                                </div>
                                <p class="progress-description">50% Increase in 30 Days</p>
                            </div>
                            </div>
                        </div>
                      </td>
                    </tr>
                    <tr class="collapse" id="accordion1">
                      <td><a href="Detail.aspx" class="btn btn-primary">Detail</a></td>
                      <td>hi</td>
                      <td></td>
                      <td><div class="box box-solid box-danger">cac</div></td>
                    </tr>

                    <tr data-toggle="collapse" data-target="#accordion2" class="clickable">
                      <th scope="row">2</th>
                      <td>Jacob</td>
                      <td>Thornton</td>
                      <td>@fat</td>
                    </tr>
                    <tr class="collapse" id="accordion2">
                      <td><a href="Detail.aspx" class="btn btn-primary">Detail</a></td>
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

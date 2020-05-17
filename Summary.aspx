<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Summary.aspx.cs" Inherits="WebApplication1.Summary" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" type="text/css" href="styles.css" />
    <title></title>
    <style>
        .formclass
        {
            padding: 120px;
            margin: 0px auto;
            background-image: url('/Content/dist/img/Panel.png');
            width: 200px;
            border-style:groove;
	        border:1px;
        }
        h1
        {
            text-align: center;
            color:aliceblue;
            font-family: Arial, Helvetica, sans-serif;
            
        }
        .label
        {
            color: aliceblue;
            font-family: Arial, Helvetica, sans-serif;
        }        
        .panel-img{
	        height:150px;
	        width:750px;
	        margin:30px 0px 0px 310px;
	        border-style:groove;
	        border:1px;
        }
        table, th, td {
            border: 1px solid black;
            border-collapse: collapse;
        }
        th, td {
            padding: 5px;
            color: aliceblue;
            width: 50px;

        }
        th {
            text-align: left;
        }

    </style>
</head>
<body style="background-image:url('/Content/dist/img/background.png')">
    <form runat="server">
        <div class="formclass">
            <h1>Summary Document</h1>
            <div class="table-responsive">
                <table class="table no-margin">
                    <thead>
                        <tr>
                            <th style="width:50%;">Role</th>
                            <th>Documents</th>                    
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>QC</td>
                            <td>Laporan_QC.doc</td>
                        </tr>
                    </tbody>
                </table>                     
            </div>
        </div>
    </form>
</body>
</html>

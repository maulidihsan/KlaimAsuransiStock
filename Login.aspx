<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebApplication1.Login" %>

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
        .input
        {            
            padding: 10px;
            width: 100%;            
            border-radius: 8px;

        }
        .panel-img{
	        height:150px;
	        width:750px;
	        margin:30px 0px 0px 310px;
	        border-style:groove;
	        border:1px;
        }
        .btnlogin{
            background-color: darkcyan;
            border: none;
            color: white;
            font-family: Arial, Helvetica, sans-serif;
            padding: 10px 20px;
            text-align: center;
            font-size: 16px;
            border-radius: 8px;
        }
        .btnlogin:hover{
            background-color: darkslategray;
            border: none;
            color: white;
            padding: 10px 20px;
            text-align: center;
            font-size: 16px;
            border-radius: 8px;
        }

    </style>
</head>

<body style="background-image:url('/Content/dist/img/background.png')">        
    <form id="form1" runat="server">
        <div class="formclass">
            <h1>Insurance Claim</h1>
            <div>
                <asp:PlaceHolder runat="server" ID="LoginStatus" Visible="false">
                <p>
                    <asp:Literal runat="server" ID="StatusText" />
                </p>
                </asp:PlaceHolder>
                <asp:PlaceHolder runat="server" ID="LoginForm" Visible="false">
                <div style="margin-bottom: 10px">
                    <asp:Label runat="server" CssClass="label" AssociatedControlID="Email">Email</asp:Label>
                    <div>
                        <asp:TextBox runat="server" CssClass="input" ID="Email" />
                    </div>
                </div>
                <div style="margin-bottom: 10px">
                    <asp:Label runat="server" CssClass="label" AssociatedControlID="Password">Password</asp:Label>
                    <div>
                        <asp:TextBox runat="server" CssClass="input" ID="Password" TextMode="Password" />
                    </div>
                </div>
                <div style="margin-bottom: 10px">
                    <div>
                        <asp:Button runat="server" OnClick="SignIn" CssClass="btnlogin" Text="Log in" />
                    </div>
                </div>
                </asp:PlaceHolder>
            </div>
        </div>
    </form>        
</body>
</html>

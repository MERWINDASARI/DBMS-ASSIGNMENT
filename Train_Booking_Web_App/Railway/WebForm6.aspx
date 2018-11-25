<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm6.aspx.cs" Inherits="Railway.WebForm6" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1{
            position:absolute;
            height:37px;
            width:106px;
            left: 586px;
            top: 432px;
        }
        .auto-style2{
            position:absolute;
            right: 239px;
            top: 129px;
            width: 814px;
            height: 209px;
            margin-left: 7px;
        }
        .auto-style3 {
            background-color:dodgerblue;
            color:white;
            height: 50px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div><center>
        <h2 class="auto-style3">RAILWAY BOOKING SYSTEM</h2>
   </center>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        </div>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            <asp:Image CssClass="auto-style2" ID="Image1" runat="server" ImageUrl="~/images/thank.jpg" />
        </p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            <center>
        <asp:Button CssClass="auto-style1" ID="btn1" runat="server" Text="Log In Again" OnClick="btn1_Click"/></center>
            </p>
    </form>
</body>
</html>

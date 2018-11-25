<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm5.aspx.cs" Inherits="Railway.WebForm5" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            border:1px black;
            width: 350px;
            height: 143px;
            margin-left: 0px;
        }
        .auto-style5 {
            height: 38px;
            width: 173px;
        }
        .auto-style6 {
            height: 34px;
            width: 173px;
        }
        .auto-style7 {
            width: 201px;
            height: 34px;
        }
        .auto-style9 {
            width: 201px;
            height: 38px;
        }
        .auto-style10 {
            height: 46px;
        }
        .auto-style11 {
            background-color:dodgerblue;
            color:white;
            height: 50px;
        }
         table,tr,td{            
           border-style:dotted;  
           border-width:1px;
           text-align:center; 
           border-color:darkgray;       
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <center>
            <h2 class="auto-style11">RAILWAY BOOKING SYSTEM</h2>
    <table class="auto-style1">
        <tr>
            <td class="auto-style5">Admin User Name :</td>
             <td class="auto-style9"><asp:TextBox ID="txtuser2" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td class="auto-style6">Admin Password :</td>
            <td class="auto-style7"><asp:TextBox ID="txtpassword2" runat="server" TextMode="Password"></asp:TextBox></td>
        </tr>
        <tr>
            <td colspan ="2" style="text-align:center" class="auto-style10">
                <asp:Button ID="btnlogin" runat="server" Text="Admin Login" Width="97px" OnClick="btnlogin_Click" Height="30px" />
            </td>
        </tr>
    </table>  
            </center>      
    </div>
    </form>
</body>
</html>

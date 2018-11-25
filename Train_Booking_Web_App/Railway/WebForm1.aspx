<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Railway.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
       
    <style type="text/css">
        .auto-style1 {
            width: 318px;
            height: 122px;
        }
        .body{
            background-color:#e1e3e8;
        }
        .auto-style3 {
            height: 53px;
        }
        .auto-style4 {
            width: 201px;
            height: 53px;
        }
        .auto-style5 {
            height: 38px;
        }
        .auto-style6 {
            height: 34px;
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
        .auto-style12 {
            margin-left: 0px;
        }
    </style>
       
</head>

<body>
    <center>
     <h2 class="auto-style11">RAILWAY BOOKING SYSTEM</h2>
    <form id="form1" runat="server">
        
    <div>
        
    <table class="auto-style1">
        <tr>
            <td class="auto-style5">User Name :</td>
             <td class="auto-style9"><asp:TextBox ID="txtuser" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td class="auto-style6">Password :</td>
            <td class="auto-style7"><asp:TextBox ID="txtpassword" runat="server" TextMode="Password" OnTextChanged="txtpassword_TextChanged"></asp:TextBox></td>
        </tr>
        <tr>
            <td colspan ="2" style="text-align:center" class="auto-style10">
                <asp:Button ID="btnlogin" runat="server" Text="Login" Width="84px" OnClick="btnlogin_Click" CssClass="auto-style12" Height="31px" />
            </td>
        </tr>
        <tr><td class="auto-style3">Create New Account:</td><td class="auto-style4"><asp:Button ID="btnsignup" runat="server" Text="Sign-up" Width="77px" OnClick="btnsignup_Click" Height="30px"/></td></tr>
        <tr><td class="auto-style3">Switch to Admin:</td><td class="auto-style4"><asp:Button ID="btnadmin" runat="server" Text="Admin Account" Width="105px" OnClick="btnadmin_Click" Height="30px"/></td></tr>
    </table>            
    </div>        
    </form>
        </center>
    
</body>    
</html>

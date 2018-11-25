<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="Railway.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style2 {
            height: 40px;
        }
        .auto-style4 {
            border:1px black;
            height: 274px;
            width: 338px;
        }
        .auto-style6 {
            height: 33px;
        }
        .auto-style7 {
            background-color:dodgerblue;
            color:white;
            height: 50px;
        }
        .auto-style8 {
            height: 27px;
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
        <center>
    <div>
        <h2 class="auto-style7">RAILWAY BOOKING SYSTEM</h2>
        <h3 class="auto-style8">SIGN UP NOW !!!</h3>
    <table class="auto-style4">
       
        <tr>
            <td>User Name :</td>
            <td><asp:TextBox ID="txtuser1" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td>New Password :</td>
            <td><asp:TextBox ID="txtpassword1" runat="server"></asp:TextBox></td>
        </tr>
         <tr>
            <td>Aadhar No :</td>
            <td><asp:TextBox ID="txtaadhar" runat="server"></asp:TextBox></td>
        </tr>
         <tr>
            <td>Bank A/C No :</td>
            <td><asp:TextBox ID="txtbank" runat="server" ></asp:TextBox></td>
        </tr>
         <tr>
            <td class="auto-style6">Intial Amount :</td>
            <td class="auto-style6"><asp:TextBox ID="txtamount" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td colspan ="2" style="text-align:center" class="auto-style2">
                <asp:Button ID="btnlogin1" runat="server" Text="Sign up" Width="82px" OnClick="btnlogin1_Click" Height="31px" />
            </td>
        </tr>
    </table>         
    </div>
             </center>
    </form>   
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm3.aspx.cs" Inherits="Railway.WebForm3" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"></link>
    <style type="text/css">
        .auto-style1 {
            border:1px black;
            width: 329px;
            height: 118px;
        }
        .auto-style2 {
            border:1px black;
            width: 529px;
            height: 98px;
        }

        .auto-style3 {
            position: absolute;
            top: 78px;
            right: 225px;
            width: 154px;
            height: 30px;
        }
             .auto-style4 {
            position: absolute;
            top: 78px;
            right: 57px;
            width: 154px;
            height: 30px;
        }
             .auto-style5{
               position: absolute;
            left: 668px;
            top: 68px;
            width: 282px;
            height: 37px;
            font-size: large;
        }
        .auto-style6 {
            width: 127px;
        }
        .auto-style7 {
            border:1px black;
            width: 524px;
            height: 127px;
        }
        .auto-style8 {
            height: 34px;
        }
        .auto-style9 {
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
        .auto-style11 {
            height: 50px;
        }
    </style>
    </head>
<body>
    <form id="form1" runat="server">
        <center>        
        <h2 class="auto-style9">RAILWAY BOOKING SYSTEM
            <asp:Label CssClass="auto-style5" ID="lbuser" runat="server" Text="Label" Font-Bold="True" Font-Italic="True" Font-Size="XX-Large"></asp:Label>
            </h2></center>
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div>
            <asp:Button CssClass="auto-style3" ID="btnhistory" runat="server" Text="Current Bookings" OnClick="btnhistory_Click" />
            <asp:Button CssClass="auto-style4" ID="btnout" runat="server" Text="Log Out" OnClick="btnout_Click" />
        </div>
        <div>
            <table class="auto-style7"><tr><td class="auto-style6"> Date Of Journey :&nbsp  </td>
                   <td> <asp:TextBox ID="txtdate" runat="server" OnDataBinding="txtdate_DataBinding" OnTextChanged="txtdate_TextChanged" Height="20px" Width="115px"></asp:TextBox></td>
                <td>
                    <asp:Button ID="btntrain" runat="server" Text="Get Trains" OnClick="btntrain_Click" Height="25px" Width="99px" /></td>
           
           <ajaxToolkit:CalendarExtender ID="txtdate_CalendarExtender" runat="server" BehaviorID="txtdate_CalendarExtender" TargetControlID="txtdate" /></tr>
                <tr>
                    <td class="auto-style6">From Place :&nbsp</td><td><asp:DropDownList ID="dropfrom" runat="server" Height="22px" Width="131px" OnLoad="dropfrom_Load"></asp:DropDownList></td>
                     <td>
                        <asp:DropDownList ID="droptrain" runat="server" Height="25px" Width="158px" OnLoad="droptrain_Load" OnSelectedIndexChanged="droptrain_SelectedIndexChanged" OnTextChanged="txtstart_TextChanged">
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem></asp:ListItem>
                         </asp:DropDownList></td>                    
                    </tr>
                    <tr>
                        <td class="auto-style6">
                            To Place :&nbsp
                        </td> 
                        <td>
                            <asp:DropDownList ID="dropto" runat="server" Height="23px" Width="132px" OnLoad="dropto_Load">
                            </asp:DropDownList>
                        </td>     
                        <td><asp:Button ID="btnplace" runat="server" Text="Get Stations" OnClick="btnplace_Click" Height="27px" Width="117px" /></td>             
                    </tr>
            </table>
            <h3 class="auto-style8">&nbsp&nbsp Add Passengers</h3>
            <table class="auto-style2">
                <tr>
                    <td class="auto-style11">Passenger Name: <asp:TextBox ID="txtpass" runat="server"></asp:TextBox></td>
                    <td class="auto-style11">Age: <asp:TextBox ID="txtage" runat="server" OnTextChanged="txtage_TextChanged"></asp:TextBox></td>
                    <td class="auto-style11"><asp:ImageButton ImageUrl="~/images/add.png" ID="ImageButton1" runat="server" Height="24px" OnClick="ImageButton1_Click" Width="31px" />&nbsp&nbsp&nbsp</td>
                </tr>                
                <tr><td colspan="2" style="text-align:center" class="auto-style11">
                     <asp:Button ID="btnpay" runat="server" Text="Check Balance" Width="119px" OnClick="btnpay_Click" Height="28px" /></td></tr>
                </table>
            <center>
                <table class="auto-style1">
                <tr>
                    <td>Account Number: </td>
                    <td>
                        <asp:TextBox ID="txtacc" runat="server" Width="107px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Amount: </td>
                    <td>
                        <asp:TextBox ID="txtamo" runat="server" Width="107px"></asp:TextBox></td>
                </tr>
                    <tr><td colspan="2" style="text-align:center">
                        <asp:Button ID="btnbook" runat="server" Text="Book Ticket" OnClick="btnbook_Click" Height="28px" Width="118px" /></td></tr>
            </table>           
                </center>
    </div>
       
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            <asp:TextBox ID="txtstart" runat="server" Height="16px" OnTextChanged="txtstart_TextChanged" Width="16px"></asp:TextBox>
                        <asp:TextBox ID="txtplace" runat="server" Height="16px" Width="16px"></asp:TextBox>
            <asp:Button ID="btnadd" runat="server" Text=" " Width="16px" OnClick="btnadd_Click" Height="16px" />
        </p>
       
    </form>
</body>
</html>

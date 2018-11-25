<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm4.aspx.cs" Inherits="Railway.WebForm4" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1{
            position: absolute;
            top: 78px;
            right: 57px;
            width: 154px;
            height: 30px;
        }
        .auto-style2 {
            background-color:dodgerblue;
            color:white;
            height: 50px;
        }
        .auto-style3 {
            height: 54px;
            margin-top: 43px;
        }
        .auto-style5 {
            position:absolute;
            top: 494px;
            height: 1px;
            width: 1px;
            left: 436px;
        }
        .auto-style6 {
            position: absolute;
            left: 668px;
            top: 68px;
            width: 282px;
            height: 37px;
            font-size: large;
        }
        table,tr,td{            
           border-style:dotted;  
           border-width:1px;        
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <center>
        <h2 class="auto-style2">RAILWAY BOOKING SYSTEM</h2>
            </center</div>
      <div><asp:Label CssClass="auto-style6" ID="lbuser1" runat="server" Text="Label" Font-Bold="True" Font-Italic="True" Font-Size="XX-Large" Visible="False"></asp:Label>
      <div><h3 class="auto-style3">PREVIOUS BOOKINGS</h3></div><asp:Button CssClass="auto-style1" ID="btnout" runat="server" Text="Log Out" OnClick="btnout_Click" />
        
        <center> </div><div>
               <asp:GridView ID="GridView1" runat="server" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="681px" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" ViewStateMode="Enabled" DataKeyNames="Ticket" ShowHeaderWhenEmpty="true" 
                   OnRowCommand="GridView1_RowCommand" OnRowDeleting="GridView1_RowDeleting" >
                   <AlternatingRowStyle BackColor="White" />
                   <EditRowStyle BackColor="#2461BF" />
                   <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                   <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                   <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                   <RowStyle BackColor="#EFF3FB" />
                   <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                   <SortedAscendingCellStyle BackColor="#F5F7FB" />
                   <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                   <SortedDescendingCellStyle BackColor="#E9EBEF" />
                   <SortedDescendingHeaderStyle BackColor="#4870BE" />
                   <Columns>
                       <asp:TemplateField HeaderText ="Ticket">
                           <ItemTemplate>
                               <asp:Label Text = '<%# Eval("Ticket")%>' runat ="server" />
                           </ItemTemplate>
                       </asp:TemplateField>
                       <asp:TemplateField HeaderText ="Journey">
                           <ItemTemplate>
                               <asp:Label Text = '<%# Eval("Journey")%>' runat ="server" />
                           </ItemTemplate>
                       </asp:TemplateField>
                       <asp:TemplateField HeaderText ="Amount">
                           <ItemTemplate>
                               <asp:Label Text = '<%# Eval("Amount")%>' runat ="server" />
                           </ItemTemplate>
                       </asp:TemplateField>
                       <asp:TemplateField>
                           <ItemTemplate>
                               <asp:ImageButton ImageUrl ="~/images/blue-delete-button-png-29.png" CommandName="Delete" ToolTip="Delete" Width="20px" Height ="20px" runat="server"/>
                           </ItemTemplate>
                       </asp:TemplateField>
                   </Columns>

               </asp:GridView>
        </center>
       
    </div>
    <p>
        <asp:Button  ID="btncancel" runat="server" Text="Cancel Ticket" CssClass="auto-style5" OnClick="btncancel_Click" />
        </p>
    </form>
    </body>
    
</html>

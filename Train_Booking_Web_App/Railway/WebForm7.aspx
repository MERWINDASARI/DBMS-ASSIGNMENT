<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm7.aspx.cs" Inherits="Railway.WebForm7" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            margin-left: 0px;
        }
        .auto-style2 {
             position: absolute;
            top: 78px;
            right: 57px;
            width: 154px;
            height: 30px;
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
      <center><h2 class="auto-style3">RAILWAY RESERVATION SYSTEM</h2></center> 
    <div>
        <center>
            <h3>TRAIN STATUS<asp:Button Cssclass="auto-style2" ID="Button1" runat="server" Text="Log Out" OnClick="Button1_Click"></asp:Button>
            </h3></center>
     <center><asp:GridView ID="GridView1" runat="server" CellPadding="4" CssClass="auto-style1" ForeColor="#333333" GridLines="None" Height="162px" Width="877px" AutoGenerateColumns="False"
             DataKeyNames="Train" OnRowEditing="GridView1_RowEditing" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowUpdating="GridView1_RowUpdating">
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
                <asp:TemplateField HeaderText="Train">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("Train") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtTrain" Text='<%# Eval("Train") %>' runat="server" />
                        </EditItemTemplate>
                    </asp:TemplateField>
                <asp:TemplateField HeaderText="Station_list">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("Station_list") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtStation_list" Text='<%# Eval("Station_list") %>' runat="server" />
                        </EditItemTemplate>
                    </asp:TemplateField>
                <asp:TemplateField HeaderText="Days">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("days") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtdays" Text='<%# Eval("days") %>' runat="server" />
                        </EditItemTemplate>
                    </asp:TemplateField>
                <asp:TemplateField HeaderText="Status">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("State") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtState" Text='<%# Eval("State") %>' runat="server" />
                        </EditItemTemplate>
                    </asp:TemplateField>
                <asp:TemplateField>
                        <ItemTemplate>
                            <asp:ImageButton ImageUrl="~/images/698873-icon-136-document-edit-512.png" runat="server" CommandName="Edit" ToolTip="Edit" Width="20px" Height="20px"/>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:ImageButton ImageUrl="~/images/images (1).jpg" runat="server" CommandName="Update" ToolTip="Update" Width="20px" Height="20px"/>
                            <asp:ImageButton ImageUrl="~/images/images.jpg" runat="server" CommandName="Cancel" ToolTip="Cancel" Width="20px" Height="20px"/>
                        </EditItemTemplate>
                    </asp:TemplateField>
            </Columns>
        </asp:GridView>
            </center>
    </div>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" 
Inherits="TTS.ProductTypes"  MasterPageFile="~/layout/Admin_layout.master" Codebehind="ProductTypes.aspx.cs" %>

<%@ MasterType VirtualPath="~/layout/Admin_layout.master" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server" ID="cMain">

<table  cellpadding="10px" border="1">
    <tr>
        <td style="width:30%" valign="top">
            <div style="text-align:center">
                <b>All Products</b>
            </div>
            <asp:ListBox runat="server" ID="lstProducts" AutoPostBack="true" OnSelectedIndexChanged="lstProducts_Change" Rows="10" ></asp:ListBox>
            <div style="text-align:center"><br />
                <asp:Button runat="server" ID="btnSelProduct" Text="Select"  OnClick="btnSelProduct_Click" />
            </div>
            
        </td>
        <td valign="top">
            <div>
                <asp:Label runat="server" ID="lblProductName" Font-Bold="true" Font-Size="large" />
            </div>
            <div style="border:dashed 1px black">
                <asp:CheckBoxList runat="server" RepeatColumns="3" RepeatDirection="Horizontal"  CellPadding="5" CellSpacing="5" ID="cblProdTypes" />
            </div>
            <br />
            <div style="text-align:left ">
                <asp:Button runat="server" ID="btnSaveTypes" Text="Save Types" OnClick="btnSaveTypes_Click" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <a href="main.aspx"  >Return to Admin Menu</a>
            </div>            
        </td>
    </tr>
</table>


</asp:Content>



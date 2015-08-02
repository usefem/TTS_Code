<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ActiveProductList.aspx.cs" 
MasterPageFile="~/layout/Admin_layout.master" Inherits="TTS.ActiveProductList" %>

<%@ MasterType VirtualPath="~/layout/Admin_layout.master" %>
<asp:Content ContentPlaceHolderID="MainContent" runat="server" ID="cMain">
    <br />
    <br />
    <b>The Teacher's Spot: Active Product list
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <%--<a href="main.aspx">Return to Admin Menu</a>--%>
    </b>
    <asp:DataList ID="dlProducts" RepeatDirection="Horizontal" RepeatColumns="2" runat="server">
        <HeaderTemplate>
            <table border="0" cellpadding="1" cellspacing="0">
                <tr style="background-color: #6699CC">
                    <td style="width:100px">Product ID</td>
                    <td style="width: 600px;">
                        &nbsp;&nbsp;Item Name</td>
                    <td style="width: 100px;" align="center">
                        Item Price</td>
                </tr>
        </HeaderTemplate>
        <ItemTemplate>
            <tr style="background-color: #EEF3E2">
                <td style="width:100px">
                <%# DataBinder.Eval(Container.DataItem, "iProductId")%></td>
                <td style="width: 600px;">
                    <%# DataBinder.Eval(Container.DataItem, "sProdName")%>
                    &nbsp;&nbsp;(<%# DataBinder.Eval(Container.DataItem, "sItemNo")%>)</td>
                <td style="width: 100px;" align="right">
                    $<%# DataBinder.Eval(Container.DataItem, "dPrice")%>
                </td>
            </tr>
        </ItemTemplate>
        <AlternatingItemTemplate>
            <tr style="background-color: GrayText">
                <td style="width:100px">
                <%# DataBinder.Eval(Container.DataItem, "iProductId")%></td>
                <td style="width: 600px;">
                    <%# DataBinder.Eval(Container.DataItem, "sProdName")%>
                    &nbsp;&nbsp;(<%# DataBinder.Eval(Container.DataItem, "sItemNo")%>)</td>
                <td style="width: 100px;" align="right">
                    $<%# DataBinder.Eval(Container.DataItem, "dPrice")%>
                </td>
            </tr>
        </AlternatingItemTemplate>
        <FooterTemplate>
            </table>
        </FooterTemplate>
    </asp:DataList>
</asp:Content>
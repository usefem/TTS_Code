<%@ Page Language="C#" AutoEventWireup="true" Inherits="TTS.PrintableOrderForm" MasterPageFile="~/layout/MasterPage2.master"
    Codebehind="PrintableOrderForm.aspx.cs" %>

<%@ MasterType VirtualPath="~/layout/MasterPage2.master" %>
<asp:Content ContentPlaceHolderID="MainContent" runat="server" ID="cMain">
    Download <a href="orderform/orderform.pdf">Order form</a>
    <br />
    <br />
    <b>The Teacher's Spot Price list as of
        <%=GetDateStr%>
    </b>
    <asp:DataList ID="dlProducts" RepeatDirection="Horizontal" RepeatColumns="2" runat="server">
        <HeaderTemplate>
            <table border="0" cellpadding="1" cellspacing="0">
                <tr style="background-color: #6699CC">
                    <td style="width: 600px;">
                        &nbsp;&nbsp;Item Name</td>
                    <td style="width: 100px;" align="center">
                        Item Price</td>
                </tr>
        </HeaderTemplate>
        <ItemTemplate>
            <tr style="background-color: #EEF3E2">
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

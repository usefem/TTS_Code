<%@ Control Language="C#" AutoEventWireup="true" Inherits="uc_ProductSearch" Codebehind="ProductSearch.ascx.cs" %>

<asp:Panel runat="server" ID="plnSearch"  DefaultButton="btnSubmit">
<div style="color:black">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Product Search </b>
    <asp:TextBox  runat="server" ID="txtSeachText" MaxLength="20"  AutoPostBack="false" ToolTip="Minimum of 3 Characters, Max of 20"></asp:TextBox>
    <asp:Button  runat="server" ID="btnSubmit"  Text="Go" OnClick="btnSubmit_Click" />
</div>
</asp:Panel>

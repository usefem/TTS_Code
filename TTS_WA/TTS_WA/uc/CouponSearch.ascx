<%@ Control Language="C#" AutoEventWireup="true" Inherits="uc_CouponSearch" Codebehind="CouponSearch.ascx.cs" %>

<asp:Panel runat="server" ID="plnCoupon" DefaultButton="btnCouponSubmit">
<div style="color:yellow">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Enter your coupon here</b>&nbsp;&nbsp;
    <asp:TextBox  runat="server" ID="txtCouponCode" MaxLength="20"  AutoPostBack="false" ></asp:TextBox>
    <asp:Button  runat="server" ID="btnCouponSubmit"  Text="Go" OnClick="btnCouponSubmit_Click" />
        <b><asp:Label ID="lblCouponMsg" runat="server"></asp:Label></b>
</div>
</asp:Panel>
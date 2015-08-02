<%@ Page Language="C#" AutoEventWireup="true" Inherits="admin_main" 
MasterPageFile="~/layout/Admin_layout.master" Codebehind="main.aspx.cs" %>

<%@ MasterType VirtualPath="~/layout/Admin_layout.master" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server" ID="cMain">

<center>
    <div style="background:white; width:300px; height:200px; text-decoration:none; padding:5px; color:Black; border-color:Black ; border-width:5px; border-style:double  " >
        <br />
        <b><a href="ProductMaintenance.aspx">Product Maintenance</a></b><br /><br />
        <b><a href="ProductTypes.aspx">Set Up Product Types</a></b><br /><br />
        <b><a href="ActiveProductList.aspx">Active Product List</a></b><br /><br />
        <b><a href="CouponCodes.aspx">Manage Coupon Codes</a></b><br /><br />
        
    </div>


</center>
</asp:Content> 
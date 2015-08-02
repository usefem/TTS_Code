<%@ Page Language="C#" AutoEventWireup="true" Inherits="admin_Login" 
MasterPageFile="~/layout/Admin_layout.master" Codebehind="Login.aspx.cs" %>

<%@ MasterType VirtualPath="~/layout/Admin_layout.master" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server" ID="cMain">

<center>
<table >
    <tr>
        <td >
            User ID :&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox  runat="server" ID="txtUid" ></asp:TextBox><br />
            Password : <asp:TextBox  TextMode="Password" runat="server" ID="txtPwd" ></asp:TextBox>
        
        </td>
    </tr>
    <tr>
        <td >
            <asp:Label Text="" ID="lblMsg" ForeColor="Red" runat="server" />
        </td>
    </tr>
    <tr>
        <td align="center">
        
            <asp:Button runat="server" ID="btnSubmit" Text="Submit"  OnClick="cmdSubmit_Click" />
        </td>
    </tr>
</table>
</center>
</asp:Content>
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Error.aspx.cs" 
Inherits="TTS_WA.Error" MasterPageFile="~/layout/MasterPage2.master" %>

<%@ MasterType VirtualPath="~/layout/MasterPage2.master" %>

 
<asp:Content ContentPlaceHolderID="MainContent" runat="server" ID="cMain">

An unhandeled error has occured.

<asp:Label runat="server" ID="lblError"></asp:Label>
</asp:Content>

<%@ Page Language="C#" AutoEventWireup="true" Inherits="Question" 
MasterPageFile="~/layout/MasterPage2.master" Codebehind="Question.aspx.cs" %>

<%@ MasterType VirtualPath="~/layout/MasterPage2.master" %>
<asp:Content ContentPlaceHolderID="MainContent" runat="server" ID="cMain">
<form runat="server">


How did you here about The Teachers Spot?<br />
<asp:RadioButton runat="server" ID="radHearAbout1" GroupName="HearAbout" Text="   Internet" /><br />
<asp:RadioButton runat="server" ID="radHearAbout2" GroupName="HearAbout" Text="   Workplace/Co-Worker" /><br />
<asp:RadioButton runat="server" ID="radHearAbout3" GroupName="HearAbout" Text="   Flyer, Newspaper, Magazine" /><br />
<asp:RadioButton runat="server" ID="radHearAbout4" GroupName="HearAbout" Text="   Word of mouth" /><br /><br />

<asp:Button runat="server" id="butSubmit" Text="Submit" />

</form>

</asp:Content>

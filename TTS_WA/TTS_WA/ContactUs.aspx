<%@ Page Language="C#" AutoEventWireup="true" Inherits="ContactUs"     
MasterPageFile="~/layout/MasterPage2.master" Codebehind="ContactUs.aspx.cs" %>

<%@ MasterType VirtualPath="~/layout/MasterPage2.master" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server" ID="cMain">
    <table border="0" width="700">
        <tr>
            <td>
                <div style="position: relative; top: 0px; left: 0px; z-index: 1">
                    <img src="img/blackboard.gif" width="100%" height="600" />
                </div>
                <div style="position: absolute; top: 320px; left: 330px; z-index: 2; width: 532px;
                    height: 446px; font-family: Comic Sans MS;">
                    <table style="color: White">
                        <tr>
                            <td align="center">
                                <span style="font-size: x-large;">Thank you for visiting<br />
                                    <br />
                                    The Teacher's Spot</span>
                            </td>
                        </tr>
                        <tr>
                            <td align="center"><span style="font-size: x-large;">
                                <br />
                                <br />
                                Contact information:<br />
                                <br />
                                <a style="color:White;"  href="mailto:CustomerService@TheTeachersSpot.com">CustomerService@TheTeachersSpot.com</a><br />
                                <br />
                                The Teacher’s Spot<br />
                                P.O. Box 691<br />
                                Rahway, NJ 07065<br /><br />
                                732-259-5582<br />
                                732-574-0566 (fax)<br /></span>
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
        </tr>
    </table>
</asp:Content>

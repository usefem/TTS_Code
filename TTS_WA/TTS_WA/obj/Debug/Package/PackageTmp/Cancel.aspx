<%@ Page Language="C#" AutoEventWireup="true" Inherits="Cancel" 
   MasterPageFile="~/layout/MasterPage2.master" Codebehind="Cancel.aspx.cs" %>

<%@ MasterType VirtualPath="~/layout/MasterPage2.master" %>
  
<asp:Content ContentPlaceHolderID="MainContent" runat="server" ID="cMain">
    <table border="0" width="100%">
        <tr>
            <td>
                <div style="position: relative; top: 0px; left: 0px; z-index: 1">
                    <img src="img/blackboard.gif" width="100%" height="600" />
                </div>
                <div style="position: absolute; top: 300px; left: 350px; z-index: 2; width: 532px;
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
                            <td align="center">
                                <br />
                                <br />
                                If you did not find what you were looking for or <br />had a problem with the site please contact us:<br />
                                <br />
                                CustomerService@TheTeachersSpot.com<br />
                                <br />
                                The Teacher’s Spot<br />
                                P.O. Box 691<br />
                                Rahway, NJ 07065<br />
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
        </tr>
    </table>
</asp:Content>

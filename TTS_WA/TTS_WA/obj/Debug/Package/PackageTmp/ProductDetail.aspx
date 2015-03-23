<%@ Page Language="C#" AutoEventWireup="true" Inherits="TTS.ProductDetail" 
  EnableEventValidation="false"  MasterPageFile="~/layout/MasterPage2.master" Codebehind="ProductDetail.aspx.cs" %>
  
<%@ MasterType VirtualPath="~/layout/MasterPage2.master" %>

<asp:Content ID="cHead" ContentPlaceHolderID="cphHead" runat="server">
	<link media="screen" rel="stylesheet" href="/css/colorbox.css" />    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.1/jquery.min.js"></script>
    <script src="/js/jquery.colorbox.js"></script>
	<script>
		$(document).ready(function(){
			//Examples of how to assign the ColorBox event to elements
			$(".video").colorbox({iframe:true, innerWidth:425, innerHeight:344});
//			$(".example9").colorbox({
//				onOpen:function(){ alert('onOpen: colorbox is about to open'); },
//				onLoad:function(){ alert('onLoad: colorbox has started to load the targeted content'); },
//				onComplete:function(){ alert('onComplete: colorbox has displayed the loaded content'); },
//				onCleanup:function(){ alert('onCleanup: colorbox has begun the close process'); },
//				onClosed:function(){ alert('onClosed: colorbox has completely closed'); }
//			});
			
			//Example of preserving a JavaScript event for inline calls.
			$("#click").click(function(){ 
				$('#click').css({"background-color":"#f00", "color":"#fff", "cursor":"inherit"}).text("Open this window again and this message will still be here.");
				return false;
			});
		});
	</script>  
</asp:Content>
    
<asp:Content ContentPlaceHolderID="MainContent" runat="server" ID="cMain">
<asp:Panel ID="pnlShowProduct" runat="server" Visible="true">
        <table border="0">
            <tr>
                <td>
                    <table border="0">
                        <tr>
                            <td align="left">
                                <img runat="server" id="imgProd" src="" height="300" />
                            </td>
                            <td>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            </td>
                            <td>
                                <span style="font-family: Comic Sans MS;"><b>
                                    <asp:Label ID="lblProdName" runat="server" /></b><br />
                                    Item No:
                                    <asp:Label ID="lblItemNo" runat="server" /><br />
                                    <asp:Label ID="lblPrice" runat="server" />
                                    <asp:Literal ID="litVideoLink" runat="server" ></asp:Literal>
                                    <asp:Label  runat="server" ID="lblOutofStockMsg" Text="<br />Out of Stock"  ForeColor="red" Visible="false" />
                                </span>
                                <br />
                                <br />
                                <asp:Literal ID="litPayPalForm" runat="server" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td align="left">
                    <span style="font-family: Comic Sans MS;">
                        <asp:Label ID="lblProdDesc" runat="server" /></span>
                        
                </td>
            </tr>
        </table>
        
        <form id="order" name="order" action='https://www.paypal.com/cgi-bin/webscr' method="post">
            <asp:Panel runat="server" ID="pnlForm" Visible="false">
            </asp:Panel>
        </form>
</asp:Panel>
<asp:Panel runat="server" ID="pnlNoProduct" >
    <asp:Literal ID="litMessage" runat="server"  />
</asp:Panel>
</asp:Content>

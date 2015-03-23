<%@ Page Language="C#" AutoEventWireup="true" Inherits="TTS.Products" MasterPageFile="~/layout/MasterPage2.master"
    ValidateRequest="false" EnableEventValidation="false" Codebehind="Products.aspx.cs" %>

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
    <table border="0"  width="650" cellpadding="4">
        <tr>
            <td>
                <span style="font-size: 24px;">
                    <asp:Label ID="lblProdType" runat="server" /></span>
            </td>
            <td align="right">
                <asp:Panel runat="server" ID="pnlTopPaging">
                    <a href="" runat="server" id="aPrevTop">
                        <img src="img/arrowPrev.gif" alt="Previous Page" /></a>&nbsp;&nbsp; &nbsp;
                    <asp:Literal runat="server" ID="litPageNums_Top"></asp:Literal>
                    <a href="" runat="server" id="aNextTop">
                        <img src="img/arrowNext.gif" alt="Next Page" /></a><br />
                    <asp:Label ID="lblCurrentPage" runat="server"></asp:Label>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Repeater ID="repProducts" runat="server">
                    <HeaderTemplate>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <table width='650' border='0' cellpadding='5' style="background-color: #ffff99; border:solid 2px black">
                            <tr>
                                <td colspan="3">
                                    <span style="font-size: larger; font-family: Comic Sans MS;">
                                        <%# DataBinder.Eval(Container.DataItem, "sProdName")%>
                                    </span><span style="font-size: small; font-family: Comic Sans MS;">(#<%# DataBinder.Eval(Container.DataItem, "sItemNo")%>)</span>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 185px">
                                    <!--Image and name-->
                                    <table width='180' border='0'>
                                        <tr>
                                            <td align='center' valign='top'>
                                                <a href="ProductDetail.aspx?ProdId=<%# DataBinder.Eval(Container.DataItem, "iProductId")%>">
                                                    <img src='img/prodthumbs/<%# DataBinder.Eval(Container.DataItem, "sImageName")%>' height='120' alt='<%# DataBinder.Eval(Container.DataItem, "sProdName")%>' />
                                                    <br />
                                                    <span style="font-size: small; font-family: Comic Sans MS;">Larger image</span>
                                                </a>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <td valign='top'>
                                    <span style="font-family: Comic Sans MS;">
                                        <%# BriefDesc(DataBinder.Eval(Container.DataItem, "sLongDesc").ToString(), DataBinder.Eval(Container.DataItem, "iProductID").ToString())%>
                                    </span>
                                    <%# VideoLink(DataBinder.Eval(Container.DataItem, "sVideoPath").ToString(), DataBinder.Eval(Container.DataItem, "sVideoTitle").ToString(), DataBinder.Eval(Container.DataItem, "sProdName").ToString())%>
                                </td>
                                <td align='right'>
                                    <table>
                                        <tr>
                                            <td align='center' valign='top'>
                                                <span style="font-family: Comic Sans MS;"><b>
                                                    <%#DisplayPrice(DataBinder.Eval(Container.DataItem, "dPrice").ToString())%>
                                                </b></span>
                                                <br />
                                                <br />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align='center' valign='top'>
                                                <%--<form>
                                                </form>--%>
                                                <form target='paypal' action='https://www.paypal.com/cgi-bin/webscr' method='post'>
                                                    <asp:Literal ID="litInputFields" runat="server" Text='<%#PayPalInputFields(DataBinder.Eval(Container.DataItem, "sProdName").ToString(), DataBinder.Eval(Container.DataItem, "sItemNo").ToString(), DataBinder.Eval(Container.DataItem, "dPrice").ToString(), DataBinder.Eval(Container.DataItem, "iWeight").ToString(), DataBinder.Eval(Container.DataItem, "sSizes").ToString(), DataBinder.Eval(Container.DataItem, "sColors").ToString() ) %>'></asp:Literal>
                                                    <input type='image' src='https://www.paypal.com/en_US/i/btn/btn_cart_SM.gif' name='submit'
                                                        alt='Make payments with PayPal - it`s fast, free and secure!' />
                                                    <img alt='' src='https://www.paypal.com/en_US/i/scr/pixel.gif' width='1' height='1' />
                                                </form>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                    <SeparatorTemplate>
                        <br />
                    </SeparatorTemplate>
                </asp:Repeater>
            </td>
        </tr>
    </table>
    <table style="width: 690px">
        <tr>
            <td align="left">
                <form target='paypal' action='https://www.paypal.com/cgi-bin/webscr' method='post'>
                    <input type='hidden' name='cmd' value='_cart' />
                    <input type='hidden' name='business' value='paypal@theteachersspot.com' />
                    <input type='image' src='https://www.paypal.com/en_US/i/btn/btn_viewcart_LG.gif'
                        name='submit' alt='Make payments with PayPal - it`s fast, free and secure!' />
                    <input type='hidden' name='display' value='1' />
                </form>
            </td>
            <td align="right">
                <asp:Panel runat="server" ID="pnlBottomPaging">
                    <a href="" runat="server" id="aPrev">
                        <img src="img/arrowPrev.gif" alt="Previous Page" /></a>&nbsp;&nbsp; &nbsp;
                    <asp:Literal runat="server" ID="litPageNums_Bottom"></asp:Literal>
                    <a href="" runat="server" id="aNext">
                        <img src="img/arrowNext.gif" alt="Next Page" /></a>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <b>Print out <a href="PrintableOrderForm.aspx">order form and price list</a> to pay
                    by check.</b>
            </td>
        </tr>
    </table>
</asp:Content>

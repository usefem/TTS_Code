<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FeaturedProducts.ascx.cs" Inherits="TTS.uc.FeaturedProducts" %>

<li><img src="/img/spacer.gif" width="525px"  alt="" title="" />
    <div class="story_item">
        <table width="525" border='0' cellpadding='5' style=" border-top:solid 2px black; border-bottom:solid 2px black; background-color:#ffff99; height:220px">
             <tr>
                <td colspan="2">
                    <span style="font-size:larger;font-family: Comic Sans MS;"><%= this.ProdName%></span>
                    <span style="font-size:small;font-family: Comic Sans MS;">(#<%= this.ItemNumber%>)</span>
                </td>
            </tr>
            <tr>
                <td style="width: 185px"  valign='top'>
                    <!--Image and name-->
                    <table width='180' border='0'>
                        <tr>
                            <td  valign='top' align='center'  >
                                <a href="ProductDetail.aspx?ProdId=<%= this.ProductId%>">
                                <img src="/img/prodthumbs/<%= this.ProdImageName%>" height='120' alt="<%= this.ProdName%>" />
                                <br /><span style="font-size:small;font-family: Comic Sans MS;">Larger image</span> </a>
                            </td>
                        </tr>
                    </table>
                </td>
                <td valign='top'>
                    <span style="font-family: Comic Sans MS;"><%= BriefDesc(this.ProdDesc, this.ProductId)%></span><br />
                    <span style="font-family: Comic Sans MS; font-size:12pt"><b>$<%=this.Price%></b></span><br />
                </td>
                <td align='right'>
                </td>
            </tr>
        </table>
    </div> 
</li>
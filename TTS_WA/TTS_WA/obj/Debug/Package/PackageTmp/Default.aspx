<%@ Page Language="C#" AutoEventWireup="true" Inherits="TTS._Default" MasterPageFile="~/layout/MasterPage2.master"
    Codebehind="Default.aspx.cs" %>

<%@ MasterType VirtualPath="~/layout/MasterPage2.master" %>
<asp:Content ID="cHead" ContentPlaceHolderID="cphHead" runat="server">
    <link rel="stylesheet" type="text/css" href="/css/slider.css" />

    <script language="javascript" type="text/javascript" src="/js/jquery.js"></script>
    <script language="javascript" type="text/javascript" src="/js/jquery.easing.js"></script>
    <script language="javascript" type="text/javascript" src="/js/script.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            var buttons = {
                previous: $('#mainslider .previous'),
                next: $('#mainslider .next')
            };

            $obj = $('#mainslider').slidernews({ interval: 10000,
                direction: 'opacitys',
                easing: 'easeInOutExpo',
                duration: 1200,
                auto: true,
                maxItemDisplay: 5,
                navPosition: 'horizontal',
                navigatorHeight: 20, //controls height of nav buttons. Must adjust here as well the css to make smaller or larger //
                navigatorWidth: 25, //controls width of nav buttons. Must adjust here as well the css to make smaller or larger //
                mainWidth: 525,
                buttons: buttons
            });
        });
    </script>

</asp:Content>
<asp:Content ContentPlaceHolderID="MainContent" runat="server" ID="cMain">
    <table border="0">
        <tr>
            <td>
                <table border="0" width="550">
                    <tr valign="top">
                        <td id="prem_hint_off" align="center" class="prem_hint" style="font-weight: bold; color: Blue;
                            font-family: arial; font-size: x-large">
                            <!--
                <a href="Products.aspx?catid=gft">
                    <blink>Gifts for the Teacher</blink>
                </a>
                -->
        				<marquee style="FONT-WEIGHT: bold; COLOR: Blue; 
					FONT-FAMILY: arial" scrollamount="3" scrolldelay="1" height="4%" align="middle">
				<%=sMarquee %>
			</marquee> 
			
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">
                            <asp:Panel runat="server" ID="pnlFeaturedProd" Visible="false">
                                <!-- Start Main Slider Div -->
                                <div id="mainslider" class="slidecontent">
                                    <div class="preload">
                                    </div>
                                    <!-- Start Main Stories Div -->
                                    <div class="main_container">
                                        <!-- UL List Content -->
                                        <span style="font-size: 18px;">Featured Products</span>
                                        <ul class="wrapper">
                                            <asp:PlaceHolder ID="phlFeaturedProducts" runat="server"></asp:PlaceHolder>
                                        </ul>
                                        <!-- UL List Content -->
                                    </div>
                                    <!-- End Main Stories Div -->
                                    <!-- Start Navigation Div -->
                                    <div class="nav_wrap">
                                        <div id="next" onclick="return false" class="previous">
                                            Previous</div>
                                        <div class="navigator_menu">
                                            <ul class="nav_list">
                                                <!-- You must add a new instance of an li/spacer item for an additonal story -->
                                                <li>
                                                    <img src="/img/spacer.gif" alt="" width="15" height="15" border="0" /></li>
                                                <li>
                                                    <img src="/img/spacer.gif" alt="" width="15" height="15" border="0" /></li>
                                                <li>
                                                    <img src="/img/spacer.gif" alt="" width="15" height="15" border="0" /></li>
                                                <li>
                                                    <img src="/img/spacer.gif" alt="" width="15" height="15" border="0" /></li>
                                                <li>
                                                    <img src="/img/spacer.gif" alt="" width="15" height="15" border="0" /></li>
                                                <li>
                                                    <img src="/img/spacer.gif" alt="" width="15" height="15" border="0" /></li>
                                                <li>
                                                    <img src="/img/spacer.gif" alt="" width="15" height="15" border="0" /></li>
                                                <li>
                                                    <img src="/img/spacer.gif" alt="" width="15" height="15" border="0" /></li>
                                                <li>
                                                    <img src="/img/spacer.gif" alt="" width="15" height="15" border="0" /></li>
                                                <li>
                                                    <img src="/img/spacer.gif" alt="" width="15" height="15" border="0" /></li>
                                            </ul>
                                        </div>
                                        <div id="previous" onclick="return false" class="next">
                                            Next</div>
                                    </div>
                                    <!-- End Navigation Div -->
                                </div>
                                <!-- End Main Slider Div -->
                            </asp:Panel>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">
                            <div style="position: relative; top: 0px; left: 0px; z-index: 1; height: 650px">
                                <img src="img/blackboard.gif" width="550" height="675" />
                                <div style="position: relative; top: -600px; left: 20px; z-index: 2; width: 532px;
                                    height: 446px; font-family: Comic Sans MS;">
                                    <table border="0" style="color: White;text-align:center" width="500" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td>  
                                                <span style="font-size: x-large;">Welcome to The Teacher's Spot</span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                The Teacher’s Spot provides discounts on teacher resources, <br />specialty items, centers
                                                to go, children’s books and more.
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center" >
                                                <table cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td >
                                                            <br />
                                                            <%--<span style="font-size: x-large;">--%>
                                                            <div style="font-size: 16pt; text-align:center;"><span style="color: Red;">Teachers</span> · <span
                                                                style="color: Yellow;">Parents</span> <br /> <span style="color: Blue;">Homeschoolers</span>
                                                                · <span style="color: Green;">Educators</span> </div>
                                                            <br />
                                                            <br />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td >
                                                You will find discounts on:</td>
                                        </tr>
                                        <tr>
                                            <td  align="center">
                                                <table width="75%" cellpadding="0" cellspacing="0" style="text-align:center">
                                                    <tr>
                                                        <td>
                                                            Children’s Books</td>
                                                        <td>
                                                            Math & LA Workbooks</td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            T-Shirts</td>
                                                        <td>
                                                            Specialty Items</td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            Teaching Resources</td>
                                                        <td>
                                                            Books of Black Interest</td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            Literacy Centers</td>
                                                        <td>
                                                            Spanish Books</td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            File Folders</td>
                                                        <td>
                                                            Easy Readers</td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2" align="center">
                                                            And More...</td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td  align="center" >
                                                <br />
                                                Don’t see what you’re looking for? Contact Us:<br />
                                                <a style="color: White;" href="mailto:CustomerService@TheTeachersSpot.com">CustomerService@TheTeachersSpot.com</a><br />
                                                The Teacher’s Spot<br />
                                                P.O. Box 691<br />
                                                Rahway, NJ 07065<br />
                                                732-259-5582<br />
                                                732-574-0566 (fax)<br />
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </td>
                    </tr>
                </table>
            </td>
            <td valign="top">
                <div id="ads">
                    <br />
                    <a href="http://www.teacherspayteachers.com/Store/Mrs-Moorehead" title="Free Downloads"
                        alt="TTS Workshops" target="_blank">
                        <img src="/img/free downloads_sm.JPG" width="200px"  />
                    </a>
                    <br />
                    <br />
<%--                    <a href="/test.aspx" title="TTS Workshops"
                        alt="TTS Workshops" target="_blank">
                        <img src="/img/TPT Cover.JPG" width="200px" height="250px" />
                    </a>
                    <br />
                    <br />--%>
                    <a href="http://www.ttsworkshops.com" title="TTS Workshops"
                        alt="TTS Workshops" target="_blank">
                        <img src="/img/advertisers/ClickForWorkshops.JPG" />
                    </a>
                    <br />
                    <br />                
                    <a href="http://www.fireflykidz.org/" title="The Firefly Foundation" alt="The Firefly Foundation"
                        target="_blank">
                        <img src="/img/advertisers/fireflylogo2.JPG" />
                    </a>
                </div>
            </td>
        </tr>
    </table>

    <script language="javascript">Blink('prem_hint');</script>

</asp:Content>

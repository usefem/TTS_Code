<%@ Page Language="C#" AutoEventWireup="true" Inherits="TTS.CouponCodes" MasterPageFile="~/layout/Admin_layout.master"
    CodeBehind="CouponCodes.aspx.cs" %>

<%@ MasterType VirtualPath="~/layout/Admin_layout.master" %>
<asp:Content ContentPlaceHolderID="cphHeaderSection" runat="server" ID="cHearder">
    <link href="../css/theme.css" rel="stylesheet" type="text/css" />
<%--    <link href="../css/site.css" rel="stylesheet" type="text/css" />--%>
    <link href="../css/pikaday.css" rel="stylesheet" type="text/css" />
    <script src="../js/moment.js" type="text/javascript"></script>
    <script src="../pikaday.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ContentPlaceHolderID="MainContent" runat="server" ID="cMain">
    <asp:HiddenField runat="server" ID="hidCouponID" />
    <div id="editCoupon">
        <table style="margin: 0 auto;">
            <tr>
                <td colspan="2">
                    <asp:Label Text="" ID="lblErrMsg" ForeColor="Red" Font-Size="14pt" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="labelTD">
                    <span style="color:Red">* </span>Coupon Code
                </td>
                <td class="inputTD">
                    <asp:TextBox ID="txtCouponCode" runat="server" Width="200"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="labelTD">
                    <span style="color:Red">* </span>Coupon Name
                </td>
                <td class="inputTD">
                    <asp:TextBox ID="txtCouponName" runat="server" Width="200"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="labelTD">
                    Coupon Description
                </td>
                <td class="inputTD">
                    <asp:TextBox ID="txtCouponDesc" runat="server" Width="300"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="labelTD">
                    <span style="color:Red">* </span>Coupon Discount
                </td>
                <td class="inputTD">
                    <asp:TextBox ID="txtCouponDiscount" runat="server" Width="100"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="labelTD">
                    <span style="color:Red">* </span>Start Date
                </td>
                <td class="inputTD">
                    <asp:TextBox  ID="txtStartDate"  runat="server" Width="200"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="labelTD">
                    <span style="color:Red">* </span>End Date
                </td>
                <td class="inputTD">
                    <asp:TextBox ID="txtEndDate" runat="server" Width="200"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="2"><span style="color:Red">* = Required field</span></td>
            </tr>
            <tr>
                <td style="text-align: center">
                    <asp:Button Text="Save Coupon" ID="btnSave" runat="server" Font-Size="16px" OnClick="btnSave_Click" />
                </td>
            </tr>
        </table>
    </div>
    <div id="divCouponList" style="margin: 25px auto; width: 1000px">
        <asp:GridView runat="server" ID="gvCouponList" CellPadding="4" EnableModelValidation="True"
            ForeColor="#333333" GridLines="None" AutoGenerateColumns="false" OnRowCommand="gvCouponList_RowCommand"
            OnRowCancelingEdit="gvCouponList_RowCancelingEdit" OnRowEditing="gvCouponList_RowEditing">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:TemplateField HeaderText="Coupon ID" Visible="true">
                    <ItemTemplate>
                        <asp:LinkButton Text="Edit" CommandName="Edit" runat="server" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Coupon ID" Visible="false">
                    <ItemTemplate>
                        <asp:Label ID="lblCodeID" runat="server" Text='<%# Bind("CouponID") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Coupon Code"  ControlStyle-Width="150px">
                    <ItemTemplate>
                        <asp:Label ID="lblCode" runat="server" Text='<%# Bind("szCouponCode") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Coupon Name"  ControlStyle-Width="150px">
                    <ItemTemplate>
                        <asp:Label ID="lblName" runat="server" Text='<%# Bind("szCouponName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Description">
                    <ItemTemplate>
                        <asp:Label ID="lblDesc" runat="server" Text='<%# Bind("szDescription") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Discount"  ControlStyle-Width="150px">
                    <ItemTemplate>
                        <asp:Label ID="lblDiscount" runat="server" Text='<%# Bind("fDiscount") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Start Date" ControlStyle-Width="150px">
                    <ItemTemplate>
                        <asp:Label ID="lblStartDt" runat="server" Text='<%# Eval("dtStartDate", "{0:M/dd/yyyy}")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="End Date" ControlStyle-Width="150px">
                    <ItemTemplate>
                        <asp:Label ID="lblEndDate" runat="server" Text='<%# Eval("dtEndDate", "{0:M/dd/yyyy}") %>'></asp:Label>
                        
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        </asp:GridView>
    </div>
    <script type="text/javascript">
        var picker1 = new Pikaday(
        {
            field: document.getElementById('<%=txtStartDate.ClientID%>'),
            firstDay: 1,
            minDate: new Date('2015-01-01'),
            maxDate: new Date('2030-12-31'),
            yearRange: [2015, 2030],
            numberOfMonths: 2, theme: 'dark-theme',
            format: 'M/D/YYYY',
            onSelect: function () {
                var date = document.createTextNode(this.getMoment().format('M/D/YYYY') + ' ');
                
            }
        });

        var picker2 = new Pikaday(
        {
            field: document.getElementById('<%=txtEndDate.ClientID%>'),
            firstDay: 1,
            minDate: new Date('2015-01-01'),
            maxDate: new Date('2030-12-31'),
            yearRange: [2015, 2030],
            numberOfMonths: 2, theme: 'dark-theme',
            format: 'M/D/YYYY',
            onSelect: function () {
                var date = document.createTextNode(this.getMoment().format('M/D/YYYY') + ' ');

            }
        }); 
     
     </script>
</asp:Content>

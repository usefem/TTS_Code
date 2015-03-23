<%@ Page Language="C#" AutoEventWireup="true" Inherits="TTS.ProductMaintenance" MasterPageFile="~/layout/Admin_layout.master"
    Codebehind="ProductMaintenance.aspx.cs" %>

<%@ MasterType VirtualPath="~/layout/Admin_layout.master" %>
<asp:Content ContentPlaceHolderID="MainContent" runat="server" ID="cMain">
    <table cellpadding="10px" border="0">
        <tr>
            <td style="width: 30%" valign="top">
                <div style="text-align: center">
                    <asp:Button runat="server" ID="btnSelProduct" CausesValidation="false" Text="Edit Product"
                        OnClick="btnSelProduct_Click" />&nbsp;&nbsp;&nbsp;&nbsp; <b>All Products</b>&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button runat="server" ID="butNewProduct" CausesValidation="false" Text="Create New Product"
                        OnClick="btnNewProduct_Click" Visible="true" />
                </div>
                <asp:ListBox Width="400" runat="server" ID="lstProducts" Rows="15"></asp:ListBox>
                <div style="text-align: center">
                    <br />
                </div>
            </td>
            <td valign="top">
                <asp:Button runat="server" ID="butSaveProduct" Text="Save Product" OnClick="butSaveProduct_Click" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <a href="main.aspx">Return to Admin Menu</a>
                <div>
                    <asp:Label runat="server" ID="lblMsg" Font-Bold="true" Font-Size="large" />
                </div>
                <div style="border: dashed 0px black">
                    <table>
                        <tr>
                            <td>
                                Product 
                            </td>
                            <td>
                                <asp:TextBox runat="server" ID="txtProdName" Width="300px"></asp:TextBox></td>
                            <td>
                                <asp:RequiredFieldValidator runat="server" ID="rfvProdName" ControlToValidate="txtProdName"
                                    ErrorMessage="*" ForeColor="red"></asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td> Product ID
                            </td>
                            <td><asp:Label BackColor="Beige" Width="100px"  runat="server" ID="lblProdId" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Item Num.
                            </td>
                            <td>
                                <asp:TextBox runat="server" ID="txtItemNum" Width="300px"></asp:TextBox></td>
                            <td>
                                <asp:RequiredFieldValidator runat="server" ID="rfvItemNumber" ControlToValidate="txtItemNum"
                                    ErrorMessage="*" ForeColor="red"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Price
                            </td>
                            <td>
                                <asp:TextBox runat="server" ID="txtPrice" Width="30px"></asp:TextBox>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Image Name
                            </td>
                            <td>
                                <asp:TextBox runat="server" ID="txtImageName" Width="300px"></asp:TextBox></td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Weight
                            </td>
                            <td>
                                <asp:TextBox runat="server" ID="txtWeight" Width="30px"></asp:TextBox></td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                Quantity
                            </td>
                            <td>
                                <asp:TextBox runat="server" ID="txtQty" Width="30px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator runat="server" ID="rfvQty" ControlToValidate="txtQty"
                                    ErrorMessage="*" ForeColor="red"></asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td>
                                Product Desc
                            </td>
                            <td colspan="2">
                                <asp:TextBox ID="txtProdDesc" runat="server" TextMode="MultiLine" MaxLength="3000"
                                    Wrap="true" Rows="6" Width="425"></asp:TextBox>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                Sizes
                            </td>
                            <td>
                                <asp:TextBox ID="txtSizes" runat="server" MaxLength="50" Width="300px"></asp:TextBox>
                            </td>
                            <td>
                                Small|Medium|XL</td>
                        </tr>
                        <tr>
                            <td>
                                Colors
                            </td>
                            <td >
                                <asp:TextBox ID="txtColors" runat="server" MaxLength="100" Width="300px"></asp:TextBox>
                            </td>
                            <td>
                                Red|Blue</td>
                        </tr>
                        
                        <tr>
                            <td>
                                Video Path
                            </td>
                            <td  colspan="2">
                                <asp:TextBox ID="txtVideoPath" runat="server" MaxLength="100" Width="300px"></asp:TextBox>
                            </td>
                        </tr>                        
                        <tr>
                            <td>
                                Video Title
                            </td>
                            <td  colspan="2">
                                <asp:TextBox ID="txtVideoTitle" runat="server" MaxLength="150" Width="300px"></asp:TextBox>
                            </td>
                        </tr>                          
                        <tr>
                            <td colspan="3">
                                <asp:HiddenField runat="server" ID="hdnProductID" />
                            </td>
                        </tr>
                        <tr>
                            <td>Small Image</td>
                            <td>Large Image</td>
                        </tr>
                        <tr>
                            <td valign="top">
                                <asp:Image runat="server" ID="imgSmall" Visible="false" />
                            </td>
                            <td colspan="2" valign="top">
                                <asp:Image runat="server" ID="imgLarge" Width="400px" Visible="false" />
                            </td>
                        </tr>
                    </table>
                </div>
                <br />
                <br />
                <div style="text-align: left">
                </div>
            </td>
        </tr>
    </table>
</asp:Content>

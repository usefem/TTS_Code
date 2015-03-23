using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Text;

namespace TTS
{
    public partial class ProductDetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataSet ds;
            DataAccess da = new DataAccess();

            if (Request.QueryString["ProdID"] != null)
            {
                ds = da.GetProductsByID(Convert.ToInt32(Request.QueryString["ProdID"]));

                if (ds != null && ds.Tables[0] != null && ds.Tables[0].Rows.Count > 0)
                {
                    DataTable dt;
                    dt = ds.Tables[0];
                    //if (dt.Rows[0]["iQuanity"].ToString() != "0" && !string.IsNullOrEmpty(dt.Rows[0]["iQuanity"].ToString()))
                    //{
                    imgProd.Src = string.Concat("img/products/", dt.Rows[0]["sImageName"].ToString());
                    lblProdName.Text = dt.Rows[0]["sProdName"].ToString();
                    lblItemNo.Text = dt.Rows[0]["sItemNo"].ToString();

                    lblPrice.Text = DisplayPrice(dt.Rows[0]["dPrice"].ToString());

                    lblProdDesc.Text = dt.Rows[0]["sLongDesc"].ToString();

                    if (dt.Rows[0]["sProdName"] != null && dt.Rows[0]["sVideoPath"].ToString() != string.Empty)
                    {
                        litVideoLink.Text = string.Format("<br/><br/><a class='video' href='{0}' title='{1}'>Product Video</a>", dt.Rows[0]["sVideoPath"].ToString(), dt.Rows[0]["sVideoTitle"].ToString() == string.Empty ? dt.Rows[0]["sProdName"].ToString() : dt.Rows[0]["sVideoTitle"].ToString());
                    }

                    if (dt.Rows[0]["iQuanity"].ToString() != "0" && !string.IsNullOrEmpty(dt.Rows[0]["iQuanity"].ToString()))
                    {
                        PPForm(dt.Rows[0]["sProdName"].ToString(), dt.Rows[0]["sItemNo"].ToString(), dt.Rows[0]["dPrice"].ToString(), dt.Rows[0]["iWeight"].ToString(), dt.Rows[0]["sSizes"].ToString(), dt.Rows[0]["sColors"].ToString());
                    }
                    else
                    {
                        lblOutofStockMsg.Visible = true;
                        pnlForm.Visible = false;
                    }

                    this.Master.PageTitle = dt.Rows[0]["sProdName"].ToString();
                    this.Master.MetaDescription = dt.Rows[0]["sLongDesc"].ToString();
                    this.Master.MetaTag = "<meta name=\"robots\" content=\"index,follow\" /> ";
                    //}
                    //else
                    //{
                    //pnlShowProduct.Visible = false;
                    //pnlNoProduct.Visible = true;
                    //litMessage.Text = string.Format("<b>{0}</b>:  Sorry, this item is out of stock.", dt.Rows[0]["sProdName"].ToString());
                    this.Master.MetaTag = "<meta name=\"robots\" content=\"noindex,follow\" /> ";
                    //}
                }
                else
                {
                    //no data
                    pnlShowProduct.Visible = false;
                    pnlNoProduct.Visible = true;
                    litMessage.Text = string.Format("Product Id #{0} is not a valid product id.", Request.QueryString["ProdID"].ToString());
                    this.Master.MetaTag = "<meta name=\"robots\" content=\"noindex,follow\" /> ";
                }
            }
            else
            {
                //invalid prod id
                this.Master.MetaTag = "<meta name=\"robots\" content=\"noindex,follow\" /> ";
            }
        }

        private string DisplayPrice(string sPrice)
        {
            string origPrice = sPrice;
            double dPrice;
            Coupon c = new Coupon();
            if (c.isValid)
            {
                sPrice = c.DiscountPrice(sPrice).ToString();
                dPrice = Convert.ToDouble(sPrice);
                return string.Format("<div id='priceOrig'>${0}</div><div>coupon price</div><div>${1}</div>", origPrice, dPrice.ToString("0.00"));
            }
            else
            {
                return "$" + sPrice;
            }
        }


        private void PPForm(string sName, string sItemNo, string sPrice, string sWeight,
             string sSizes, string sColors)
        {
            pnlForm.Visible = true;
            StringBuilder sbString = new StringBuilder();
            sbString.Append("<form></form>");
            sbString.Append("<form target='paypal' action='https://www.paypal.com/cgi-bin/webscr' method='post'>");
            sbString.Append("<input type='hidden' name='add' value='1' />");
            sbString.Append("<input type='hidden' name='cmd' value='_cart' />");
            sbString.Append("<input type='hidden' name='business' value='paypal@theteachersspot.com' />");
            sbString.AppendFormat("<input type='hidden' name='item_name' value='{0}'/>", sName);
            sbString.AppendFormat("<input type='hidden' name='item_number' value='{0}'/>", sItemNo);

            Coupon c = new Coupon();
            if (c.isValid)
            {
                sbString.AppendFormat("<input type='hidden' name='amount' value='{0}' />", c.DiscountPrice(sPrice).ToString());
                sbString.Append("<input type='hidden' name='on2' value='Coupon'>");
                sbString.AppendFormat("<input type='hidden' name='os2' value='{0}'>", c.Code);
            }
            else
            {
                sbString.AppendFormat("<input type='hidden' name='amount' value='{0}' />", sPrice);
            }



            if (sSizes.Length > 0)
            {
                sbString.Append("<table border='0'><tr><td>");
                sbString.Append("<input type='hidden' name='on0' value='Size'>Size</td>");
                sbString.Append("<td><select name='os0'><option value='Select a Size'>Select a Size");
                sbString.Append(LoadDropDown(sSizes));
                sbString.Append("</select></td></tr></table>");
            }

            if (sColors.Length > 0)
            {
                sbString.Append("<table border='0'><tr><td>");
                sbString.Append("<input type='hidden' name='on1' value='Color'>Color</td>");
                sbString.Append("<td><select name='os1'><option value='Select a Color'>Select a Color");
                sbString.Append(LoadDropDown(sColors));
                sbString.Append("</select></td></tr></table>");

            }

            sbString.Append("<input type='image' src='https://www.paypal.com/en_US/i/btn/btn_cart_SM.gif' name='submit'");
            sbString.Append(" alt='Make payments with PayPal - it`s fast, free and secure!' />");
            sbString.Append("<img alt='' src='https://www.paypal.com/en_US/i/scr/pixel.gif' width='1' height='1' />");

            sbString.Append("<input type='hidden' name='no_shipping' value='2' />");
            sbString.Append("<input type='hidden' name='return' value='http://www.theteachersspot.com/ThankYou.aspx' />");
            sbString.Append("<input type='hidden' name='cancel_return' value='http://www.theteachersspot.com' />");
            sbString.Append("<input type='hidden' name='currency_code' value='USD' />");
            sbString.AppendFormat("<input type='hidden' name='weight' value='{0}'/>", sWeight);
            sbString.Append("<input type='hidden' name='weight_unit' value='lbs' />");
            sbString.Append("<input type='hidden' name='lc' value='US' />");
            sbString.Append("<input type='hidden' name='bn' value='PP-ShopCartBF' />");
            sbString.Append("</form>");

            litPayPalForm.Text = sbString.ToString();

            //'write the submit fields in ecommerce acceptable fields
            //sbString.Append("<form target='paypal' action='https://www.paypal.com/cgi-bin/webscr' method='post'>");
            //sbString.Append("<input type='hidden' name='cmd' value='_cart' />");
            //sbString.Append("<input type='hidden' name='business' value='nojoke6@aol.com' />");
            //sbString.Append("<input type='image' src='https://www.paypal.com/en_US/i/btn/btn_viewcart_LG.gif'");
            //sbString.Append("name='submit' alt='Make payments with PayPal - it`s fast, free and secure!' />");
            //sbString.Append("<input type='hidden' name='display' value='1' />");
            //sbString.Append("</form><script language=javascript>document.order.submit();</script>");

            ////'write the submit fields to page
            //LiteralControl lit = new LiteralControl();
            //lit.Text = sbString.ToString();
            //pnlForm.Controls.Add(lit);
        }

        private string LoadDropDown(string Options)
        {
            //<option value='Small'>Small<option value='Medium'>Medium<option value='Large'>Large
            StringBuilder sbChoices = new StringBuilder();

            string[] choices = Options.Split('|');

            foreach (string choice in choices)
            {
                sbChoices.AppendFormat("<option value='{0}'>{0}", choice);
            }

            return sbChoices.ToString();
        }
    }
}
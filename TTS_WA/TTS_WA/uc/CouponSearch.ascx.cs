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


 public partial class uc_CouponSearch : System.Web.UI.UserControl
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (ConfigurationManager.AppSettings["couponOn"].ToString().ToUpper() == "YES")
                {
                    plnCoupon.Visible = true;
                }
                else
                {
                    plnCoupon.Visible = false;
                }
            }

            TTS.Coupon c = new TTS.Coupon();
            if (c.Message.Length > 0)
            {
                lblCouponMsg.Text = "<br/>&nbsp;&nbsp;&nbsp;" + c.Message;
            }
        }

        protected void btnCouponSubmit_Click(object sender, EventArgs e)
        {
            if (txtCouponCode.Text.Length > 0)
            {
                TTS.Coupon c = new TTS.Coupon(txtCouponCode.Text);

                if (!c.isValid)
                {
                    if (c.Message.Length > 0)
                    {
                        lblCouponMsg.Text = "<br/>&nbsp;&nbsp;&nbsp;" + c.Message;
                    }
                }
                else
                {
                    Response.Redirect(Request.RawUrl);
                }

            }
        }
    }

using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;


namespace TTS
{

    /// <summary>
    /// Summary description for Coupon
    /// </summary>
    public class Coupon
    {
        private string _Code = String.Empty;
        private bool _isValid = false;
        private double _discount = 1.0;
        private string _message = String.Empty;

        public string Code
        {
            get { return HttpContext.Current.Request.Cookies["coupon"]["code"].ToString(); }
            set {_Code = value; }
        }

        public bool isValid
        { 
            get {return _isValid;}
            set {_isValid = value; }
        }

        public double Discount
        {
            get { return _discount; }
            set { _discount = value; }
        }
        public string Message
        {
            get { return _message; }
            set { _message = value; }
        }

        public Coupon()
        {
            //
            // TODO: Add constructor logic here
            //
            isValid = CheckForCookie();

        }
        
        public Coupon(string Code)
        {
            //
            // TODO: Add constructor logic here
            //

            LookUpCoupon(Code);
        }


        private bool CheckForCookie()
        {
            if (HttpContext.Current.Request.Cookies["coupon"] != null)
            {
                Discount = Convert.ToDouble(HttpContext.Current.Request.Cookies["coupon"]["discount"].ToString());
                 
                Message = "Coupon code " + Code + " has been entered. " + (Discount * 100) + "% off on all products.";
                return true;
            }
            else
            {
                return false;
            }
        }

        private void LookUpCoupon(string sCode)
        {
            DataAccess da = new DataAccess();
            DataSet ds;
            DataTable dt;


            ds = da.GetCouponByCode(sCode);
            dt = ds.Tables[0];
            //Write Cookie
            if (dt.Rows.Count > 0)
            {
                if (DateTime.Now.Date > Convert.ToDateTime(dt.Rows[0]["dtStartDate"].ToString()).Date && Convert.ToDateTime(dt.Rows[0]["dtEndDate"].ToString()).AddDays(1).Date > DateTime.Now.Date)
                {

                    this.Code = sCode;
                    this.Discount = Convert.ToDouble(dt.Rows[0]["fDiscount"].ToString());

                    HttpCookie cookie = new HttpCookie("coupon");
                    cookie["code"] = sCode;
                    cookie["valid"] = "true";
                    cookie["discount"] = ds.Tables[0].Rows[0]["fDiscount"].ToString();
                    cookie.Expires = DateTime.Now.AddMinutes(120);

                    HttpContext.Current.Response.Cookies.Add(cookie);

                    Message = "Coupon valid - Expires on " + Convert.ToDateTime(dt.Rows[0]["dtEndDate"].ToString()).ToShortDateString();
                }
                else
                {

                    if (Convert.ToDateTime(dt.Rows[0]["dtEndDate"].ToString()).AddDays(1).Date < DateTime.Now.Date)
                    {
                        Message = "Coupon expired on " + Convert.ToDateTime(dt.Rows[0]["dtEndDate"].ToString()).ToShortDateString();
                    }
                    if (DateTime.Now.Date < Convert.ToDateTime(dt.Rows[0]["dtStartDate"].ToString()).Date)
                    {
                        Message = "Coupon not good until " + Convert.ToDateTime(dt.Rows[0]["dtStartDate"].ToString()).ToShortDateString();
                    }
                }
            }
            else 
            {
                Message = "Invalid coupon code.";
            }
            isValid = CheckForCookie();
        }


        public double DiscountPrice(string orgPrice)
        {
            double newPrice;
            newPrice = Convert.ToDouble((Convert.ToDouble(orgPrice) * (1 - this.Discount)).ToString("0.00"));
            return newPrice;
        }

    }
}
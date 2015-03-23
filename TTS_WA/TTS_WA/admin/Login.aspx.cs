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

public partial class admin_Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        txtUid.Focus();
    }

    protected void cmdSubmit_Click(object sender, System.EventArgs e)
    {
        if (txtUid.Text == ConfigurationManager.AppSettings["userid"].ToString() &&
                txtPwd.Text == ConfigurationManager.AppSettings["pwd"].ToString())
        {
            //write the cookie
            HttpCookie cookie = new HttpCookie("tts");
            cookie.Values["valid"] = "true";
            cookie.Values["counter"] = "0";
            cookie.Expires = DateTime.Now.AddHours(4);
            Response.Cookies.Add(cookie);
            Response.Redirect("../admin/main.aspx");
        }
        else
        {
            //set cookie counter
            if (Request.Cookies["tts"] == null)
            {
                Response.Cookies["tts"]["counter"] = "1";
                Response.Cookies["tts"]["valid"] = "false";
                Response.Cookies["tts"].Expires = DateTime.Now.AddHours(4);
            }
            else
            {
                string sFailCnt;
                sFailCnt = Request.Cookies["tts"]["counter"].ToString();
                Response.Cookies["tts"]["counter"] = Convert.ToString(Convert.ToInt16(sFailCnt) + 1);
                Response.Cookies["tts"]["valid"] = "false";
                Response.Cookies["tts"].Expires = DateTime.Now.AddHours(4);
            }
        }    
    }
}

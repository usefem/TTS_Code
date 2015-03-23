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

namespace TTS_WA
{
    public partial class testpage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (ConfigurationManager.AppSettings["UseTestPage"].ToString().ToLower() == "yes")
            {
                int x = 0;
                int y = 5 / x;
            }
            else
            {
                Response.Redirect("/default.aspx");
            }
        }
    }
}

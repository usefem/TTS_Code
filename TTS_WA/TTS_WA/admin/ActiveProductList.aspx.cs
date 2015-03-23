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


namespace TTS
{
    public partial class ActiveProductList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.Cookies["tts"] == null)
                {
                    Response.Redirect("../admin/login.aspx");
                }
            }

            DataAccess da = new DataAccess();
            DataSet ds;
            ds = da.GetAllProducts();

            dlProducts.DataSource = ds.Tables[0];
            dlProducts.DataBind();
        }
    }
}

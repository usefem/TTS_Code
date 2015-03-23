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

public partial class uc_ProductSearch : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
        //if (txtSeachText.Text.Length > 2)
        //{
        //    Response.Redirect("Products.aspx?searchtext=" + txtSeachText.Text);
        //}
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (txtSeachText.Text.Length > 2)
        {
            Response.Redirect("Products.aspx?searchtext=" + Server.HtmlEncode(txtSeachText.Text));
        }
    
    }
}

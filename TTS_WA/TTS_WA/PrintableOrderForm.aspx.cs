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


namespace TTS
{
    public partial class PrintableOrderForm : System.Web.UI.Page
    {
        public string GetDateStr
        {
            get { return DateTime.Today.Date.ToLongDateString(); }

        }
        protected void Page_Load(object sender, EventArgs e)
        {
            //CreateProductTable();
            //InsertProducts();

            DataAccess da = new DataAccess();
            DataSet ds;
            ds = da.GetAllProducts();

            dlProducts.DataSource = ds.Tables[0];
            dlProducts.DataBind();

            this.Master.PageTitle = "Printable order form and product list";
            this.Master.MetaDescription = "See our current product list and print out an order form that you can fax back to us.";
            this.Master.MetaTag = "<meta name=\"robots\" content=\"index,follow\" /> ";

        }
    }
}
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


namespace TTS.layout
{

    public partial class layout_MasterPage2 : System.Web.UI.MasterPage
    {

        public string GetDateStr
        {
            get { return DateTime.Today.Date.ToLongDateString(); }

        }
        
        public string MetaTag
        {
            set { litMetaTag.Text = value; }

        }

        public string MetaDescription
        {
            set { litMetaDesc.Text = string.Format("<meta name='description' content='{0}' />", value); }

        }

        public string PageTitle
        {
            set { litTitle.Text = string.Format("<title>The Teacher's Spot - {0}</title>", value); }

        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }


    }
}
using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using TTS.uc;

namespace TTS
{
    public partial class _Default : System.Web.UI.Page
    {
        public string sMarquee = string.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {

            this.Master.PageTitle = "Home page";
            this.Master.MetaDescription = "The Teacher’s Spot provides discounts on teacher resources, specialty items, file folders, centers to go, children’s books and more.";
            //this.Master.MetaTag = "<meta name='verify-v1' content='9Yzg2bYamMDRSgj9Pf/vxGrmI43quM2h+RSXvCftySU=' />";
            this.Master.MetaTag = "<meta name=\"robots\" content=\"index,follow\" />  <meta name='verify-v1' content='9Yzg2bYamMDRSgj9Pf/vxGrmI43quM2h+RSXvCftySU=' />";
            sMarquee = ConfigurationManager.AppSettings["Marquee"].ToString();

            //Load featured products carousel
            DataAccess da = new DataAccess();
            DataSet ds = da.GetFeaturedProducts();

            if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                FeaturedProducts fp = (FeaturedProducts)LoadControl("/uc/FeaturedProducts.ascx");

                foreach (DataRow dr in ds.Tables[0].Rows)
                {
                    fp = (FeaturedProducts)LoadControl("/uc/FeaturedProducts.ascx");
                    fp.ProdName = dr["sProdName"].ToString();
                    fp.ProductId = dr["iproductid"].ToString().Trim();
                    fp.ProdDesc = dr["sLongDesc"].ToString();
                    fp.Price = dr["dPrice"].ToString();
                    fp.ItemNumber = dr["sItemNo"].ToString();
                    fp.ProdImageName = dr["sImageName"].ToString();
                    //fp.FeatWidth = 600;
                    //fp.ProdImageName = "Blend Cards.jpg";
                    phlFeaturedProducts.Controls.Add(fp);
                    pnlFeaturedProd.Visible = true;
                }
            }
            else
            {
                pnlFeaturedProd.Visible = false;
            }

        }
    }

}

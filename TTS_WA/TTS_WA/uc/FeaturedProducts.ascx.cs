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

namespace TTS.uc
{
    public partial class FeaturedProducts : System.Web.UI.UserControl
    {
        private string _ProdName;
        private string _ItemNumber;
        private string _ProductId;
        private string _ProdImageName;
        private string _ProdDesc;
        private string _Price;

        //private int _FeatWidth;

        //public int FeatWidth
        //{
        //    get { return _FeatWidth; }
        //    set { _FeatWidth = value; }
        //}

        public string ProdName {
            get { return _ProdName; }
            set{ _ProdName = value; }
        }

        public string ItemNumber
        {
            get { return _ItemNumber; }
            set { _ItemNumber = value; }
        }
        public string ProdImageName
        {
            get { return _ProdImageName; }
            set { _ProdImageName = value; }
        }

        public string ProdDesc
        {
            get { return _ProdDesc; }
            set { _ProdDesc = value; }
        }

        public string Price
        {
            get { return _Price; }
            set { _Price = value; }
        }

        public string ProductId
        {
            get { return _ProductId; }
            set { _ProductId = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            //this.ProdName = "test";
            //if (FeatWidth == 0)
            //{
            //    imgFeatSpacer.Width = 600;
            //    tblFeatProd.Width = "600px";
            //}
            //else
            //{
            //    imgFeatSpacer.Width = FeatWidth;
            //    tblFeatProd.Width = FeatWidth.ToString() + "px";            
            //}

            //ProdName = "100 Words by 1st grade good.jpg";
        }

        protected string BriefDesc(string LongDesc, string sProdID)
        {
            string sTempTrim;
            string sTemp;

            sTempTrim = LongDesc.TrimEnd();

            if (sTempTrim.Length > 200 && sTempTrim.Length > 250)
            {
                sTemp = sTempTrim.Substring(0, sTempTrim.IndexOf(" ", 200, 20));
                sTemp = string.Concat(sTemp, "... <a href='ProductDetail.aspx?ProdId=", sProdID, "'><span style='color:red'> MORE</span></a>");
            }
            else
            {
                sTemp = sTempTrim;
            }
            return sTemp;
        }
    }
}
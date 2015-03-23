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
    public partial class ProductTypes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.Cookies["tts"] == null)
                {
                    Response.Redirect("../admin/login.aspx");
                }

                DataAccess da = new DataAccess();
                DataSet ds;

                ds = da.GetAllProducts_Admin();

                lstProducts.DataSource = ds.Tables[0];
                lstProducts.DataTextField = "sProdName";
                lstProducts.DataValueField = "iProductId";

                lstProducts.DataBind();

            }
        }

        protected void btnSelProduct_Click (object sender, System.EventArgs e)
        {
            int ProdID = Convert.ToUInt16(lstProducts.SelectedValue);

            lblProductName.Text = lstProducts.SelectedItem.Text;

            LoadProdTypes(ProdID);

        }

        protected void lstProducts_Change(object sender, System.EventArgs e)
        {
            int ProdID = Convert.ToUInt16(lstProducts.SelectedValue);

            lblProductName.Text = lstProducts.SelectedItem.Text;

            LoadProdTypes(ProdID);        
        }

        protected void btnSaveTypes_Click(object sender, System.EventArgs e)
        {
            DataAccess da = new DataAccess();
            int ProdID = Convert.ToUInt16(lstProducts.SelectedValue);

            //delete existing products types
            da.DelProductTypesByProdID_Admin(ProdID);

            //add new prod types
            foreach (ListItem lstItem in cblProdTypes.Items)
            {
                if (lstItem.Selected)
                { 
                    da.InsProductTypeByProdID_Admin(ProdID, Convert.ToInt32(lstItem.Value));
                }
            }
            
            LoadProdTypes(ProdID);
        }



        private void LoadProdTypes(int ProdID)
        {
            ListItem lstList;

            DataAccess da = new DataAccess();
            DataSet ds;

            ds = da.GetTypesByProducts_Admin(ProdID);

            if (ds.Tables[0].Rows.Count > 0)
            {
                cblProdTypes.Items.Clear();
                foreach (DataRow dr in ds.Tables[0].Rows)
                {
                    lstList = new ListItem(dr["sTypeName"].ToString(), dr["iTypeId"].ToString());
                    if (!string.IsNullOrEmpty(dr["iProductTypeid"].ToString()))
                    {
                        lstList.Selected = true;
                    }

                    cblProdTypes.Items.Add(lstList);
                }
            }
        
        }


    }
}
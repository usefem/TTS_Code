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
    public partial class ProductMaintenance : System.Web.UI.Page
    {
        DataAccess da = new DataAccess();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request["__EVENTARGUMENT"] != null && Request["__EVENTARGUMENT"] == "edit")
            {
                GetProduct();
            }
            lstProducts.Attributes.Add("ondblclick", ClientScript.GetPostBackEventReference(lstProducts, "edit")); 

            if (!IsPostBack)
            {
                if (Request.Cookies["tts"] == null)
                {
                    Response.Redirect("../admin/login.aspx");
                }

                Load_ProdList();
            }
            lblMsg.Text = "";
        }

        protected void Load_ProdList()
        {
            lstProducts.Items.Clear();

            DataSet ds;

            ds = da.GetAllProducts_Admin();

            lstProducts.DataSource = ds.Tables[0];
            lstProducts.DataTextField = "ProductPlusID";
            lstProducts.DataValueField = "iProductId";

            lstProducts.DataBind();

            Clear_Inputs();
        }

        protected void Clear_Inputs()
        {
            //hdnProductID.Value = string.Empty;
            txtProdName.Text = "";
            txtProdDesc.Text = "";
            txtItemNum.Text = "";
            txtPrice.Text = "";
            txtImageName.Text = "";
            txtWeight.Text = "";
            txtQty.Text = "0";
            txtColors.Text = "";
            txtSizes.Text = "";
            lblProdId.Text = "";
            txtVideoPath.Text = "";
            txtVideoTitle.Text = "";
        }

        protected void btnSelProduct_Click(object sender, EventArgs e)
        {
            GetProduct();
        }


        protected void btnNewProduct_Click(object sender, EventArgs e)
        {
            Clear_Inputs();
            hdnProductID.Value = string.Empty;
            imgSmall.Visible = false;
            imgLarge.Visible = false;
            lblProdId.Visible = false;
        }

        protected void butSaveProduct_Click(object sender, EventArgs e)
        {
            try
            {
                bool results = da.InsProduct_Admin(txtProdName.Text, txtItemNum.Text, 
                    Convert.ToDouble(txtPrice.Text), txtImageName.Text, 
                    Convert.ToInt16(txtWeight.Text), Convert.ToInt16(txtQty.Text),
                    txtProdDesc.Text, hdnProductID.Value == string.Empty ? 0 : Convert.ToInt32(hdnProductID.Value),
                    txtSizes.Text, txtColors.Text, txtVideoPath.Text, txtVideoTitle.Text);

                if (results)
                {
                    Load_ProdList();
                    if (!string.IsNullOrEmpty(hdnProductID.Value))
                    {
                        lstProducts.SelectedValue = hdnProductID.Value;
                    }
                    lblMsg.Text = "Product successfully updated / added.";
                }
                else
                {
                    lblMsg.Text = "There was an error trying to save the product.";
                }
            }
            catch (Exception ex)
            { lblMsg.Text = ex.Message; }
        }


        protected void GetProduct()
        {
            int ProdID = Convert.ToUInt16(lstProducts.SelectedValue);

            //lblProductName.Text = lstProducts.SelectedItem.Text;

            DataSet ds = da.GetProductsByID(ProdID);

            txtProdName.Text = ds.Tables[0].Rows[0]["sProdName"].ToString();
            txtProdDesc.Text = ds.Tables[0].Rows[0]["sLongDesc"].ToString();
            txtItemNum.Text = ds.Tables[0].Rows[0]["sItemNo"].ToString().Trim();
            txtPrice.Text = ds.Tables[0].Rows[0]["dPrice"].ToString();
            txtImageName.Text = ds.Tables[0].Rows[0]["sImageName"].ToString();
            txtWeight.Text = ds.Tables[0].Rows[0]["iWeight"].ToString();
            txtQty.Text = ds.Tables[0].Rows[0]["iQuanity"].ToString();
            txtSizes.Text = ds.Tables[0].Rows[0]["sSizes"].ToString();
            txtColors.Text = ds.Tables[0].Rows[0]["sColors"].ToString();

            txtVideoPath.Text = ds.Tables[0].Rows[0]["sVideoPath"].ToString();
            txtVideoTitle.Text = ds.Tables[0].Rows[0]["sVideoTitle"].ToString();

            if(!string.IsNullOrEmpty(txtImageName.Text))
            {
                imgSmall.Visible = true;
                imgLarge.Visible = true;
                imgSmall.ImageUrl = "~/img/prodthumbs/" + txtImageName.Text;
                imgLarge.ImageUrl = "~/img/products/" + txtImageName.Text;
            }

            hdnProductID.Value = ProdID.ToString();
            lblProdId.Visible = true;
            lblProdId.Text = ProdID.ToString();
        }


    }
}
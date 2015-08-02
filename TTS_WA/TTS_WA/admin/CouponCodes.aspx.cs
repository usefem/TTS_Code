using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace TTS
{
    public partial class CouponCodes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                RefreshGrid();
            }

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            //if(hidCouponID.Value == "")
            //{
                SaveCoupon();
            //}
            //else
            //{
            //    UpdateCoupon();
            //}


        }

        //private bool UpdateCoupon()
        //{
        //    DataAccess da = new DataAccess();

        //    if (da.InsCoupon_Admin(((hidCouponID.Value == "")? 0 : int.Parse(hidCouponID.Value)), txtCouponCode.Text, txtCouponName.Text, txtCouponDesc.Text, Convert.ToDouble(txtCouponDiscount.Text), Convert.ToDateTime(txtStartDate.Text), Convert.ToDateTime(txtEndDate.Text)))
        //    {
        //        txtCouponCode.Text = "";
        //        txtCouponDesc.Text = "";
        //        txtCouponDiscount.Text = "";
        //        txtCouponName.Text = "";
        //        txtEndDate.Text = "";
        //        txtStartDate.Text = "";
        //        lblErrMsg.Text = "The new code has been saved";
        //        lblErrMsg.ForeColor = System.Drawing.Color.Yellow;

        //        RefreshGrid();

        //        return true;
        //    }
        //    else
        //    {
        //        lblErrMsg.Text = "There's been an error saving your data.";
        //        lblErrMsg.ForeColor = System.Drawing.Color.Red;

        //        return false;
        //    }   

        //}

        private bool SaveCoupon()
        {
            DataAccess da = new DataAccess();

            if (da.saveCoupon_Admin(((hidCouponID.Value == "") ? 0 : int.Parse(hidCouponID.Value)), 
                txtCouponCode.Text, txtCouponName.Text, txtCouponDesc.Text, 
                Convert.ToDouble(txtCouponDiscount.Text), Convert.ToDateTime(txtStartDate.Text + " 00:00:00.000"),
                Convert.ToDateTime(txtEndDate.Text + " 23:59:00.000")))
            {
                txtCouponCode.Text = "";
                txtCouponDesc.Text = "";
                txtCouponDiscount.Text = "";
                txtCouponName.Text = "";
                txtEndDate.Text = "";
                txtStartDate.Text = "";
                lblErrMsg.Text = "The new code has been saved";
                lblErrMsg.ForeColor = System.Drawing.Color.Yellow;

                RefreshGrid();

                return true;
            }
            else
            {
                lblErrMsg.Text = "There's been an error savinbg your data.";
                lblErrMsg.ForeColor = System.Drawing.Color.Red;

                return false;
            }        
        
        }


        private void RefreshGrid()
        {
            DataAccess da = new DataAccess();

            gvCouponList.DataSource = da.GetAllCoupons();
            gvCouponList.DataBind();        
        }

        protected void gvCouponList_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Edit")
            {
                int index = Convert.ToInt32(e.CommandArgument);

                GridViewRow gvr = gvCouponList.Rows[index];

                Label lbl = (Label)gvr.FindControl("lblCodeID");
                hidCouponID.Value = lbl.Text;

                RefreshGrid();

                txtCouponCode.Text = ((Label)gvr.FindControl("lblCode")).Text;
                txtCouponDesc.Text = ((Label)gvr.FindControl("lblDesc")).Text;
                txtCouponDiscount.Text = ((Label)gvr.FindControl("lblDiscount")).Text;
                txtCouponName.Text = ((Label)gvr.FindControl("lblName")).Text;
                txtEndDate.Text = ((Label)gvr.FindControl("lblEndDate")).Text;
                txtStartDate.Text = ((Label)gvr.FindControl("lblStartDt")).Text;

                lblErrMsg.Text = "";
            }
        }

        protected void gvCouponList_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {

        }

        protected void gvCouponList_RowEditing(object sender, GridViewEditEventArgs e)
        {

        }




    }
}
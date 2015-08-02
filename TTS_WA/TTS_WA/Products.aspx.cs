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
using System.Text;


namespace TTS
{
    public partial class Products : System.Web.UI.Page
    {
        DataSet ds;
        // Populate the repeater control with the Items DataSet
        PagedDataSource objPds = new PagedDataSource();

        public int CurrentPage
        {
            get
            {
                // look for current page in ViewState
                object o = this.ViewState["_CurrentPage"];
                if (o == null)
                    return 0; // default page index of 0
                else
                    return (int)o;
            }

            set
            {
                this.ViewState["_CurrentPage"] = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            this.Master.MetaTag = "<meta name=\"robots\" content=\"noindex,follow\" /> ";                     

            if (Request.QueryString["Move"] != null)
            {
                // Set viewstate variable to the previous page
                CurrentPage = Convert.ToInt16(Request.QueryString["Move"].ToString()) ;

                // Reload control
                ItemsGet();
            }
            else
            {
                CurrentPage = 0;
                ItemsGet();
            }
                
        }

        private void ItemsGet()
        {
            DataAccess da = new DataAccess();

            if (Request.QueryString["CatID"] != null)
            {
                ds = da.GetProductsByType(Request.QueryString["CatID"]);

                SetLabel(Request.QueryString["CatID"].ToLower());
                aNext.HRef = string.Format("products.aspx?CatID={0}&Move={1}", Request.QueryString["CatID"].ToLower(), Convert.ToString(CurrentPage + 1));
                aNextTop.HRef = string.Format("products.aspx?CatID={0}&Move={1}", Request.QueryString["CatID"].ToLower(), Convert.ToString(CurrentPage + 1));
                
                aPrev.HRef = string.Format("products.aspx?CatID={0}&Move={1}", Request.QueryString["CatID"].ToLower(), Convert.ToString(CurrentPage - 1));
                aPrevTop.HRef = string.Format("products.aspx?CatID={0}&Move={1}", Request.QueryString["CatID"].ToLower(), Convert.ToString(CurrentPage - 1));

                if (ds.Tables[0].Rows.Count == 0)
                {
                    string sTemp = lblProdType.Text;
                    lblProdType.Text = string.Concat("We currently have no products in the<br/>", sTemp, " category.");
                    lblCurrentPage.Visible = false;
                }
            }
            else if (Request.QueryString["searchtext"] != null)
            {
                ds = da.ProductSearch(Request.QueryString["searchtext"]);

                lblProdType.Text = "Seach results for: " + Server.HtmlEncode(Request.QueryString["searchtext"]);

                aNext.HRef = string.Format("products.aspx?searchtext={0}&Move={1}", Request.QueryString["searchtext"].ToLower(), Convert.ToString(CurrentPage + 1));
                aNextTop.HRef = string.Format("products.aspx?searchtext={0}&Move={1}", Request.QueryString["searchtext"].ToLower(), Convert.ToString(CurrentPage + 1));

                aPrev.HRef = string.Format("products.aspx?searchtext={0}&Move={1}", Request.QueryString["searchtext"].ToLower(), Convert.ToString(CurrentPage - 1));
                aPrevTop.HRef = string.Format("products.aspx?searchtext={0}&Move={1}", Request.QueryString["searchtext"].ToLower(), Convert.ToString(CurrentPage - 1));

                if (ds.Tables[0].Rows.Count == 0)
                {
                    string sTemp = lblProdType.Text;
                    lblProdType.Text = string.Concat("There were no products matching your search for : ", Server.HtmlEncode(Request.QueryString["searchtext"]));
                    lblCurrentPage.Visible = false;
                }
            
            }
            else
            {
                lblProdType.Text = "All Products";
                aNext.HRef = string.Format("products.aspx?&Move={0}", Convert.ToString(CurrentPage + 1));
                aPrev.HRef = string.Format("products.aspx?&Move={0}", Convert.ToString(CurrentPage - 1));

                aNextTop.HRef = string.Format("products.aspx?&Move={0}", Convert.ToString(CurrentPage + 1));
                aPrevTop.HRef = string.Format("products.aspx?&Move={0}", Convert.ToString(CurrentPage - 1));

                ds = da.GetAllProducts();
            }


            objPds.DataSource = ds.Tables[0].DefaultView ;//dt.DefaultView;

            // Indicate that the data should be paged
            if (Convert.ToBoolean(ConfigurationManager.AppSettings["PagingOn"].ToString()))
            {
                objPds.AllowPaging = true;
                pnlTopPaging.Visible = true;
                pnlBottomPaging.Visible = true;
            }
            else
            {
                objPds.AllowPaging = false;
                pnlTopPaging.Visible = false;
                pnlBottomPaging.Visible = false;
            }

            // Set the number of items you wish to display per page
            objPds.PageSize = 5;

            // Set the PagedDataSource's current page
            objPds.CurrentPageIndex = CurrentPage;

            lblCurrentPage.Text = "Page: " + (CurrentPage + 1).ToString() + " of " + objPds.PageCount.ToString();

            Paging(ds.Tables[0].Rows.Count , objPds.PageSize);

            // Disable Prev or Next buttons if necessary
            //cmdPrev.Enabled = !objPds.IsFirstPage;
            aPrev.Visible = !objPds.IsFirstPage;
            aPrevTop.Visible = !objPds.IsFirstPage;

            //cmdNext.Enabled = !objPds.IsLastPage;
            aNext.Visible = !objPds.IsLastPage;
            aNextTop.Visible = !objPds.IsLastPage;

            repProducts.DataSource = objPds;
            repProducts.DataBind();
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

        protected string VideoLink(string sPath, string sTitle, string sProdName)
        {
            string sLink = string.Empty;
            if (sPath != null && sPath != string.Empty)
            {
                sLink = string.Format("<br/><br/><a class='video' href='{0}' title='{1}'><b>Product Video</b></a>", sPath, sTitle == string.Empty ? sProdName : sTitle);
            }

            return sLink;
        }

        protected void Paging(int recCnt, int PageSize)
        {
            int numPages = 0;

            numPages = recCnt / PageSize;


            if ((recCnt % PageSize) != 0) numPages++;

            StringBuilder sb = new StringBuilder();

            if (numPages > 1)
            {
                for (int x = 0; x < numPages; x++)
                {
                    string currentPage;
                    if (Request["Move"] == null)
                    {
                        currentPage = "1";
                    }
                    else
                    {
                        currentPage = (Convert.ToInt16(Request["Move"].ToString()) + 1).ToString();
                    }

                    if ((x + 1).ToString() == currentPage)
                    { sb.AppendFormat("<b>{0}</b>&nbsp;", (x + 1).ToString()); }
                    else
                    {
                        if (Request.QueryString["CatID"] != null)
                        {
                            sb.AppendFormat("<a href='products.aspx?CatID={0}&Move={1}'>{2}</a>&nbsp;", Request.QueryString["CatID"].ToString(), x.ToString(), (x + 1).ToString());
                        }
                        else if (Request.QueryString["searchtext"] != null)
                        {
                            sb.AppendFormat("<a href='products.aspx?searchtext={0}&Move={1}'>{2}</a>&nbsp;", Request.QueryString["searchtext"].ToString(), x.ToString(), (x + 1).ToString());
                        }
                        else
                        {
                            sb.AppendFormat("<a href='products.aspx?&Move={0}'>{1}</a>&nbsp;", x.ToString(), (x + 1).ToString());
                        }
                    }

                }
                litPageNums_Top.Visible = true;
                litPageNums_Top.Text = sb.ToString();

                litPageNums_Bottom.Visible = true;
                litPageNums_Bottom.Text = sb.ToString();
            }
        }

        protected string DisplayPrice(string sPrice)
        {
            string origPrice = sPrice;
            double dPrice;
            Coupon c = new Coupon();
            if (c.isValid)
            {
                sPrice = c.DiscountPrice(sPrice).ToString();
                dPrice = Convert.ToDouble(sPrice);
                return string.Format("<div id='priceOrig'>${0}</div><div>coupon price</div><div>${1}</div>", origPrice, dPrice.ToString("0.00"));
            }
            else
            {
                return string.Format("${0}", sPrice);
            }
        }


        protected string PayPalInputFields(string sProdName,string sItemNo,string dPrice,
                        string iWeight, string sSizes, string sColors)
        {
            StringBuilder sb = new StringBuilder();

            sb.Append("<input type='hidden' name='add' value='1' />");
            sb.Append("<input type='hidden' name='cmd' value='_cart' />");
            sb.Append("<input type='hidden' name='business' value='paypal@theteachersspot.com' />");
            sb.AppendFormat("<input type='hidden' name='item_name' value='{0}' />",sProdName);
            sb.AppendFormat("<input type='hidden' name='item_number' value='{0}' />",sItemNo.Trim());

            Coupon c = new Coupon();
            if (c.isValid)
            {
                sb.AppendFormat("<input type='hidden' name='amount' value='{0}' />", c.DiscountPrice(dPrice).ToString());
                sb.Append("<input type='hidden' name='on2' value='Coupon'>");
                sb.AppendFormat("<input type='hidden' name='os2' value='{0}'>",c.Code );
            }
            else
            {
                sb.AppendFormat("<input type='hidden' name='amount' value='{0}' />", dPrice);
            }
            

            if (sSizes.Length > 0)
            {
                sb.Append("<table border='0'><tr><td>");
                sb.Append("<input type='hidden' name='on0' value='Size'>Size</td>");
                sb.Append("<td><select name='os0'><option value='Select a Size'>Select a Size");
                sb.Append(LoadDropDown(sSizes));
                sb.Append("</select></td></tr></table>");
            }

            if (sColors.Length > 0)
            {
                sb.Append("<table border='0'><tr><td>");
                sb.Append("<input type='hidden' name='on1' value='Color'>Color</td>");
                sb.Append("<td><select name='os1'><option value='Select a Color'>Select a Color");
                sb.Append(LoadDropDown(sColors));
                sb.Append("</select></td></tr></table>");

            }

            sb.Append("<input type='hidden' name='no_shipping' value='2' />");
            sb.Append("<input type='hidden' name='return' value='http://www.theteachersspot.com/ThankYou.aspx' />");
            sb.Append("<input type='hidden' name='cancel_return' value='http://www.theteachersspot.com' />");
            sb.Append("<input type='hidden' name='currency_code' value='USD' />");
            sb.AppendFormat("<input type='hidden' name='weight' value='{0}' />",iWeight);
            sb.Append("<input type='hidden' name='weight_unit' value='lbs' />");
            sb.Append("<input type='hidden' name='lc' value='US' />");
            sb.Append("<input type='hidden' name='bn' value='PP-ShopCartBF' />");

            return sb.ToString();
            //<asp:Literal ID="myLit" Text='<%# test(DataBinder.Eval(Container.DataItem, "sProdName").ToString())%>' runat="server" ></asp:Literal>
        
        }

        
        private string LoadDropDown(string Options)
        {
            //<option value='Small'>Small<option value='Medium'>Medium<option value='Large'>Large
            StringBuilder sbChoices = new StringBuilder();

            string[] choices = Options.Split('|');

            foreach (string choice in choices)
            {
                sbChoices.AppendFormat("<option value='{0}'>{0}", choice);
            }

            return sbChoices.ToString();
        }


        private void SetLabel(string Type)
        {
            switch (Type)
            {
                case "math":
                    lblProdType.Text = "Math";
                    break;
                case "la":
                    lblProdType.Text = "ELA";
                    break;
                case "cb":
                    lblProdType.Text = "Children`s Books";
                    break;
                case "bi":
                    lblProdType.Text = "Black Interest";
                    break;
                case "sci":
                    lblProdType.Text = "Science";
                    break;
                case "tr":
                    lblProdType.Text = "Teaching Resources";
                    break;
                case "sp":
                    lblProdType.Text = "Spanish";
                    break;
                case "ga":
                    lblProdType.Text = "Games";
                    break;
                case "rel":
                    lblProdType.Text = "Religious";
                    break;
                case "si":
                    lblProdType.Text = "Specialty Items";
                    break;
                case "clo":
                    lblProdType.Text = "Clothing";
                    break;
                case "oth":
                    lblProdType.Text = "Other";
                    break;
                case "brg":
                    lblProdType.Text = "2$ and Under";
                    break;
                case "ce":
                    lblProdType.Text = "Character Education";
                    break;
                case "gft":
                    lblProdType.Text = "Gifts for the Teacher";
                    break;
                case "dls":
                    lblProdType.Text = "Downloads";
                    break;
                default:
                    //lblProdType.Text = "Math";
                    break;


            }

            this.Master.PageTitle = lblProdType.Text;
            this.Master.MetaDescription = String.Format("Product Category - {0}: The Teacher's Spot has plenty of books, games, file folders and other materials based on {0}.", lblProdType.Text);
        }
    }
}




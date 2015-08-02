using System;
using System.ComponentModel;
using System.Collections;
using System.Diagnostics;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Caching;


namespace TTS
{
    /// <summary>
    /// ADO.NET data access using the SQL Server Managed Provider.
    /// </summary>
    public class DataAccess : IDisposable
    {

 


        #region "Site Procs"
        /// <summary>
        /// Run stored procedure.
        /// </summary>
        /// <param name="procName">Name of stored procedure.</param>
        /// <param name="dataReader">Return result of procedure.</param>
        public DataSet GetAllProducts()
        {
            Cache myCache = System.Web.HttpRuntime.Cache;
            DataSet MyDataSet = new DataSet();


            if (myCache["allProducts"] == null || ConfigurationManager.AppSettings["BreakCache"].ToUpper() == "YES")
            {
                SqlCommand cmd = CreateCommand("[uspGetAllProducts]", null);

                //SqlConnection MyConnection = con;
                SqlDataAdapter MyAdapter = new SqlDataAdapter(cmd);

                MyAdapter.Fill(MyDataSet, "MyTable");

                if (MyDataSet != null)
                {
                    myCache.Insert("allProducts", MyDataSet, null,
                            DateTime.Now.AddMinutes(60), TimeSpan.Zero);
                }
            }
            else
            {
                MyDataSet = myCache["allProducts"] as DataSet;
            }
            return MyDataSet;

        }


        /// <summary>
        /// Get product by Type.
        /// </summary>
        /// <param name="procName">Name of stored procedure.</param>
        /// <param name="dataReader">Return result of procedure.</param>
        public DataSet GetProductsByType(string sProdCode)
        {
            SqlCommand cmd = CreateCommand("uspGetProdByType", null);

            cmd.Parameters.Add(new SqlParameter("@ProdCode", sProdCode));

            //SqlConnection MyConnection = con;
            //SqlDataAdapter MyAdapter = new SqlDataAdapter("uspGetProdByType", MyConnection);
            SqlDataAdapter MyAdapter = new SqlDataAdapter(cmd);

            DataSet MyDataSet = new DataSet();

            MyAdapter.Fill(MyDataSet, "MyTable");

            return MyDataSet;

        }


        /// <summary>
        /// Get product by ID
        /// </summary>
        /// <param name="procName">Name of stored procedure.</param>
        /// <param name="dataReader">Return result of procedure.</param>
        public DataSet GetProductsByID(int iProdId)
        {
            SqlCommand cmd = CreateCommand("uspGetProductByID", null);

            cmd.Parameters.Add(new SqlParameter("@ProdID", iProdId));

            //SqlConnection MyConnection = con;
            //SqlDataAdapter MyAdapter = new SqlDataAdapter("uspGetProdByType", MyConnection);
            SqlDataAdapter MyAdapter = new SqlDataAdapter(cmd);

            DataSet MyDataSet = new DataSet();

            MyAdapter.Fill(MyDataSet, "MyTable");

            return MyDataSet;

        }


        /// <summary>
        /// Product Search
        /// </summary>
        /// <param name="procName">Name of stored procedure.</param>
        /// <param name="dataReader">Return result of procedure.</param>
        public DataSet ProductSearch(string sSearchText)
        {
            SqlCommand cmd = CreateCommand("uspSearchProducts", null);

            cmd.Parameters.Add(new SqlParameter("@SearchText", sSearchText));

            //SqlConnection MyConnection = con;
            //SqlDataAdapter MyAdapter = new SqlDataAdapter("uspGetProdByType", MyConnection);
            SqlDataAdapter MyAdapter = new SqlDataAdapter(cmd);
            DataSet MyDataSet = new DataSet();
            MyAdapter.Fill(MyDataSet, "MyTable");

            return MyDataSet;
        }


        /// <summary>
        /// Get the products for the featured products carousel.
        /// </summary>
        /// <param name="dataReader">Return result of procedure.</param>
        public DataSet GetFeaturedProducts()
        {
            Cache myCache = System.Web.HttpRuntime.Cache;
            DataSet MyDataSet = new DataSet();

            if (myCache["FeaturedProducts"] == null || ConfigurationManager.AppSettings["BreakCache"].ToUpper() == "YES")
            {
                SqlCommand cmd = CreateCommand("uspGetFeaturedProducts", null);

                SqlDataAdapter MyAdapter = new SqlDataAdapter(cmd);

                MyAdapter.Fill(MyDataSet, "MyTable");
                if (MyDataSet != null)
                {
                    myCache.Insert("FeaturedProducts", MyDataSet, null,
                            DateTime.Now.AddMinutes(60), TimeSpan.Zero);
                }
            }
            else
            {
                MyDataSet = myCache["FeaturedProducts"] as DataSet;
            }
            return MyDataSet;

        }

        #endregion


        #region "Admin Procs"


        /// <summary>
        /// Run stored procedure.
        /// </summary>
        /// <param name="procName">Name of stored procedure.</param>
        /// <param name="dataReader">Return result of procedure.</param>
        public DataSet GetAllProducts_Admin()
        {
            SqlCommand cmd = CreateCommand("uspGetAllProducts_admin", null);

            //SqlConnection MyConnection = con;
            SqlDataAdapter MyAdapter = new SqlDataAdapter(cmd);
            DataSet MyDataSet = new DataSet();

            MyAdapter.Fill(MyDataSet, "MyTable");

            return MyDataSet;

        }

        /// <summary>
        /// Run stored procedure.
        /// </summary>
        /// <param name="procName">Name of stored procedure.</param>
        /// <param name="dataReader">Return result of procedure.</param>
        public DataSet GetTypesByProducts_Admin(int iProductId)
        {
            SqlCommand cmd = CreateCommand("uspGetTypesByProduct_admin", null);

            //SqlConnection MyConnection = con;
            cmd.Parameters.Add(new SqlParameter("@iProductID", iProductId));
            SqlDataAdapter MyAdapter = new SqlDataAdapter(cmd);
            DataSet MyDataSet = new DataSet();

            MyAdapter.Fill(MyDataSet, "MyTable");

            return MyDataSet;

        }


        /// <summary>
        /// Delete all Types for a ProductID.
        /// </summary>
        /// <param name="procName">Name of stored procedure.</param>
        /// <param name="dataReader">Return result of procedure.</param>
        public void DelProductTypesByProdID_Admin(int iProductId)
        {
            SqlCommand cmd = CreateCommand("uspDelProductTypesByProdID_admin", null);

            //SqlConnection MyConnection = con;
            cmd.Parameters.Add(new SqlParameter("@iProductID", iProductId));
            int rows = cmd.ExecuteNonQuery();
            
        }


        /// <summary>
        /// Insert a Type for a ProductID.
        /// </summary>
        /// <param name="procName">Name of stored procedure.</param>
        /// <param name="dataReader">Return result of procedure.</param>
        public void InsProductTypeByProdID_Admin(int iProductId, int iTypeId)
        {
            SqlCommand cmd = CreateCommand("uspInsProductTypesByProdID_admin", null);

            //SqlConnection MyConnection = con;
            cmd.Parameters.Add(new SqlParameter("@iProductID", iProductId));
            cmd.Parameters.Add(new SqlParameter("@iTypeID", iTypeId));
            int rows = cmd.ExecuteNonQuery();

        }


        /// <summary>
        /// Insert new Product.
        /// </summary>
        /// <param name="procName">Name of stored procedure.</param>
        /// <param name="dataReader">Return result of procedure.</param>
        public bool InsProduct_Admin(string sProdName, string sItemNo
                                                ,double  dPrice, string sImageName
                                                , int iWeight, int iQuanity
                                                , string sLongDesc, Int32  iProdID
                                                , string sSizes, string sColors, string sVideoPath
                                                , string sVideoTitle)
        {
            SqlCommand cmd = CreateCommand("uspInsProduct_admin", null);

            //SqlConnection MyConnection = con;
            cmd.Parameters.Add(new SqlParameter("@sProdName", sProdName));
            cmd.Parameters.Add(new SqlParameter("@sItemNo", sItemNo.Trim()));
            cmd.Parameters.Add(new SqlParameter("@dPrice", dPrice));
            cmd.Parameters.Add(new SqlParameter("@sImageName", sImageName));
            cmd.Parameters.Add(new SqlParameter("@iWeight", iWeight));
            cmd.Parameters.Add(new SqlParameter("@iQuanity", iQuanity));
            cmd.Parameters.Add(new SqlParameter("@sLongDesc", sLongDesc));
            cmd.Parameters.Add(new SqlParameter("@iProductID", iProdID));

            cmd.Parameters.Add(new SqlParameter("@sSizes", sSizes));
            cmd.Parameters.Add(new SqlParameter("@sColors", sColors));

            cmd.Parameters.Add(new SqlParameter("@sVideoPath", sVideoPath));
            cmd.Parameters.Add(new SqlParameter("@sVideoTitle", sVideoTitle));

            int rows = cmd.ExecuteNonQuery();
            return rows > 0 ? true : false;
        }

        /// <summary>
        /// Get Coupon by code.
        /// </summary>
        /// <param name="sCouponCode">Coupon code.</param>
        public DataSet GetCouponByCode(string sCouponCode)
        {
            SqlCommand cmd = CreateCommand("uspGetCouponByCode", null);

            cmd.Parameters.Add(new SqlParameter("@szCouponCode", sCouponCode));

            SqlDataAdapter MyAdapter = new SqlDataAdapter(cmd);

            DataSet MyDataSet = new DataSet();

            MyAdapter.Fill(MyDataSet, "MyTable");

            return MyDataSet;

        }


        /// <summary>
        /// Run stored procedure.
        /// </summary>
        /// <param name="procName">Name of stored procedure.</param>
        /// <param name="dataReader">Return result of procedure.</param>
        public DataSet GetAllCoupons()
        {
 
            DataSet MyDataSet = new DataSet();

            SqlCommand cmd = CreateCommand("[uspGetAllCoupons]", null);

            //SqlConnection MyConnection = con;
            SqlDataAdapter MyAdapter = new SqlDataAdapter(cmd);

            MyAdapter.Fill(MyDataSet, "MyTable");

            return MyDataSet;
        }

        /// <summary>
        /// Insert new Coupon.
        /// </summary>
        /// <param name="procName">Name of stored procedure.</param>
        /// <param name="dataReader">Return result of procedure.</param>
        public bool saveCoupon_Admin(int iCouponID, string szCouponCode, string szCouponName
                                                , string szDescription
                                                , double fDiscount
                                                , DateTime dtStartDate
                                                , DateTime dtEndDate)
        {
            SqlCommand cmd = CreateCommand("uspSaveCoupon_admin", null);

            //SqlConnection MyConnection = con;
            cmd.Parameters.Add(new SqlParameter("@iCouponID", iCouponID));
            cmd.Parameters.Add(new SqlParameter("@szCouponCode", szCouponCode));
            cmd.Parameters.Add(new SqlParameter("@szCouponName", szCouponName));
            cmd.Parameters.Add(new SqlParameter("@szDescription", szDescription));
            cmd.Parameters.Add(new SqlParameter("@fDiscount", fDiscount));
            cmd.Parameters.Add(new SqlParameter("@dtStartDate", dtStartDate));
            cmd.Parameters.Add(new SqlParameter("@dtEndDate", dtEndDate));
            
            int rows = cmd.ExecuteNonQuery();
            return rows > 0 ? true : false;
        }

#endregion



        #region "Data Access Methods"
        // connection to data source
        private SqlConnection con;

        /// <summary>
        /// Run stored procedure.
        /// </summary>
        /// <param name="procName">Name of stored procedure.</param>
        /// <returns>Stored procedure return value.</returns>
        public int RunProc(string procName)
        {
            SqlCommand cmd = CreateCommand(procName, null);
            cmd.ExecuteNonQuery();
            this.Close();
            return (int)cmd.Parameters["ReturnValue"].Value;


        }

        /// <summary>
        /// Run stored procedure.
        /// </summary>
        /// <param name="procName">Name of stored procedure.</param>
        /// <param name="prams">Stored procedure params.</param>
        /// <returns>Stored procedure return value.</returns>
        public int RunProc(string procName, SqlParameter[] prams)
        {
            SqlCommand cmd = CreateCommand(procName, prams);
            cmd.ExecuteNonQuery();
            this.Close();
            return (int)cmd.Parameters["ReturnValue"].Value;
        }




        /// <summary>
        /// Run stored procedure.
        /// </summary>
        /// <param name="procName">Name of stored procedure.</param>
        /// <param name="prams">Stored procedure params.</param>
        /// <param name="dataReader">Return result of procedure.</param>
        public void RunProc(string procName, SqlParameter[] prams, out SqlDataReader dataReader)
        {
            SqlCommand cmd = CreateCommand(procName, prams);
            dataReader = cmd.ExecuteReader(System.Data.CommandBehavior.CloseConnection);
        }


        /// <summary>
        /// Create command object used to call stored procedure.
        /// </summary>
        /// <param name="procName">Name of stored procedure.</param>
        /// <param name="prams">Params to stored procedure.</param>
        /// <returns>Command object.</returns>
        private SqlCommand CreateCommand(string procName, SqlParameter[] prams)
        {
            // make sure connection is open
            Open();


            SqlCommand cmd = new SqlCommand(procName, con);
            cmd.CommandType = CommandType.StoredProcedure;

            // add proc parameters
            if (prams != null)
            {
                foreach (SqlParameter parameter in prams)
                    cmd.Parameters.Add(parameter);
            }

            // return param
            cmd.Parameters.Add(
                new SqlParameter("ReturnValue", SqlDbType.Int, 4,
                ParameterDirection.ReturnValue, false, 0, 0,
                string.Empty, DataRowVersion.Default, null));


            return cmd;
        }

        /// <summary>
        /// Open the connection.
        /// </summary>
        private void Open()
        {
            // open connection
            if (con == null)
            {
                con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
                con.Open();
            }
        }

        /// <summary>
        /// Close the connection.
        /// </summary>
        public void Close()
        {
            if (con != null)
                con.Close();
        }

        /// <summary>
        /// Release resources.
        /// </summary>
        public void Dispose()
        {
            // make sure connection is closed
            if (con != null)
            {
                con.Dispose();
                con = null;
            }
        }

        /// <summary>
        /// Make input param.
        /// </summary>
        /// <param name="ParamName">Name of param.</param>
        /// <param name="DbType">Param type.</param>
        /// <param name="Size">Param size.</param>
        /// <param name="Value">Param value.</param>
        /// <returns>New parameter.</returns>
        public SqlParameter MakeInParam(string ParamName, SqlDbType DbType, int Size, object Value)
        {
            return MakeParam(ParamName, DbType, Size, ParameterDirection.Input, Value);
        }

        /// <summary>
        /// Make input param.
        /// </summary>
        /// <param name="ParamName">Name of param.</param>
        /// <param name="DbType">Param type.</param>
        /// <param name="Size">Param size.</param>
        /// <returns>New parameter.</returns>
        public SqlParameter MakeOutParam(string ParamName, SqlDbType DbType, int Size)
        {
            return MakeParam(ParamName, DbType, Size, ParameterDirection.Output, null);
        }

        /// <summary>
        /// Make stored procedure param.
        /// </summary>
        /// <param name="ParamName">Name of param.</param>
        /// <param name="DbType">Param type.</param>
        /// <param name="Size">Param size.</param>
        /// <param name="Direction">Parm direction.</param>
        /// <param name="Value">Param value.</param>
        /// <returns>New parameter.</returns>
        public SqlParameter MakeParam(string ParamName, SqlDbType DbType, Int32 Size,
         ParameterDirection Direction, object Value)
        {
            SqlParameter param;

            if (Size > 0)
                param = new SqlParameter(ParamName, DbType, Size);
            else
                param = new SqlParameter(ParamName, DbType);

            param.Direction = Direction;
            if (!(Direction == ParameterDirection.Output && Value == null))
                param.Value = Value;

            return param;
        }

        public DataTable GetDataTable(string Sql, string ConnectString)
        {
            SqlDataAdapter da = new SqlDataAdapter(Sql, ConnectString);
            DataTable dt = new DataTable();

            int rows = da.Fill(dt);

            return dt;
        }

        #endregion




    }
}

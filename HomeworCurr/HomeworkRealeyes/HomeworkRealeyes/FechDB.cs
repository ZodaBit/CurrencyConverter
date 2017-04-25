using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace HomeworkRealeyes
{
    public class FechDB
    {

        public static String connectionString = ConfigurationManager.ConnectionStrings["Realeyes"].ConnectionString;

        public SqlConnection con = new SqlConnection(connectionString);

        #region return selected exchange rate with
        public String GetRate(string Cname, DateTime dateme)
        {
            //Gets a user from fhe data base:= if avalabel it retuns info about the user if not it returns null
            String value;
            string sqlGetRate = "SELECT Rate FROM MyCurrency_tbl WHERE  Currency=@Cname AND Dateme=@dateme";

            SqlCommand cmd = new SqlCommand(sqlGetRate, con);
            cmd.Parameters.AddWithValue("@Cname", Cname);
            cmd.Parameters.AddWithValue("@dateme", dateme);

            try
            {
                con.Open();
                value = (string)cmd.ExecuteScalar();
            }

            finally
            {
                con.Close();
            }

            return value;

        }
        #endregion


        #region get all data by currency name
        public DataSet GetallByCurrencyName(string Cname)
        {

            string sqlgetall = "SELECT Rate ,Currency ,Dateme FROM  MyCurrency_tbl WHERE Currency=@Cname";
            SqlCommand cmd = new SqlCommand(sqlgetall, con);
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();

            cmd.Parameters.AddWithValue("@Cname", Cname);


            try
            {
                con.Open();
                adp.Fill(ds, "gettbl");
            }
            catch (Exception err)
            {

            }
            finally
            {
                con.Close();
            }

            return ds;
        }
        #endregion
    }
}
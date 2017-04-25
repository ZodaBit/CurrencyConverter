using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace HomeworkRealeyes
{
    public class ConvertXmLtoDB
    {


        private void   xmltosqldb()
        {
            /*
            String cs = ConfigurationManager.ConnectionStrings["CS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                DataSet ds = new DataSet();
                ds.ReadXml(Server.MapPath("~/Data.xml"));
                /* DataTable dbtbl = ds.Tables["Cube"];
                 con.Open();
                 SqlBulkCopy bc = new SqlBulkCopy(con);
                 bc.DestinationTableName = "MyCurrency_tbl";
                 bc.ColumnMappings.Add("currency", "Currency");
                 bc.ColumnMappings.Add("rate", "Rate");
                 bc.ColumnMappings.Add("time", "Dateme");
                 bc.WriteToServer(dbtbl);*/

            }


        }
    }

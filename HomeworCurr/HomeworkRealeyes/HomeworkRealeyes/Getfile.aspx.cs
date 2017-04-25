using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Script.Serialization;
using System.Data.SqlClient;

namespace HomeworkRealeyes
{
    public partial class Getfile : System.Web.UI.Page
    {

        FechDB _db = new FechDB();
        money mo = new money();

        List<money> cmodel = new List<money>();
        protected void Page_Load(object sender, EventArgs e)
        {
            JavaScriptSerializer js = new JavaScriptSerializer();
            String jsonString = js.Serialize(GetAllByCurrencyName(Request["Cname"]));
            Response.Write(jsonString);
        }


        public List<money> GetAllByCurrencyName(string Cname)
        {

            DataSet ds = _db.GetallByCurrencyName(Cname);
            DataTable dt = ds.Tables["gettbl"];
            //cmodel=dt.AsEnumerable().Select(x=>new CurrencyModel{Id=x.Field<Int32>("Id"),Currency=x.Field<String>("Currency"),Rate=x.Field<double>("Rate"),Dateme=x.Field<DateTime>("Dateme")});
            foreach (DataRow dr in dt.Rows)
            {

                String currencyCurrency = dr["Currency"].ToString();
                double currencyRate = Convert.ToDouble(dr["Rate"]);
                string currencyDateme = dr["Dateme"].ToString();


                cmodel.Add(new money { Currency = currencyCurrency, Rate = currencyRate, Dateme = currencyDateme });

            }

            return cmodel;

        }
    }
}
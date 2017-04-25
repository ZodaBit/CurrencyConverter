using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HomeworkRealeyes
{
    public partial class ConvertCurrency : System.Web.UI.Page
    {
        FechDB _db = new FechDB();
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        public void calculate()
        {
            if (EnterTextbox.Text == "")
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please Enter Currency you want to convert!!')", true);



            }
            else
            {
                double Rate = Convert.ToDouble(_db.GetRate(DropDownList2.SelectedItem.Text, Convert.ToDateTime(DropDownList3.SelectedValue)));
                double amount = Convert.ToDouble(EnterTextbox.Text);
                double answer = amount * Rate;
                if (answer >= 0)
                {
                    DisplayTextbox.Text = answer.ToString();
                }
                else
                {
                    DisplayTextbox.Text = " ";
                }
            }
         

        }

        protected void ConvertBtn_Click(object sender, EventArgs e)
        {
            calculate();
            
        }
    }
}
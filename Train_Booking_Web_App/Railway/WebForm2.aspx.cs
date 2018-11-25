using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Railway
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnlogin1_Click(object sender, EventArgs e)
        {
            try
            {
                CMySql mysqlConn = CMySql.Instance;
                mysqlConn.Connect("localhost", "Database", "root", "root");
                string Query = "";
                //insert into userdata values ("Shashank", "Shashank", "1805", "101", "1000");
                Query = "insert into railway.userdata values('" + txtuser1.Text + "','" + txtpassword1.Text + "','" + txtaadhar.Text + "','" + txtbank.Text + "','" + txtamount.Text + "');";
                mysqlConn.Execute(Query);
                CMySql.userdata = txtuser1.Text;
                Response.Redirect("WebForm3.aspx");
            }
            catch(Exception ex)
            {
                string value = ex.Message;
                ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "Alert1", "alert(\"" + value + "\");", true);
            }
        }
    }
}
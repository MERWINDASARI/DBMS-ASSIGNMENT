using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using MySql.Data;
using MySql.Data.MySqlClient;
using MySql.Web;

namespace Railway
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnlogin_Click(object sender, EventArgs e)
        {
            string password = "";
            string sqlcommand = "select *from railway.admin where a_name ='" + txtuser2.Text + "'";

            try
            {
                CMySql mysqlConn = CMySql.Instance;
                mysqlConn.Connect("localhost", "shashank", "root", "root");
                DataTable _resultTable = new DataTable();
                _resultTable = mysqlConn.Read(sqlcommand);
                password = _resultTable.Rows[0].Field<string>(1);
            }

            catch
            {
                Response.Write(password);
                Response.Write("<script>alert('Incorrect User Name');</script>");
            }
            if (password == txtpassword2.Text)
            {
                CMySql.userdata = txtuser2.Text;
                Response.Redirect("WebForm7.aspx");
            }
            else
            {
                Response.Write("<script>alert('Incorrect Password');</script>");
            }
        }
    }
}
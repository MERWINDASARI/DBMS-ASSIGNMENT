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
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnsignup_Click(object sender, EventArgs e)
        {
            Response.Redirect("WebForm2.aspx");
        }

        protected void btnlogin_Click(object sender, EventArgs e)
        {
            CMySql.money = 0;
            CMySql.date = "";
            string password = "";
            string sqlcommand = "";
            CMySql mysqlConn = CMySql.Instance;
            mysqlConn.Connect("localhost", "Database", "root", "root");
            DataTable _resultTable = new DataTable();
            sqlcommand = "select *from railway.bookings";
            _resultTable = mysqlConn.Read(sqlcommand);
            if (_resultTable.Rows.Count > 0)
            {
                password = _resultTable.Rows[0].Field<string>(1);
                CMySql.ticket = Convert.ToInt32(password) + 1;
            }
            else CMySql.ticket = 1;

            password = "";
             sqlcommand = "select *from railway.userdata where u_name ='" + txtuser.Text+"'";

            try
            {
               _resultTable = mysqlConn.Read(sqlcommand);
                password = _resultTable.Rows[0].Field<string>(1);
            }

            catch
            {
                Response.Write(password);
                Response.Write("<script>alert('Incorrect User Name');</script>");
            }
            if (password == txtpassword.Text)
            {
                CMySql.userdata = txtuser.Text;
                Response.Redirect("WebForm3.aspx");                
            }
            else
            {
                Response.Write("<script>alert('Incorrect Password');</script>");
            }
        }
       

        protected void btnadmin_Click(object sender, EventArgs e)
        {
            Response.Redirect("WebForm5.aspx");
        }

        protected void txtpassword_TextChanged(object sender, EventArgs e)
        {
            
        }
    }
}
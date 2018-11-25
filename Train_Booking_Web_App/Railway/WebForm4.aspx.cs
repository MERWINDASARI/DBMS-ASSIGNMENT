using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using MySql.Data.MySqlClient;

namespace Railway
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lbuser1.Text = "Welcome  " + CMySql.userdata;
            if (!Page.IsPostBack)
            {
                populate();
            }
        }

        void populate()
        {
            CMySql mysqlConn = CMySql.Instance;
            DataTable _resultTable = new DataTable();
            _resultTable = mysqlConn.Read("select *from railway.bookings where u_name ='"+ CMySql.userdata +"'");
            if(_resultTable.Rows.Count > 0)
            {
                GridView1.DataSource = _resultTable;
                GridView1.DataBind();
            }
            else
            {
                _resultTable.Rows.Add(_resultTable.NewRow());
                GridView1.DataSource = _resultTable;
                GridView1.DataBind();
                GridView1.Rows[0].Cells.Clear();
                GridView1.Rows[0].Cells.Add(new TableCell());
                GridView1.Rows[0].Cells[0].ColumnSpan = _resultTable.Columns.Count;
                GridView1.Rows[0].Cells[0].Text = "No Previous Bookings";
                GridView1.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
            }
           
        }
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnout_Click(object sender, EventArgs e)
        {
            Response.Redirect("WebForm6.aspx");
        }

        protected void btncancel_Click(object sender, EventArgs e)
        {
            int a = 2;
            int b = 2;
            int c = a + b;
        }

       protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            //Response.Write("<script>alert('Yeah');</script>");           
            try
            {
                string connectionString = @"Data Source=" + "localhost" + ";Database=" + "Database" + ";Uid=" + "root" + ";Pwd=" + "root" + ";Allow User Variables=True";
                using (MySqlConnection sqlCon = new MySqlConnection(connectionString))
                {
                   // Response.Write(GridView1.DataKeys[e.RowIndex].Value.ToString());
                    string query = "select *from railway.bookings where Ticket ='" + GridView1.DataKeys[e.RowIndex].Value.ToString() + "'";
                    CMySql mysqlConn = CMySql.Instance;
                    mysqlConn.Connect("localhost", "Database", "root", "root");
                    DataTable _resultTable = new DataTable();
                    _resultTable = mysqlConn.Read(query);
                    string data = _resultTable.Rows[0].Field<string>(4);
                    string u = _resultTable.Rows[0].Field<string>(0);
                    //   Response.Write(data);
                    //   Response.Write(u);
                    query = "select *from railway.userdata where u_name ='" + u + "'";
                    _resultTable = mysqlConn.Read(query);
                    string value = _resultTable.Rows[0].Field<string>(4);
                    value = (Convert.ToInt32(value) + Convert.ToInt32(data)).ToString();
                    query = "update railway.userdata set u_amount ='" + value + "' where u_name ='" + u + "'";
                    mysqlConn.Execute(query);
                    sqlCon.Open();
                    query = "delete from railway.bookings where Ticket = @id";
                    MySqlCommand sqlCmd = new MySqlCommand(query, sqlCon);
                    sqlCmd.Parameters.AddWithValue("@id", Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString()));
                    sqlCmd.ExecuteNonQuery();
                    //query = "update from railway.userdata set amount ='"++"where u_name='" + CMySql.userdata + "'";
                    sqlCon.Close();
                    populate();
                }
          }
            catch (Exception ex)
            {
                string value = ex.Message;
                ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "Alert1", "alert(\"" + value + "\");", true);
            }
        }

        protected void Unnamed_Click(object sender, ImageClickEventArgs e)
        {
            
        }
    }
}
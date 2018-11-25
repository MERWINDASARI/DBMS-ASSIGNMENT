using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using MySql.Data;
using MySql.Data.MySqlClient;

namespace Railway
{
    public partial class WebForm7 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PopulateGridview();
            }
        }

        void PopulateGridview()
        {
            CMySql mysqlConn = CMySql.Instance;
            DataTable _resultTable = new DataTable();
            _resultTable = mysqlConn.Read("select *from railway.train");
            if (_resultTable.Rows.Count > 0)
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
                GridView1.Rows[0].Cells[0].Text = "No Trains Available";
                GridView1.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
            }
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            PopulateGridview();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            PopulateGridview();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                string connectionString = @"Data Source=" + "localhost" + ";Database=" + "Database" + ";Uid=" + "root" + ";Pwd=" + "root" + ";Allow User Variables=True";
                using (MySqlConnection sqlCon = new MySqlConnection(connectionString))
                {
                    sqlCon.Open();
                    string query = "UPDATE railway.train SET Station_list=@Station_list, days=@days, State=@State WHERE Train = @Train";
                   // Response.Write(query);
                    MySqlCommand sqlCmd = new MySqlCommand(query, sqlCon);
                    sqlCmd.Parameters.AddWithValue("@Station_list", (GridView1.Rows[e.RowIndex].FindControl("txtStation_list") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@days", (GridView1.Rows[e.RowIndex].FindControl("txtdays") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@State", (GridView1.Rows[e.RowIndex].FindControl("txtState") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@Train", (GridView1.DataKeys[e.RowIndex].Value.ToString()));
                    sqlCmd.ExecuteNonQuery();
                    GridView1.EditIndex = -1;
                    PopulateGridview();
                    sqlCon.Close();
                }
            }
            catch (Exception ex)
            {
                string value = ex.Message;
                ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "Alert1", "alert(\"" + value + "\");", true);
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("WebForm6.aspx");
        }
    }
}
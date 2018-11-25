using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Data;

namespace Railway
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        string s = "",temp="";
        int amount = 0, account = 0;
        List<string> passengers = new List<string>();
        List<int> age = new List<int>();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                lbuser.Text = "Welcome  " + CMySql.userdata;
                CMySql.ticket = 101;
                CMySql mysqlConn = CMySql.Instance;
                DataTable _resultTable = new DataTable();
                _resultTable = mysqlConn.Read("select *from railway.userdata where u_name ='" + CMySql.userdata + "'");
                amount = Convert.ToInt32(_resultTable.Rows[0].Field<string>(4));
                account = Convert.ToInt32(_resultTable.Rows[0].Field<string>(3));
            }
            catch(Exception ex)
            {
                string value = ex.Message;
                ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "Alert1", "alert(\"" + value + "\");", true);
            }
            
        }

        protected void btnhistory_Click(object sender, EventArgs e)
        {            
            Response.Redirect("WebForm4.aspx");
        }

        protected void btnout_Click(object sender, EventArgs e)
        {
            Response.Redirect("WebForm6.aspx");
        }

        protected void btnadd_Click(object sender, EventArgs e)
        {           

        }

        protected void droptrain_Load(object sender, EventArgs e)
        {
           

        }
        protected void txtdate_TextChanged(object sender, EventArgs e)
        {
           

        }

        protected void txtdate_DataBinding(object sender, EventArgs e)
        {

        }

        protected void btntrain_Click(object sender, EventArgs e)
        {
            try
            {
                temp = txtdate.Text;
                CMySql.date = temp;
                string s1 = "";
                string s2 = "";
                string s3 = "";
                int l = temp.Length;
                //// Response.Write(l);
                //Response.Write(temp);
                // Response.Write(temp.Substring(6, 3))
                if (l == 10)
                {
                    s1 = (temp.Substring(6, 4));
                    s2 = (temp.Substring(0, 2));
                    s3 = (temp.Substring(3, 2));
                }
                else if (l == 8)
                {
                    s1 = (temp.Substring(4, 4));
                    s2 = (temp.Substring(0, 1));
                    s3 = (temp.Substring(2, 1));
                }
                else if (l == 9 && temp.Substring(1, 1) == "/")
                {
                    s1 = (temp.Substring(5, 4));
                    s2 = (temp.Substring(0, 1));
                    s3 = (temp.Substring(2, 1));
                }
                else if (l == 9 && temp.Substring(2, 1) == "/")
                {
                    s1 = (temp.Substring(5, 4));
                    s2 = (temp.Substring(0, 2));
                    s3 = (temp.Substring(3, 1));
                }

                //   Response.Write(s1);
                // Response.Write(s2);
                // Response.Write(s3);
                int yr = Convert.ToInt32(s1);
                int mon = Convert.ToInt32(s2);
                int day = Convert.ToInt32(s3);
                DateTime dateValue = new DateTime(yr, mon, day);
                s = dateValue.ToString("ddd");
                // Here Here !!!!!
                CMySql mysqlConn = CMySql.Instance;
                DataTable _resultTable = new DataTable();
                // Response.Write(dropfrom.Text);
                //Response.Write(dropto.Text);
                _resultTable = mysqlConn.Read("select *from railway.train where days like'%" + s + "%' and Station_list like '%" + dropfrom.SelectedItem.Text + "%' and Station_list like '%" + dropto.Text + "%' and State= 'On'");
                // _resultTable = mysqlConn.Read("select *from railway.train where days like'%" + s + "%'");
                droptrain.DataValueField = "Train";
                droptrain.DataTextField = "Train";
                droptrain.DataSource = _resultTable;
                droptrain.DataBind();
            }
            catch(Exception ex)
            {
                string value = ex.Message;
                ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "Alert1", "alert(\"" + value + "\");", true);
            }
        }

        protected void txtstart_TextChanged(object sender, EventArgs e)
        {

        }

        protected void dropfrom_Load(object sender, EventArgs e)
        {

        }

        protected void dropto_Load(object sender, EventArgs e)
        {
           
        }

        protected void droptrain_TextChanged(object sender, EventArgs e)
        {
          
        }

        protected void droptrain_SelectedIndexChanged(object sender, EventArgs e)
        {
            s = droptrain.Text;
        }

        protected void btnplace_Click(object sender, EventArgs e)
        {
            try
            {
                CMySql mysqlConn = CMySql.Instance;
                DataTable _resultTable = new DataTable();
                _resultTable = mysqlConn.Read("select *from railway.station");
                dropto.DataValueField = "Station";
                dropto.DataTextField = "Station";
                dropto.DataSource = _resultTable;
                dropto.DataBind();
                dropfrom.DataValueField = "Station";
                dropfrom.DataTextField = "Station";
                dropfrom.DataSource = _resultTable;
                dropfrom.DataBind();
            }
            catch(Exception ex)
            {
                string value = ex.Message;
                ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "Alert1", "alert(\"" + value + "\");", true);
            }
        }

        protected void btnpay_Click(object sender, EventArgs e)
        {
            try
            {
                txtamo.Text = CMySql.money.ToString();
                //Response.Write(money.ToString());
                amount = amount - CMySql.money;
                string value = "Balance Remaining is :" + amount.ToString() + " and Amount is : " + CMySql.money.ToString();
                ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "Alert1", "alert(\"" + value + "\");", true);
            }
            catch(Exception ex)
            {
                string value = ex.Message;
                ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "Alert1", "alert(\"" + value + "\");", true);
            }
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                int value1 = Convert.ToInt32((dropfrom.SelectedItem.Text).Substring(8, 2));// Change here
               // Response.Write(value1);
                int value2 = Convert.ToInt32((dropto.SelectedItem.Text).Substring(8, 2));
                // Response.Write(value1.ToString());
                //Response.Write(value2.ToString());
                if ((value1 - value2) == 1 || (value1 - value2) == -1) CMySql.money = CMySql.money + 10;
                if ((value1 - value2) == 2 || (value1 - value2) == -2) CMySql.money = CMySql.money + 20;
                if ((value1 - value2) == 3 || (value1 - value2) == -3) CMySql.money = CMySql.money + 30;
                if ((value1 - value2) == 4 || (value1 - value2) == -4) CMySql.money = CMySql.money + 40;
                if ((value1 - value2) == 5 || (value1 - value2) == -5) CMySql.money = CMySql.money + 50;
                if ((value1 - value2) == 6 || (value1 - value2) == -6) CMySql.money = CMySql.money + 60;
                if ((value1 - value2) == 7 || (value1 - value2) == -7) CMySql.money = CMySql.money + 70;
                if ((value1 - value2) == 8 || (value1 - value2) == -8) CMySql.money = CMySql.money + 80;
                if ((value1 - value2) == 9 || (value1 - value2) == -9) CMySql.money = CMySql.money + 90;
                if ((value1 - value2) == 10 || (value1 - value2) == -10) CMySql.money = CMySql.money + 100;
                if ((value1 - value2) == 11 || (value1 - value2) == -11) CMySql.money = CMySql.money + 110;
                if ((value1 - value2) == 12 || (value1 - value2) == -12) CMySql.money = CMySql.money + 120;
                if ((value1 - value2) == 13 || (value1 - value2) == -13) CMySql.money = CMySql.money + 130;
                if ((value1 - value2) == 14 || (value1 - value2) == -14) CMySql.money = CMySql.money + 140;
                if ((value1 - value2) == 15 || (value1 - value2) == -15) CMySql.money = CMySql.money + 150;
                if ((value1 - value2) == 16 || (value1 - value2) == -16) CMySql.money = CMySql.money + 160;
                if ((value1 - value2) == 17 || (value1 - value2) == -17) CMySql.money = CMySql.money + 170;
                if ((value1 - value2) == 18 || (value1 - value2) == -18) CMySql.money = CMySql.money + 180;
                if ((value1 - value2) == 19 || (value1 - value2) == -19) CMySql.money = CMySql.money + 190;

                passengers.Add(txtpass.Text);
                age.Add(Convert.ToInt32(txtage.Text));
            }
            catch (Exception ex)
            {
                string value = ex.Message;
                ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "Alert1", "alert(\"" + value + "\");", true);
            }
        }

        protected void txtage_TextChanged(object sender, EventArgs e)
        {

        }

        protected void btnbook_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtacc.Text == account.ToString())
                {
                    if ((amount - CMySql.money) >= 0)
                    {
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
                        else
                        {
                            CMySql.ticket = 1;
                            password = "0";
                        }
                        password = (Convert.ToInt32(password) + 1).ToString();
                        amount = amount - CMySql.money;
                        mysqlConn.Connect("localhost", "Database", "root", "root");
                        string Query = "";
                        Query = "update railway.userdata set u_amount ='" + amount.ToString() + "' where u_bank ='" + account.ToString() + "'";
                        mysqlConn.Execute(Query);
                        Query = "insert into railway.bookings values ('" + CMySql.userdata + "','" + password + "','" + CMySql.ticket.ToString() + "','" + CMySql.date + "','" + CMySql.money.ToString() + "')";
                        // Response.Write(Query);
                        // Response.Write(CMySql.date.ToString());
                        //Response.Write(CMySql.money.ToString());
                        mysqlConn.Execute(Query);
                        Query = "update railway.bookings set pre = '" + password + "'";
                        mysqlConn.Execute(Query);
                        string value = "Transaction Successful and Remaining Balance is : " + amount.ToString();
                        ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "Alert1", "alert(\"" + value + "\");", true);
                    }
                    else Response.Write("<script>alert('Low Balance');</script>");
                }
                else Response.Write("<script>alert('Incorrect Account Number');</script>");
            }
            catch(Exception ex)
            {
                string value = ex.Message;
                ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "Alert1", "alert(\"" + value + "\");", true);
            }
        }
    }
}
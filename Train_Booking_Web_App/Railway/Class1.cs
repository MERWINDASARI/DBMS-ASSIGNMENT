using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MySql.Data.MySqlClient;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace Railway
{
    class CMySql
    {
        private MySqlConnection _conn;
        private MySqlCommand _cmd;
        private MySqlDataReader _reader;

        private static CMySql _instance;
        string connectionString = "";

        public string user = "";
        private CMySql() { }

        public static string userdata { get; set; }
        public static int money { get; set; }
        public static int ticket { get; set; }
        public static string date { get; set; }
        public static CMySql Instance
        {
            get
            {
                if (_instance == null)
                {
                    //Create a new instance if it is not already done.
                    _instance = new CMySql();
                }
                return _instance;
            }
        }

        public bool isConnected
        {
            get { return _conn.State == ConnectionState.Open; }
        }


        public void Connect(string conStr)
        {
            try
            {
                if (_conn == null)
                {
                    //Make the connection
                    _conn = new MySqlConnection(conStr);
                    //Open the connection
                    _conn.Open();
                }
            }
            catch (Exception ex)
            {
               
            }
        }


        public void Connect(string ip, string db, string uid, string pw)
        {

            connectionString = @"Data Source=" + ip + ";Database=" + db + ";Uid=" + uid + ";Pwd=" + pw + ";Allow User Variables=True";
            try
            {
                if (_conn == null)
                {
                    //Make the connection
                    _conn = new MySqlConnection(connectionString);
                    //Open the connection
                    _conn.Open();
                }
            }
            catch (Exception ex)
            {
               
            }
        }

        public void Close()
        {
            try
            {
                if (isConnected)
                {
                    //Close the connection
                    _conn.Close();
                }
            }
            catch (Exception ex)
            {
              
            }
        }


        public DataTable Read(string query)
        {
            DataTable _resultTable = new DataTable();

            try
            {
                //Only procede if there is a connection. Return null otherwise.

                if (!isConnected)
                {
                    //Make the connection
                    _conn = new MySqlConnection(connectionString);
                    //Open the connection
                    _conn.Open();
                }

                //Create the command with the gien query
                _cmd = new MySqlCommand(query, _conn);

                //We need MySqlDataAdapter to store all rows in the datatable
                using (MySqlDataAdapter adapter = new MySqlDataAdapter(_cmd))
                {
                    adapter.Fill(_resultTable);
                }
                _conn.Close();
            }
            catch 
            {
               // Response.Write("<script>alert('Error');</script>");
            }

            return _resultTable;
        }

        public void Execute(string query)
        {
            //Only procede if there is a connection. Return null otherwise.
            if (!isConnected)
            {
                //Make the connection
                _conn = new MySqlConnection(connectionString);
                //Open the connection
                _conn.Open();
            }

            //Create the command with the given query
            _cmd = new MySqlCommand(query, _conn);
            _reader = _cmd.ExecuteReader();
            while (_reader.Read())
            {
                // wait till query gets completed
            }
            _conn.Close();
        }

    }
}

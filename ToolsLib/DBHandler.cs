using Npgsql;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ToolsLib
{
    class DBHandler
    {
        string connString = string.Empty;

        public DBHandler(string connectionString)
        {
            this.connString = connectionString;
        }

        public int ExecuteNonQuery(string query)
        {
            int currentRows = 0;

            using (NpgsqlConnection con = new NpgsqlConnection(connString))
            {
                con.Open();

                using (NpgsqlCommand cmd = new NpgsqlCommand(query, con))
                {
                    cmd.CommandTimeout = 1000;
                    currentRows = cmd.ExecuteNonQuery();
                }

                con.Close();
            }

            return currentRows;
        }

        public DataTable GetDataTable(string query)
        {
            DataTable dt = new DataTable();

            using (NpgsqlDataAdapter adp = new NpgsqlDataAdapter(query, connString))
            {
                adp.Fill(dt);
            }

            return dt;
        }
    }
}

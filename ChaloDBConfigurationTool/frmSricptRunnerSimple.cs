using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.IO;
using System.Reflection;

namespace ChaloDBConfigurationTool
{
    public partial class frmSricptRunnerSimple : Form
    {
        public string Host = string.Empty;
        public string Port = string.Empty;
        public string UserId = string.Empty;
        public string Password = string.Empty;
        public string SuperConnString = string.Empty;

        public frmSricptRunnerSimple()
        {
            InitializeComponent();
        }

        private string GetConnectionString(string dbName)
        {
            string connString = string.Format("SERVER={0};Port={1};Database={2};User id={2};Password={2};encoding=unicode",
                Host,Port,dbName);

            return connString;
        }

        private void btnRunDataDBScript_Click(object sender, EventArgs e)
        {
            string connString = GetConnectionString(tbDataDBName.Text);
            DBHandler dbMan = new DBHandler(connString);
            string filePath = Path.GetDirectoryName(Assembly.GetExecutingAssembly().Location) + "\\BGT_Data_DB_Script.sql";
            try
            {
                string query = File.ReadAllText(filePath);
                query = query.Replace("AOXX",tbDataDBName.Text);
                dbMan.ExecuteNonQuery(query);
            }

            catch (Exception ex)
            {
                MessageBox.Show("Error occured while excuting script:"+ex.Message);
            }
        }
    }
}

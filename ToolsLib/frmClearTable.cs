using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ToolsLib
{
    partial class frmClearTable : Form
    {
        List<string> tableNameList = new List<string>();

        public frmClearTable()
        {
            InitializeComponent();
        }

        private void frmClearTable_Load(object sender, EventArgs e)
        {
            tableNameList.Add("bgtdomains");
            tableNameList.Add("sys_authorization");
            tableNameList.Add("sys_commonfunctions");
        }

        private void btnClearTable_Click(object sender, EventArgs e)
        {
            try
            {
                DBHandler dbHandler = new DBHandler(ToolConfig.GetSuperConnectionString());
                DataTable dt = new DataTable();

                if (!string.IsNullOrEmpty(txtDbName.Text))
                {
                    string dbName = txtDbName.Text.Trim();
                    dt = dbHandler.GetDataTable(QueryProvider.GetSQLFor_DatabaseExist(dbName));

                    if (dt.Rows.Count == 1)
                    {
                        dbHandler = new DBHandler(ToolConfig.GetDBConnectionString(dbName));   //new dbHandler with db connection string

                        dbHandler.ExecuteNonQuery(QueryProvider.GetSQLFor_TruncateTable(tableNameList));

                        MessageBox.Show("Cleaned");
                        this.Close();
                    }
                    else
                    {
                        MessageBox.Show("Database does not exit");
                    }   
                }               
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }      
        }

        private void btnCancel_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}

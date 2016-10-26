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
    partial class frmChangeOwner : Form
    {
        public frmChangeOwner()
        {
            InitializeComponent();
        }

        private void frmChangeOwner_Load(object sender, EventArgs e)
        {
            try
            {
                DataTable dt = new DataTable();
                DBHandler dbHandler = new DBHandler(ToolConfig.GetSuperConnectionString());
                dt = dbHandler.GetDataTable(QueryProvider.GetSQLFor_GetAllRole());

                cmbOwnerName.DataSource = dt;
                cmbOwnerName.DisplayMember = "rolname";
                cmbOwnerName.ValueMember = "rolname";
                cmbOwnerName.BindingContext = this.BindingContext;
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

        private void btnChange_Click(object sender, EventArgs e)
        {
            try
            {
                DBHandler dbHandler = new DBHandler(ToolConfig.GetSuperConnectionString());
                DataTable dt = new DataTable();

                string dbName = cmbOwnerName.SelectedValue.ToString();
                //string dbName = "testDB";
                string newOwner = cmbOwnerName.SelectedValue.ToString();

                dt = dbHandler.GetDataTable(QueryProvider.GetSQLFor_DatabaseExist(dbName));

                if (dt.Rows.Count == 1)
                {
                    //dbHandler.ExecuteNonQuery(QueryProvider.GetSQLFor_ChangeDBRole(dbName, newOwner));

                    dbHandler = new DBHandler(ToolConfig.GetDBConnectionString(dbName));  //new dbHandler with db connection string

                    DataTable tableName = new DataTable();
                    tableName = dbHandler.GetDataTable(QueryProvider.GetSQLFor_GetTableName());
                    foreach (DataRow dr in tableName.Rows)
                    {
                        dbHandler.ExecuteNonQuery(QueryProvider.GetSQLFor_ChangeOwner(dr["table_name"].ToString(), newOwner));
                    }

                    DataTable viewName = new DataTable();
                    viewName = dbHandler.GetDataTable(QueryProvider.GetSQLFor_GetViewsName());
                    foreach(DataRow dr in viewName.Rows)
                    {
                        dbHandler.ExecuteNonQuery(QueryProvider.GetSQLFor_ChangeOwner(dr["table_name"].ToString(), newOwner));
                    }

                    MessageBox.Show("Changed");
                    this.Close();
                }
                else
                {
                    MessageBox.Show("Database does not exist.");
                }
                
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }


        }
    }
}

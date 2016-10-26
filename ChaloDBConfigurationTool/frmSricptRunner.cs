using DBInstaller;
using System;
using System.Data;
using System.Windows.Forms;
using ToolsLib;

namespace ChaloDBConfigurationTool
{
    public partial class frmSricptRunner : Form
    {
        //public string Host = string.Empty;
        //public string Port = string.Empty;
        public string UserId = string.Empty;
        public string Password = string.Empty;
      //  public string SuperConnString = string.Empty;

        private string sysDBName = string.Empty;
        private string projectDBName = string.Empty;
        private string templateDBName = string.Empty;
        private string organization = string.Empty;
        private string precision = string.Empty;

        QueryProvider queryProvider = new QueryProvider();

        public frmSricptRunner()
        {
            InitializeComponent();
        }

        private void frmSricptRunner_Load(object sender, EventArgs e)
        {
            tbProjectDB.Select();

            DBHandler dbMan = new DBHandler(Config.GetSuperConnectionString());
            try
            {
                DataTable dtDatabases = dbMan.GetDataTable(queryProvider.GetSQLFor_GetAllDatabase());
                BindCombo(dtDatabases);
                cbMethod.SelectedIndex = 6;
                SetComboItem();
            }

            catch(Exception ex)
            {
                MessageBox.Show("Error while loading database info:"+ex.Message);
            }
        }

        private void btnRunSysDBScript_Click(object sender, EventArgs e)
        {
            if (IsDataDBValid())
            {
                //show user setup form
                frmUserInfo userInfo = new frmUserInfo();

               // userInfo.SuperConnString = this.SuperConnString;
               // userInfo.Host = this.Host;
               // userInfo.Port = this.Port;

              //  userInfo.Password = this.Password;
             //   userInfo.UserId = this.UserId;

                userInfo.ProjectDBName = projectDBName.ToUpper();
                //userInfo.SysDBName = sysDBName;
                Config.SysDbName = sysDBName;
                //userInfo.TemplateDBName = templateDBName;
                Config.TemplateDBName = templateDBName;
                userInfo.Organization = tbOrganization.Text;
                userInfo.Precision = tbPrecision.Text;
                userInfo.MethodIndex = cbMethod.SelectedIndex.ToString();
                userInfo.MethodName = cbMethod.SelectedItem.ToString();
                userInfo.Date = dtpDate.Value.ToShortDateString();
                userInfo.CreateNg = ckbCreateNG.Checked;

                userInfo.Bronhouder = txtBronhouder.Text;
                userInfo.ApplicationName = txtApplicationName.Text;
                userInfo.Administration = txtAdministration.Text;
                userInfo.ReferencePrefix = txtReferencePrefix.Text;
                userInfo.IdentificationPrefix = txtIdentificationPrefix.Text;
                userInfo.MsgToelichting = txtMsgToelichiting.Text;

                this.Hide();
                userInfo.Show();
            }
        }

        private void BindCombo(DataTable dtDatabases)
        {
            DataRow row = dtDatabases.NewRow();
            row["datname"] = "Select";
            dtDatabases.Rows.InsertAt(row, 0);

            DataTable dtSysDbs = dtDatabases.Copy();
            DataTable dtTemplateDbs = dtDatabases.Copy();

            //
            cmbProjectDB.DataSource = dtDatabases;
            cmbProjectDB.DisplayMember = "datname";
            cmbProjectDB.ValueMember = "datname";
            //
            cmbSysDb.DataSource = dtSysDbs;
            cmbSysDb.DisplayMember = "datname";
            cmbSysDb.ValueMember = "datname";
            //
            cmbTemplateDB.DataSource = dtTemplateDbs;
            cmbTemplateDB.DisplayMember = "datname";
            cmbTemplateDB.ValueMember = "datname";
        }

        private bool IsDataDBValid()
        {
            if (rbInputDB.Checked)
            {
                if (string.IsNullOrEmpty(tbProjectDB.Text))
                {
                    MessageBox.Show("Project database name can not be empty");
                    return false;
                }

                projectDBName = tbProjectDB.Text.ToUpper();
            }
            else
            {
                if (cmbProjectDB.SelectedIndex <= 0)
                {
                    MessageBox.Show("Please select a project database");
                    return false;
                }

                projectDBName = cmbProjectDB.SelectedValue.ToString();
            }

            if (cmbSysDb.SelectedIndex <= 0)
            {
                MessageBox.Show("Please select sys database");
                return false;
            }

            sysDBName = cmbSysDb.SelectedValue.ToString();

            if (cmbTemplateDB.SelectedIndex <= 0)
            {
                MessageBox.Show("Please select template database");
                return false;
            }

            templateDBName = cmbTemplateDB.SelectedValue.ToString();

            if (!tbOrganization.Text.StartsWith("G") || tbOrganization.Text.Length != 5)
            {
                MessageBox.Show("Invalid organization. Must be 5 character long and start with 'G'");
                return false;
            }

            organization = tbOrganization.Text;

            int prec = -1;
            if (!int.TryParse(tbPrecision.Text, out prec))
            {
                MessageBox.Show("Invalid precision. Must be integer");
                return false;
            }

            precision = tbPrecision.Text;

            if (string.IsNullOrEmpty(txtBronhouder.Text))
            {
                MessageBox.Show("Sender bronhouder can not be empty");
                return false;
            }

            if (string.IsNullOrEmpty(txtAdministration.Text))
            {
                MessageBox.Show("Sender administration can not be empty");
                return false;
            }

            return true;
        }

        private void SetComboItem()
        {
            DataTable dt = (DataTable)cmbSysDb.DataSource;
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                string item = dt.Rows[i][cmbSysDb.ValueMember].ToString();
                if (item.Contains("sample") || item.Contains("postgis")) cmbTemplateDB.SelectedIndex = i;
                else if (item.ToUpper().Contains("BGT")) cmbSysDb.SelectedIndex = i;
            }
        }

        private void frmSricptRunner_FormClosing(object sender, FormClosingEventArgs e)
        {
            Application.Exit();
        }

        private void clearTableToolStripMenuItem_Click(object sender, EventArgs e)
        {
            ToolHelper toolHelper = new ToolHelper();
            toolHelper.ClearTable();
        }

        private void changeOwnerToolStripMenuItem_Click(object sender, EventArgs e)
        {
            ToolHelper toolHelper = new ToolHelper();
            toolHelper.ChangeOwner();
        }

        private void txtBronhouder_TextChanged(object sender, EventArgs e)
        {
            txtIdentificationPrefix.Text = txtBronhouder.Text + ".8A";
        }
    }
}

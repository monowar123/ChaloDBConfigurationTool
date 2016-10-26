using System;
using System.Data;
using System.Windows.Forms;
using System.Threading;
using System.Reflection;
using System.IO;
using System.Text.RegularExpressions;
using PasswordCrypto;
using DBInstaller;
using Npgsql;

namespace ChaloDBConfigurationTool
{
    public partial class frmUserInfo : Form
    {
        QueryProvider queryProvider = new QueryProvider();
        bool success = true;
        string sysSuperUserId = string.Empty;
        string sysSuperUserName = string.Empty;
        string sysSuperUserPassword = string.Empty;

        DBInstall _dbInstall = new DBInstall();

        // public string Host = string.Empty;
        //  public string Port = string.Empty;
        //  public string UserId = string.Empty;
        //  public string Password = string.Empty;
        //  public string SuperConnString = string.Empty;

        //public string SysDBName
        //{
        //    get;
        //    set;
        //}

        public string ProjectDBName
        {
            get;
            set;
        }

        public string TemplateDBName
        {
            get;
            set;
        }

        public string Organization
        {
            get;
            set;
        }

        public string Precision
        {
            get;
            set;
        }

        public string MethodIndex
        {
            get;
            set;
        }

        public string MethodName
        {
            get;
            set;
        }

        public string Date
        {
            get;
            set;
        }

        public bool CreateNg
        {
            get;
            set;
        }

        public string Bronhouder
        {
            get;
            set;
        }

        public string ApplicationName
        {
            get;
            set;
        }

        public string Administration
        {
            get;
            set;
        }

        public string ReferencePrefix
        {
            get;
            set;
        }

        public string IdentificationPrefix
        {
            get;
            set;
        }

        public string MsgToelichting
        {
            get;
            set;
        }

        public string TeamleadUserID
        {
            get { return tbxSuperUserEmail.Text.Trim(); }
        }

        public string TeamleadUserName
        {
            get { return tbxSuperUserName.Text.Trim(); }
        }

        public string TeamleadUserPassword
        {
            get { return tbxSuperUserPass.Text.Trim(); }
        }

        public string GuestUserID
        {
            get { return tbxGuestUserEmail.Text.Trim(); }
        }

        public string GuestUserName
        {
            get { return tbxGuestUserName.Text.Trim(); }
        }

        public string GuestUserPassword
        {
            get { return tbxGuestUserPass.Text.Trim(); }
        }

        public string ErrorMsg
        {
            get;
            set;
        }

        public frmUserInfo()
        {
            InitializeComponent();
        }

        private void pbSperPass_MouseDown(object sender, MouseEventArgs e)
        {
            tbxSuperUserPass.UseSystemPasswordChar = false;
        }

        private void pbSperPass_MouseUp(object sender, MouseEventArgs e)
        {
            tbxSuperUserPass.UseSystemPasswordChar = true;
        }

        private void pbGuestPass_MouseDown(object sender, MouseEventArgs e)
        {
            tbxGuestUserPass.UseSystemPasswordChar = false;
        }

        private void pbGuestPass_MouseUp(object sender, MouseEventArgs e)
        {
            tbxGuestUserPass.UseSystemPasswordChar = true;
        }

        private void btnInstall_Click(object sender, EventArgs e)
        {
            if (ValidateInfo())
            {
                pbDBInstall.Select();
                btnInstall.Visible = false;
                btnBack.Visible = false;
                lblWaitingtxt.Visible = true;
                pbDBInstall.Visible = true;
                Application.DoEvents();
                Thread.Sleep(1000);

                if (CreateNg)
                {
                    pbDBInstall.Maximum = 11;
                }

                try
                {
                    string superDBConnectionString = Config.GetSuperConnectionString();
                    string sysDBConnectionString = Config.GetSysDBConnectionString();
                    string projectDBConnectionString = Config.GetProjectDBConnectionString(ProjectDBName);
                    string changeOwnerConnectionString = Config.GetChangeOwnerConnectionString(ProjectDBName);

                    //create role
                    DataTable dtRole = _dbInstall.CheckRoleExist(superDBConnectionString, ProjectDBName.ToUpper());

                    if (dtRole.Rows.Count <= 0)
                    {
                        _dbInstall.CreateRole(superDBConnectionString, ProjectDBName.ToUpper());
                    }
                    ProgressBarUpdate();
                    LogWrite("User Role Installed.");
                    

                    //create database
                    bool createDb = true;
                    DataTable dtDB = _dbInstall.CheckDatabaseExist(superDBConnectionString, ProjectDBName.ToUpper());

                    if (dtDB.Rows.Count > 0)
                    {
                        if (Config.Host == "37.34.53.43")
                        {
                            MessageBox.Show("Database already exist");
                            pbDBInstall.Value = 0;
                            pbDBInstall.Visible = false;
                            lblWaitingtxt.Visible = false;
                            btnInstall.Visible = true;
                            btnBack.Visible = true;
                            return;
                        }

                        if (MessageBox.Show("Database already exist. Sure to replace it?", "Replace", MessageBoxButtons.YesNo) == System.Windows.Forms.DialogResult.Yes)
                        {
                            if (!_dbInstall.DeleteDB(Config.GetSuperConnectionString(), ProjectDBName.ToUpper()))
                            {
                                success = false;
                                ErrorMsg = string.Format("Can not delete database: {0}. Please delete the database manually and run installer again.", ProjectDBName);
                                OpenSummaryWindow();
                                return;
                            }
                        }
                        else createDb = false;
                    }

                    if (createDb)
                    {
                        _dbInstall.CreateDatabase(superDBConnectionString, ProjectDBName.ToUpper(), Config.TemplateDBName);
                    }
                    ProgressBarUpdate();
                    LogWrite("Database Created.");

                    //chnage owner
                    _dbInstall.ChangeOwner(changeOwnerConnectionString, ProjectDBName.ToUpper());
                    ProgressBarUpdate();
                    LogWrite("Owner is changed.");

                    using (NpgsqlConnection pgConn = new NpgsqlConnection(sysDBConnectionString))
                    {
                        pgConn.Open();

                        using (NpgsqlTransaction tran = pgConn.BeginTransaction())
                        {
                            // Sys
                            _dbInstall.Sys_Delete_Prev_Data(sysDBConnectionString, "Sys_BGT_DB\\1BGT_Sys_DB_Script_DELETE.sql", ProjectDBName, sysSuperUserId, TeamleadUserID, GuestUserID);
                            ProgressBarUpdate();
                            LogWrite("Sys table is clean.");

                            
                            _dbInstall.Sys_Install_Role_Independent_Data(sysDBConnectionString, "Sys_BGT_DB\\2BGT_Sys_DB_Script_Role_Independend_Entry-Reports.sql", ProjectDBName, Config.Port);
                            LogWrite("Sys Role independent entry-reports data installed.");
                            ProgressBarUpdate();


                            _dbInstall.Sys_Install_Role_Independent_Data(sysDBConnectionString, "Sys_BGT_DB\\3BGT_Sys_DB_Script_Role_Independend-Report_Functions.sql", ProjectDBName, Config.Port);
                            LogWrite("Role independent report functions installed.");                
                            ProgressBarUpdate();


                            _dbInstall.Sys_Install_Role_Independent_Data(sysDBConnectionString, "Sys_BGT_DB\\4BGT_Sys_DB_Script_Role_Independend-Metadata.sql", ProjectDBName, Config.Port);
                            ProgressBarUpdate();
                            LogWrite("Role independent metadata installed.");

                            _dbInstall.Sys_Install_SuperRole(sysDBConnectionString, "Sys_BGT_DB\\5BGT_Sys_DB_Script_SUPER.sql", ProjectDBName, sysSuperUserName, sysSuperUserId, sysSuperUserPassword);
                            LogWrite("Super Role Installed.");
                            _dbInstall.Sys_Install_TeamleadRole(sysDBConnectionString, "Sys_BGT_DB\\5BGT_Sys_DB_Script_Teamlead.sql", ProjectDBName, TeamleadUserName, TeamleadUserID, TeamleadUserPassword);
                            LogWrite("Teamlead Role Installed.");
                            _dbInstall.Sys_Install_GuestRole(sysDBConnectionString, "Sys_BGT_DB\\5BGT_Sys_DB_Script_Guest.sql", ProjectDBName, GuestUserName, GuestUserID, GuestUserPassword);
                            LogWrite("Guest Role Installed.");
                        
                            //dsah-board entry
                            _dbInstall.Sys_Install_Role_Independent_Data(sysDBConnectionString, "Sys_BGT_DB\\6BGT_Sys_DB_Script_Dashboard.sql", ProjectDBName, Config.Port);
                            LogWrite("Dashboard installed.");
                            ProgressBarUpdate();
                            

                            tran.Commit();
                            pgConn.Clone();
                        }
                    }

                    // Project
                    _dbInstall.Install_ProjectData(projectDBConnectionString, "AOXX_DB\\1Tables.sql", ProjectDBName, Organization, MethodIndex, MethodName, Precision, Date);
                    _dbInstall.Install_ProjectData(projectDBConnectionString, "AOXX_DB\\2Tables_Index.sql", ProjectDBName, Organization, MethodIndex, MethodName, Precision, Date);
                    _dbInstall.Install_ProjectData(projectDBConnectionString, "AOXX_DB\\3Tables_Trigger.sql", ProjectDBName, Organization, MethodIndex, MethodName, Precision, Date);

                    _dbInstall.Install_ProjectData(projectDBConnectionString, "AOXX_DB\\4Tables_values.sql", ProjectDBName, Organization, MethodIndex, MethodName, Precision, Date,
                                                                    Bronhouder, ApplicationName, Administration, ReferencePrefix, IdentificationPrefix, MsgToelichting);

                    _dbInstall.Install_ProjectData(projectDBConnectionString, "AOXX_DB\\5Functions.sql", ProjectDBName, Organization, MethodIndex, MethodName, Precision, Date);
                    _dbInstall.Install_ProjectData(projectDBConnectionString, "AOXX_DB\\6Views.sql", ProjectDBName, Organization, MethodIndex, MethodName, Precision, Date);
                    _dbInstall.Install_ProjectData(projectDBConnectionString, "AOXX_DB\\7GT_Views.sql", ProjectDBName, Organization, MethodIndex, MethodName, Precision, Date);
                    ProgressBarUpdate();
                    LogWrite("Project data installed.");

                    //run ned graphics db script
                    if (CreateNg)
                    {
                        using (NpgsqlConnection pgConn = new NpgsqlConnection(sysDBConnectionString))
                        {
                            pgConn.Open();
                            using (NpgsqlTransaction tran = pgConn.BeginTransaction())
                            {
                                _dbInstall.Install_NedGraphics_Sys(sysDBConnectionString, "NG\\NedGraphics_ChaloIS_SYS_TABLES_SuperUser.sql", ProjectDBName, Config.Port);
                                ProgressBarUpdate();
                                LogWrite("Ned Graphics Sys data installed.");

                                _dbInstall.Install_NedGraphics_Projects(projectDBConnectionString, "NG\\NedGraphics_Script.sql", ProjectDBName);
                                ProgressBarUpdate();
                                LogWrite("Ned Graphics Project data installed.");

                                tran.Commit();
                                pgConn.Close();
                            }
                        }
                    }

                    success = true;
                    LogWrite("Installation is successful.");
                }

                catch (Exception ex)
                {
                    LogWrite(ex.Message.ToString());
                    success = false;
                    ErrorMsg = ex.Message;
                    RollBack();
                }

                OpenSummaryWindow();
                pbDBInstall.Value = 0;
            }
        }

        private void OpenSummaryWindow()
        {
            frmInstallSummary insSumm = new frmInstallSummary(this, success);
            this.Hide();
            insSumm.ShowDialog();

            this.Close();
        }
        private void ProgressBarUpdate()
        {
            Thread.Sleep(500);
            pbDBInstall.PerformStep();
            Application.DoEvents();
        }
        private void LogWrite(string message)
        {
            DBInstaller.LogWriter.WriteLog(message);
        }
        private bool ValidateInfo()
        {
            bool isValid = true;
            epUserInfo.Clear();

            if (tbxSuperUserName.Text.Trim() == string.Empty)
            {
                epUserInfo.SetError(tbxSuperUserName, "User name can not be empty");
                isValid = false;
            }

            if (tbxSuperUserEmail.Text.Trim() == string.Empty)
            {
                epUserInfo.SetError(tbxSuperUserEmail, "User ID can not be empty");
                isValid = false;
            }
            else if (!IsValidEmail(tbxSuperUserEmail.Text))
            {
                epUserInfo.SetError(tbxSuperUserEmail, "Invalid email");
                isValid = false;
            }
            else if (_dbInstall.UserExist(Config.GetSysDBConnectionString(), tbxSuperUserEmail.Text.Trim(), ProjectDBName))
            {
                epUserInfo.SetError(tbxSuperUserEmail, "User already exist!");
                isValid = false;
            }

            if (tbxSuperUserPass.Text.Trim() == string.Empty)
            {
                epUserInfo.SetError(tbxSuperUserPass, "Password can not be empty");
                isValid = false;
            }

            if (tbxSuperUserPass.Text.Trim() != tbxSuperUserConfirmPass.Text.Trim())
            {
                epUserInfo.SetError(tbxSuperUserConfirmPass, "Password does'nt match");
                isValid = false;
            }

            //guest validation
            if (tbxGuestUserName.Text.Trim() == string.Empty)
            {
                epUserInfo.SetError(tbxGuestUserName, "User name can not be empty");
                isValid = false;
            }

            if (tbxGuestUserEmail.Text.Trim() == string.Empty)
            {
                epUserInfo.SetError(tbxGuestUserEmail, "User ID can not be empty");
                isValid = false;
            }
            else if (!IsValidEmail(tbxGuestUserEmail.Text))
            {
                epUserInfo.SetError(tbxGuestUserEmail, "Invalid email");
                isValid = false;
            }
            else if (_dbInstall.UserExist(Config.GetSysDBConnectionString(), tbxGuestUserEmail.Text.Trim(), ProjectDBName))
            {
                epUserInfo.SetError(tbxGuestUserEmail, "User already exist!");
                isValid = false;
            }

            if (tbxGuestUserPass.Text.Trim() == string.Empty)
            {
                epUserInfo.SetError(tbxGuestUserPass, "Password can not be empty");
                isValid = false;
            }

            if (tbxGuestUserPass.Text.Trim() != tbxGuestUserConfirmPass.Text.Trim())
            {
                epUserInfo.SetError(tbxGuestUserConfirmPass, "Passwords didn't match");
                isValid = false;
            }

            return isValid;
        }

        private void RollBack()
        {
            try
            {
                string sysScriptPath1 = Path.GetDirectoryName(Assembly.GetExecutingAssembly().Location) + "\\Scripts\\Sys_BGT_DB\\1BGT_Sys_DB_Script_DELETE.sql";
                DBHandler dbMan = new DBHandler(Config.GetSysDBConnectionString());

                string sysDBQuery = File.ReadAllText(sysScriptPath1);
                sysDBQuery = sysDBQuery.Replace("AOXX", ProjectDBName.ToUpper());
                sysDBQuery = sysDBQuery.Replace("SuperUserIDXX", TeamleadUserID);
                sysDBQuery = sysDBQuery.Replace("GuestUserIDXX", GuestUserID);
                dbMan.ExecuteNonQuery(sysDBQuery);

                //delete the project db
                if (!_dbInstall.DeleteDB(Config.GetSuperConnectionString(), ProjectDBName.ToUpper()))
                {
                    //ErrorMsg = string.Format("Can not delete database: {0}. Please delete the database manually and run installer again.", ProjectDBName);
                }
            }
            catch (Exception ex)
            {
                LogWrite(ex.Message.ToString());
            }
        }

        private void frmUserInfo_Load(object sender, EventArgs e)
        {
            tbxSuperUserName.Select();

            //default value for super user
            sysSuperUserName = string.Format("{0} Administrator", ProjectDBName);
            sysSuperUserId = string.Format("{0}Super@hawarit.com", ProjectDBName);
            sysSuperUserPassword = tbxSuperUserConfirmPass.Text = string.Format("{0}xnbgrwbgt@!", ProjectDBName);

            //for teamlead
            tbxSuperUserName.Text = string.Format("{0} Teamlead", ProjectDBName);
            tbxSuperUserEmail.Text = string.Format("{0}Teamlead@hawarit.com", ProjectDBName);
            tbxSuperUserPass.Text = tbxSuperUserConfirmPass.Text = string.Format("{0}tl!", ProjectDBName);

            tbxGuestUserName.Text = string.Format("{0}", ProjectDBName);
            tbxGuestUserEmail.Text = string.Format("{0}Guest@hawarit.com", ProjectDBName);
            tbxGuestUserPass.Text = tbxGuestUserConfirmPass.Text = string.Format("{0}!", ProjectDBName);
        }

        bool IsValidEmail(string email)
        {
            try
            {
                return Regex.IsMatch(email, @"\A(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?)\Z", RegexOptions.IgnoreCase);
            }
            catch (Exception ex)
            {
                LogWrite(ex.Message.ToString());
                return false;
            }
        }

        private void tbxSuperUserEmail_Leave(object sender, EventArgs e)
        {
            if (!IsValidEmail(tbxSuperUserEmail.Text))
            {
                epUserInfo.SetError(tbxSuperUserEmail, "Invalid email");
            }
            else epUserInfo.Clear();
        }

        private void tbxGuestUserEmail_Leave(object sender, EventArgs e)
        {
            if (!IsValidEmail(tbxGuestUserEmail.Text))
            {
                epUserInfo.SetError(tbxGuestUserEmail, "Invalid email");
            }
            else epUserInfo.Clear();
        }

        private void btnBack_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form pForm = Application.OpenForms["frmSricptRunner"];
            if (pForm != null) pForm.Show();
        }

        private void frmUserInfo_FormClosing(object sender, FormClosingEventArgs e)
        {
            Application.Exit();
        }
    }
}

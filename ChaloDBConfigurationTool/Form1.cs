using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using Npgsql;
using DBInstaller;
using ToolsLib;

namespace ChaloDBConfigurationTool
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void btnConnect_Click(object sender, EventArgs e)
        {
            if (ValidateInput())
            {
                Config.Host = tbHost.Text;
                Config.Port = tbPort.Text;
                Config.SuperUserId = tbUser.Text;
                Config.SuperPassword = tbPassword.Text;

                ToolConfig.Host = tbHost.Text;
                ToolConfig.Port = tbPort.Text;
                ToolConfig.SuperUserId = tbUser.Text;
                ToolConfig.SuperPassword = tbPassword.Text;

                string superConnString = Config.GetSuperConnectionString();// GetConnectionString();
                NpgsqlConnection connection = new NpgsqlConnection(superConnString);

                try
                {
                    connection.Open();

                    frmSricptRunner sqlRun = new frmSricptRunner();


                    //sqlRun.Host = tbHost.Text;
                    //sqlRun.Port = tbPort.Text;
                    //sqlRun.UserId = tbUser.Text;
                    //sqlRun.Password = tbPassword.Text;
                    //sqlRun.SuperConnString = superConnString;

                    connection.Close();
                    this.Hide();
                    sqlRun.Show();
                }

                catch (Exception ex)
                {
                    MessageBox.Show("Error connecting to database:" + ex.Message);
                }
            }
        }

        private string GetConnectionString()
        {
            string connString = string.Format("SERVER={0};Port={1};User id={2};Password={3};encoding=unicode",
                tbHost.Text, tbPort.Text,tbUser.Text, tbPassword.Text);

            return connString;
        }

        private bool ValidateInput()
        {
            if (tbHost.Text.Length == 0 || tbPort.Text.Length == 0 || tbUser.Text.Length == 0 || tbPassword.Text.Length == 0)
            {
                return false;
            }
            else
            {
                return true;
            }
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void btnInstallInCloud_Click(object sender, EventArgs e)
        {
            string host = "37.34.53.43";
            string port = "5432";
            string userId = "postgres";
            string password = "C5RejawReh";

            string connString = string.Format("SERVER={0};Port={1};User id={2};Password={3};encoding=unicode",
                host, port, userId, password);
            NpgsqlConnection connection = new NpgsqlConnection(connString);

            try
            {
                connection.Open();

                frmSricptRunner sqlRun = new frmSricptRunner();
                //sqlRun.Host = host;
                //sqlRun.Port = port;
                //sqlRun.UserId = userId;
                //sqlRun.Password = password;
                //sqlRun.SuperConnString = connString;

                Config.Host = host;
                Config.Port = port;
                Config.SuperUserId = userId;
                Config.SuperPassword = password;

                connection.Close();
                this.Hide();
                sqlRun.Show();
            }

            catch (Exception ex)
            {
                MessageBox.Show("Error connecting to database:" + ex.Message);
            }
        }
    }
}

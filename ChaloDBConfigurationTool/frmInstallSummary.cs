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
    public partial class frmInstallSummary : Form
    {
        frmUserInfo userInfo;
        bool insSuccess;

        public frmInstallSummary(frmUserInfo usrInfo,bool isSuccess)
        {
            InitializeComponent();
            this.userInfo = usrInfo;
            insSuccess = isSuccess;

            if (insSuccess)
            {
                lbGuestCred.Visible = true;
                lbTLCred.Visible = true;
                lbTLCred.Text = string.Format("Teamlead user/pass: {0}/{1}",userInfo.TeamleadUserID,userInfo.TeamleadUserPassword);
                lbGuestCred.Text = string.Format("Guest user/pass: {0}/{1}", userInfo.GuestUserID, userInfo.GuestUserPassword);
                lbDbCreation.Text = "Database installation for project " + userInfo.ProjectDBName + " is successful";
                
            }
            else
            {
                pictureBox1.Image = Image.FromFile("Images\\fail.png");
                lbDbCreation.Text = "Database installation for project " + userInfo.ProjectDBName + " is failed";
                rtbErrorMsg.Text = userInfo.ErrorMsg;
                rtbErrorMsg.ForeColor = Color.Red;
                if (!string.IsNullOrEmpty(rtbErrorMsg.Text)) rtbErrorMsg.Visible = true;
            }
        }

        private void frmInstallSummary_Load(object sender, EventArgs e)
        {
            
        }

        private void btnFinish_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}

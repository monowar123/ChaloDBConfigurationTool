namespace ChaloDBConfigurationTool
{
    partial class frmUserInfo
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmUserInfo));
            this.grpBoxSuperUser = new System.Windows.Forms.GroupBox();
            this.pbSperPass = new System.Windows.Forms.PictureBox();
            this.tbxSuperUserConfirmPass = new System.Windows.Forms.TextBox();
            this.tbxSuperUserPass = new System.Windows.Forms.TextBox();
            this.tbxSuperUserEmail = new System.Windows.Forms.TextBox();
            this.tbxSuperUserName = new System.Windows.Forms.TextBox();
            this.lblConfirmSuperUserPassword = new System.Windows.Forms.Label();
            this.lblSuperUserPass = new System.Windows.Forms.Label();
            this.lblSuperUserId = new System.Windows.Forms.Label();
            this.lblSuperUserName = new System.Windows.Forms.Label();
            this.grpBoxGuestUser = new System.Windows.Forms.GroupBox();
            this.pbGuestPass = new System.Windows.Forms.PictureBox();
            this.tbxGuestUserConfirmPass = new System.Windows.Forms.TextBox();
            this.tbxGuestUserPass = new System.Windows.Forms.TextBox();
            this.tbxGuestUserEmail = new System.Windows.Forms.TextBox();
            this.tbxGuestUserName = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.btnInstall = new System.Windows.Forms.Button();
            this.epUserInfo = new System.Windows.Forms.ErrorProvider(this.components);
            this.pbDBInstall = new System.Windows.Forms.ProgressBar();
            this.lblWaitingtxt = new System.Windows.Forms.Label();
            this.panel1 = new System.Windows.Forms.Panel();
            this.pictureBox1 = new System.Windows.Forms.PictureBox();
            this.pbBanner = new System.Windows.Forms.PictureBox();
            this.btnBack = new System.Windows.Forms.Button();
            this.grpBoxSuperUser.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pbSperPass)).BeginInit();
            this.grpBoxGuestUser.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pbGuestPass)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.epUserInfo)).BeginInit();
            this.panel1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.pbBanner)).BeginInit();
            this.SuspendLayout();
            // 
            // grpBoxSuperUser
            // 
            this.grpBoxSuperUser.Controls.Add(this.pbSperPass);
            this.grpBoxSuperUser.Controls.Add(this.tbxSuperUserConfirmPass);
            this.grpBoxSuperUser.Controls.Add(this.tbxSuperUserPass);
            this.grpBoxSuperUser.Controls.Add(this.tbxSuperUserEmail);
            this.grpBoxSuperUser.Controls.Add(this.tbxSuperUserName);
            this.grpBoxSuperUser.Controls.Add(this.lblConfirmSuperUserPassword);
            this.grpBoxSuperUser.Controls.Add(this.lblSuperUserPass);
            this.grpBoxSuperUser.Controls.Add(this.lblSuperUserId);
            this.grpBoxSuperUser.Controls.Add(this.lblSuperUserName);
            this.grpBoxSuperUser.ForeColor = System.Drawing.Color.Blue;
            this.grpBoxSuperUser.Location = new System.Drawing.Point(72, 42);
            this.grpBoxSuperUser.Name = "grpBoxSuperUser";
            this.grpBoxSuperUser.Size = new System.Drawing.Size(429, 133);
            this.grpBoxSuperUser.TabIndex = 0;
            this.grpBoxSuperUser.TabStop = false;
            this.grpBoxSuperUser.Text = "Create Teamlead user. Keep the default user info (Recommended)";
            // 
            // pbSperPass
            // 
            this.pbSperPass.Image = ((System.Drawing.Image)(resources.GetObject("pbSperPass.Image")));
            this.pbSperPass.Location = new System.Drawing.Point(277, 76);
            this.pbSperPass.Name = "pbSperPass";
            this.pbSperPass.Size = new System.Drawing.Size(24, 20);
            this.pbSperPass.TabIndex = 13;
            this.pbSperPass.TabStop = false;
            this.pbSperPass.MouseDown += new System.Windows.Forms.MouseEventHandler(this.pbSperPass_MouseDown);
            this.pbSperPass.MouseUp += new System.Windows.Forms.MouseEventHandler(this.pbSperPass_MouseUp);
            // 
            // tbxSuperUserConfirmPass
            // 
            this.tbxSuperUserConfirmPass.Location = new System.Drawing.Point(128, 103);
            this.tbxSuperUserConfirmPass.Name = "tbxSuperUserConfirmPass";
            this.tbxSuperUserConfirmPass.Size = new System.Drawing.Size(147, 20);
            this.tbxSuperUserConfirmPass.TabIndex = 3;
            this.tbxSuperUserConfirmPass.UseSystemPasswordChar = true;
            // 
            // tbxSuperUserPass
            // 
            this.tbxSuperUserPass.Location = new System.Drawing.Point(128, 77);
            this.tbxSuperUserPass.Name = "tbxSuperUserPass";
            this.tbxSuperUserPass.Size = new System.Drawing.Size(147, 20);
            this.tbxSuperUserPass.TabIndex = 2;
            this.tbxSuperUserPass.UseSystemPasswordChar = true;
            // 
            // tbxSuperUserEmail
            // 
            this.tbxSuperUserEmail.Location = new System.Drawing.Point(128, 50);
            this.tbxSuperUserEmail.Name = "tbxSuperUserEmail";
            this.tbxSuperUserEmail.Size = new System.Drawing.Size(221, 20);
            this.tbxSuperUserEmail.TabIndex = 1;
            this.tbxSuperUserEmail.Leave += new System.EventHandler(this.tbxSuperUserEmail_Leave);
            // 
            // tbxSuperUserName
            // 
            this.tbxSuperUserName.Location = new System.Drawing.Point(128, 25);
            this.tbxSuperUserName.Name = "tbxSuperUserName";
            this.tbxSuperUserName.Size = new System.Drawing.Size(221, 20);
            this.tbxSuperUserName.TabIndex = 0;
            // 
            // lblConfirmSuperUserPassword
            // 
            this.lblConfirmSuperUserPassword.AutoSize = true;
            this.lblConfirmSuperUserPassword.ForeColor = System.Drawing.SystemColors.ControlText;
            this.lblConfirmSuperUserPassword.Location = new System.Drawing.Point(11, 106);
            this.lblConfirmSuperUserPassword.Name = "lblConfirmSuperUserPassword";
            this.lblConfirmSuperUserPassword.Size = new System.Drawing.Size(90, 13);
            this.lblConfirmSuperUserPassword.TabIndex = 0;
            this.lblConfirmSuperUserPassword.Text = "Confirm password";
            // 
            // lblSuperUserPass
            // 
            this.lblSuperUserPass.AutoSize = true;
            this.lblSuperUserPass.ForeColor = System.Drawing.SystemColors.ControlText;
            this.lblSuperUserPass.Location = new System.Drawing.Point(11, 80);
            this.lblSuperUserPass.Name = "lblSuperUserPass";
            this.lblSuperUserPass.Size = new System.Drawing.Size(53, 13);
            this.lblSuperUserPass.TabIndex = 0;
            this.lblSuperUserPass.Text = "Password";
            // 
            // lblSuperUserId
            // 
            this.lblSuperUserId.AutoSize = true;
            this.lblSuperUserId.ForeColor = System.Drawing.SystemColors.ControlText;
            this.lblSuperUserId.Location = new System.Drawing.Point(11, 53);
            this.lblSuperUserId.Name = "lblSuperUserId";
            this.lblSuperUserId.Size = new System.Drawing.Size(76, 13);
            this.lblSuperUserId.TabIndex = 0;
            this.lblSuperUserId.Text = "User ID (email)";
            // 
            // lblSuperUserName
            // 
            this.lblSuperUserName.AutoSize = true;
            this.lblSuperUserName.ForeColor = System.Drawing.SystemColors.ControlText;
            this.lblSuperUserName.Location = new System.Drawing.Point(11, 28);
            this.lblSuperUserName.Name = "lblSuperUserName";
            this.lblSuperUserName.Size = new System.Drawing.Size(116, 13);
            this.lblSuperUserName.TabIndex = 0;
            this.lblSuperUserName.Text = "User Name (Teamlead)";
            // 
            // grpBoxGuestUser
            // 
            this.grpBoxGuestUser.Controls.Add(this.pbGuestPass);
            this.grpBoxGuestUser.Controls.Add(this.tbxGuestUserConfirmPass);
            this.grpBoxGuestUser.Controls.Add(this.tbxGuestUserPass);
            this.grpBoxGuestUser.Controls.Add(this.tbxGuestUserEmail);
            this.grpBoxGuestUser.Controls.Add(this.tbxGuestUserName);
            this.grpBoxGuestUser.Controls.Add(this.label1);
            this.grpBoxGuestUser.Controls.Add(this.label2);
            this.grpBoxGuestUser.Controls.Add(this.label3);
            this.grpBoxGuestUser.Controls.Add(this.label4);
            this.grpBoxGuestUser.ForeColor = System.Drawing.Color.Blue;
            this.grpBoxGuestUser.Location = new System.Drawing.Point(72, 184);
            this.grpBoxGuestUser.Name = "grpBoxGuestUser";
            this.grpBoxGuestUser.Size = new System.Drawing.Size(429, 136);
            this.grpBoxGuestUser.TabIndex = 1;
            this.grpBoxGuestUser.TabStop = false;
            this.grpBoxGuestUser.Text = "Create Guest user. Keep the default user info (Recommended)";
            // 
            // pbGuestPass
            // 
            this.pbGuestPass.Image = ((System.Drawing.Image)(resources.GetObject("pbGuestPass.Image")));
            this.pbGuestPass.Location = new System.Drawing.Point(261, 77);
            this.pbGuestPass.Name = "pbGuestPass";
            this.pbGuestPass.Size = new System.Drawing.Size(24, 20);
            this.pbGuestPass.TabIndex = 12;
            this.pbGuestPass.TabStop = false;
            this.pbGuestPass.MouseDown += new System.Windows.Forms.MouseEventHandler(this.pbGuestPass_MouseDown);
            this.pbGuestPass.MouseUp += new System.Windows.Forms.MouseEventHandler(this.pbGuestPass_MouseUp);
            // 
            // tbxGuestUserConfirmPass
            // 
            this.tbxGuestUserConfirmPass.Location = new System.Drawing.Point(112, 103);
            this.tbxGuestUserConfirmPass.Name = "tbxGuestUserConfirmPass";
            this.tbxGuestUserConfirmPass.Size = new System.Drawing.Size(147, 20);
            this.tbxGuestUserConfirmPass.TabIndex = 7;
            this.tbxGuestUserConfirmPass.UseSystemPasswordChar = true;
            // 
            // tbxGuestUserPass
            // 
            this.tbxGuestUserPass.Location = new System.Drawing.Point(112, 77);
            this.tbxGuestUserPass.Name = "tbxGuestUserPass";
            this.tbxGuestUserPass.Size = new System.Drawing.Size(147, 20);
            this.tbxGuestUserPass.TabIndex = 6;
            this.tbxGuestUserPass.UseSystemPasswordChar = true;
            // 
            // tbxGuestUserEmail
            // 
            this.tbxGuestUserEmail.Location = new System.Drawing.Point(112, 51);
            this.tbxGuestUserEmail.Name = "tbxGuestUserEmail";
            this.tbxGuestUserEmail.Size = new System.Drawing.Size(221, 20);
            this.tbxGuestUserEmail.TabIndex = 5;
            this.tbxGuestUserEmail.Leave += new System.EventHandler(this.tbxGuestUserEmail_Leave);
            // 
            // tbxGuestUserName
            // 
            this.tbxGuestUserName.Location = new System.Drawing.Point(112, 25);
            this.tbxGuestUserName.Name = "tbxGuestUserName";
            this.tbxGuestUserName.Size = new System.Drawing.Size(221, 20);
            this.tbxGuestUserName.TabIndex = 4;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.ForeColor = System.Drawing.SystemColors.ControlText;
            this.label1.Location = new System.Drawing.Point(10, 106);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(90, 13);
            this.label1.TabIndex = 4;
            this.label1.Text = "Confirm password";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.ForeColor = System.Drawing.SystemColors.ControlText;
            this.label2.Location = new System.Drawing.Point(10, 80);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(53, 13);
            this.label2.TabIndex = 5;
            this.label2.Text = "Password";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.ForeColor = System.Drawing.SystemColors.ControlText;
            this.label3.Location = new System.Drawing.Point(10, 53);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(76, 13);
            this.label3.TabIndex = 6;
            this.label3.Text = "User ID (email)";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.ForeColor = System.Drawing.SystemColors.ControlText;
            this.label4.Location = new System.Drawing.Point(10, 28);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(97, 13);
            this.label4.TabIndex = 7;
            this.label4.Text = "User Name (Guest)";
            // 
            // btnInstall
            // 
            this.btnInstall.Location = new System.Drawing.Point(426, 340);
            this.btnInstall.Name = "btnInstall";
            this.btnInstall.Size = new System.Drawing.Size(75, 23);
            this.btnInstall.TabIndex = 9;
            this.btnInstall.Text = "Install";
            this.btnInstall.UseVisualStyleBackColor = true;
            this.btnInstall.Click += new System.EventHandler(this.btnInstall_Click);
            // 
            // epUserInfo
            // 
            this.epUserInfo.BlinkStyle = System.Windows.Forms.ErrorBlinkStyle.NeverBlink;
            this.epUserInfo.ContainerControl = this;
            // 
            // pbDBInstall
            // 
            this.pbDBInstall.Location = new System.Drawing.Point(72, 348);
            this.pbDBInstall.Maximum = 9;
            this.pbDBInstall.Name = "pbDBInstall";
            this.pbDBInstall.Size = new System.Drawing.Size(429, 23);
            this.pbDBInstall.Step = 1;
            this.pbDBInstall.TabIndex = 14;
            this.pbDBInstall.Visible = false;
            // 
            // lblWaitingtxt
            // 
            this.lblWaitingtxt.AutoSize = true;
            this.lblWaitingtxt.ForeColor = System.Drawing.Color.Maroon;
            this.lblWaitingtxt.Location = new System.Drawing.Point(75, 331);
            this.lblWaitingtxt.Name = "lblWaitingtxt";
            this.lblWaitingtxt.Size = new System.Drawing.Size(70, 13);
            this.lblWaitingtxt.TabIndex = 15;
            this.lblWaitingtxt.Text = "Please wait...";
            this.lblWaitingtxt.Visible = false;
            // 
            // panel1
            // 
            this.panel1.BackColor = System.Drawing.Color.Black;
            this.panel1.BackgroundImage = global::ChaloDBConfigurationTool.Properties.Resources.thumb_350_456498;
            this.panel1.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Center;
            this.panel1.Controls.Add(this.pictureBox1);
            this.panel1.Location = new System.Drawing.Point(0, 34);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(66, 351);
            this.panel1.TabIndex = 13;
            // 
            // pictureBox1
            // 
            this.pictureBox1.Image = ((System.Drawing.Image)(resources.GetObject("pictureBox1.Image")));
            this.pictureBox1.Location = new System.Drawing.Point(-2, -4);
            this.pictureBox1.Name = "pictureBox1";
            this.pictureBox1.Size = new System.Drawing.Size(70, 55);
            this.pictureBox1.SizeMode = System.Windows.Forms.PictureBoxSizeMode.CenterImage;
            this.pictureBox1.TabIndex = 14;
            this.pictureBox1.TabStop = false;
            // 
            // pbBanner
            // 
            this.pbBanner.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("pbBanner.BackgroundImage")));
            this.pbBanner.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.pbBanner.Dock = System.Windows.Forms.DockStyle.Top;
            this.pbBanner.Location = new System.Drawing.Point(0, 0);
            this.pbBanner.Name = "pbBanner";
            this.pbBanner.Size = new System.Drawing.Size(505, 34);
            this.pbBanner.TabIndex = 6;
            this.pbBanner.TabStop = false;
            // 
            // btnBack
            // 
            this.btnBack.Location = new System.Drawing.Point(333, 340);
            this.btnBack.Name = "btnBack";
            this.btnBack.Size = new System.Drawing.Size(75, 23);
            this.btnBack.TabIndex = 8;
            this.btnBack.Text = "Back";
            this.btnBack.UseVisualStyleBackColor = true;
            this.btnBack.Click += new System.EventHandler(this.btnBack_Click);
            // 
            // frmUserInfo
            // 
            this.AcceptButton = this.btnInstall;
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(505, 375);
            this.Controls.Add(this.grpBoxSuperUser);
            this.Controls.Add(this.panel1);
            this.Controls.Add(this.lblWaitingtxt);
            this.Controls.Add(this.pbDBInstall);
            this.Controls.Add(this.btnInstall);
            this.Controls.Add(this.grpBoxGuestUser);
            this.Controls.Add(this.pbBanner);
            this.Controls.Add(this.btnBack);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedToolWindow;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.MinimumSize = new System.Drawing.Size(461, 338);
            this.Name = "frmUserInfo";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Default Users Setup";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.frmUserInfo_FormClosing);
            this.Load += new System.EventHandler(this.frmUserInfo_Load);
            this.grpBoxSuperUser.ResumeLayout(false);
            this.grpBoxSuperUser.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pbSperPass)).EndInit();
            this.grpBoxGuestUser.ResumeLayout(false);
            this.grpBoxGuestUser.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pbGuestPass)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.epUserInfo)).EndInit();
            this.panel1.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.pbBanner)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.PictureBox pbBanner;
        private System.Windows.Forms.GroupBox grpBoxSuperUser;
        private System.Windows.Forms.GroupBox grpBoxGuestUser;
        private System.Windows.Forms.Label lblConfirmSuperUserPassword;
        private System.Windows.Forms.Label lblSuperUserPass;
        private System.Windows.Forms.Label lblSuperUserId;
        private System.Windows.Forms.Label lblSuperUserName;
        private System.Windows.Forms.TextBox tbxSuperUserEmail;
        private System.Windows.Forms.TextBox tbxSuperUserName;
        private System.Windows.Forms.TextBox tbxSuperUserConfirmPass;
        private System.Windows.Forms.TextBox tbxSuperUserPass;
        private System.Windows.Forms.TextBox tbxGuestUserConfirmPass;
        private System.Windows.Forms.TextBox tbxGuestUserPass;
        private System.Windows.Forms.TextBox tbxGuestUserEmail;
        private System.Windows.Forms.TextBox tbxGuestUserName;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Button btnInstall;
        private System.Windows.Forms.PictureBox pbGuestPass;
        private System.Windows.Forms.PictureBox pbSperPass;
        private System.Windows.Forms.ErrorProvider epUserInfo;
        private System.Windows.Forms.ProgressBar pbDBInstall;
        private System.Windows.Forms.Label lblWaitingtxt;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.PictureBox pictureBox1;
        private System.Windows.Forms.Button btnBack;
    }
}
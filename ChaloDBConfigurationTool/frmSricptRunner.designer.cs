namespace ChaloDBConfigurationTool
{
    partial class frmSricptRunner
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmSricptRunner));
            this.btnInstall = new System.Windows.Forms.Button();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.rbInputDB = new System.Windows.Forms.RadioButton();
            this.rbSelectDB = new System.Windows.Forms.RadioButton();
            this.tbProjectDB = new System.Windows.Forms.TextBox();
            this.cmbProjectDB = new System.Windows.Forms.ComboBox();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.cmbTemplateDB = new System.Windows.Forms.ComboBox();
            this.label4 = new System.Windows.Forms.Label();
            this.groupBox3 = new System.Windows.Forms.GroupBox();
            this.cmbSysDb = new System.Windows.Forms.ComboBox();
            this.label1 = new System.Windows.Forms.Label();
            this.ckbCreateNG = new System.Windows.Forms.CheckBox();
            this.groupBox4 = new System.Windows.Forms.GroupBox();
            this.dtpDate = new System.Windows.Forms.DateTimePicker();
            this.label6 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.tbPrecision = new System.Windows.Forms.TextBox();
            this.tbOrganization = new System.Windows.Forms.TextBox();
            this.cbMethod = new System.Windows.Forms.ComboBox();
            this.pbBanner = new System.Windows.Forms.PictureBox();
            this.menuStrip1 = new System.Windows.Forms.MenuStrip();
            this.toolsToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.clearTableToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.changeOwnerToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.groupBox5 = new System.Windows.Forms.GroupBox();
            this.txtMsgToelichiting = new System.Windows.Forms.TextBox();
            this.label12 = new System.Windows.Forms.Label();
            this.txtIdentificationPrefix = new System.Windows.Forms.TextBox();
            this.label11 = new System.Windows.Forms.Label();
            this.txtReferencePrefix = new System.Windows.Forms.TextBox();
            this.label10 = new System.Windows.Forms.Label();
            this.txtAdministration = new System.Windows.Forms.TextBox();
            this.label9 = new System.Windows.Forms.Label();
            this.txtApplicationName = new System.Windows.Forms.TextBox();
            this.label8 = new System.Windows.Forms.Label();
            this.txtBronhouder = new System.Windows.Forms.TextBox();
            this.label7 = new System.Windows.Forms.Label();
            this.groupBox1.SuspendLayout();
            this.groupBox2.SuspendLayout();
            this.groupBox3.SuspendLayout();
            this.groupBox4.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pbBanner)).BeginInit();
            this.menuStrip1.SuspendLayout();
            this.groupBox5.SuspendLayout();
            this.SuspendLayout();
            // 
            // btnInstall
            // 
            this.btnInstall.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnInstall.Location = new System.Drawing.Point(425, 456);
            this.btnInstall.Name = "btnInstall";
            this.btnInstall.Size = new System.Drawing.Size(82, 29);
            this.btnInstall.TabIndex = 10;
            this.btnInstall.Text = "Next";
            this.btnInstall.UseVisualStyleBackColor = true;
            this.btnInstall.Click += new System.EventHandler(this.btnRunSysDBScript_Click);
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.rbInputDB);
            this.groupBox1.Controls.Add(this.rbSelectDB);
            this.groupBox1.Controls.Add(this.tbProjectDB);
            this.groupBox1.Controls.Add(this.cmbProjectDB);
            this.groupBox1.ForeColor = System.Drawing.Color.Blue;
            this.groupBox1.Location = new System.Drawing.Point(15, 64);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(421, 57);
            this.groupBox1.TabIndex = 0;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Project Databases";
            // 
            // rbInputDB
            // 
            this.rbInputDB.AutoSize = true;
            this.rbInputDB.Checked = true;
            this.rbInputDB.ForeColor = System.Drawing.SystemColors.ControlText;
            this.rbInputDB.Location = new System.Drawing.Point(11, 23);
            this.rbInputDB.Name = "rbInputDB";
            this.rbInputDB.Size = new System.Drawing.Size(107, 17);
            this.rbInputDB.TabIndex = 0;
            this.rbInputDB.TabStop = true;
            this.rbInputDB.Text = "Project DB Name";
            this.rbInputDB.UseVisualStyleBackColor = true;
            // 
            // rbSelectDB
            // 
            this.rbSelectDB.AutoSize = true;
            this.rbSelectDB.ForeColor = System.Drawing.SystemColors.ControlText;
            this.rbSelectDB.Location = new System.Drawing.Point(11, 13);
            this.rbSelectDB.Name = "rbSelectDB";
            this.rbSelectDB.Size = new System.Drawing.Size(109, 17);
            this.rbSelectDB.TabIndex = 0;
            this.rbSelectDB.Text = "Select Project DB";
            this.rbSelectDB.UseVisualStyleBackColor = true;
            this.rbSelectDB.Visible = false;
            // 
            // tbProjectDB
            // 
            this.tbProjectDB.Location = new System.Drawing.Point(139, 22);
            this.tbProjectDB.Name = "tbProjectDB";
            this.tbProjectDB.Size = new System.Drawing.Size(274, 20);
            this.tbProjectDB.TabIndex = 0;
            this.tbProjectDB.Text = "AOXX";
            // 
            // cmbProjectDB
            // 
            this.cmbProjectDB.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbProjectDB.FormattingEnabled = true;
            this.cmbProjectDB.Location = new System.Drawing.Point(139, 12);
            this.cmbProjectDB.Name = "cmbProjectDB";
            this.cmbProjectDB.Size = new System.Drawing.Size(274, 21);
            this.cmbProjectDB.TabIndex = 0;
            this.cmbProjectDB.Visible = false;
            // 
            // groupBox2
            // 
            this.groupBox2.Controls.Add(this.cmbTemplateDB);
            this.groupBox2.Controls.Add(this.label4);
            this.groupBox2.ForeColor = System.Drawing.Color.Blue;
            this.groupBox2.Location = new System.Drawing.Point(15, 267);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Size = new System.Drawing.Size(254, 47);
            this.groupBox2.TabIndex = 2;
            this.groupBox2.TabStop = false;
            this.groupBox2.Text = "Template Selection";
            // 
            // cmbTemplateDB
            // 
            this.cmbTemplateDB.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbTemplateDB.FormattingEnabled = true;
            this.cmbTemplateDB.Location = new System.Drawing.Point(121, 18);
            this.cmbTemplateDB.Name = "cmbTemplateDB";
            this.cmbTemplateDB.Size = new System.Drawing.Size(125, 21);
            this.cmbTemplateDB.TabIndex = 5;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.ForeColor = System.Drawing.SystemColors.ControlText;
            this.label4.Location = new System.Drawing.Point(6, 21);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(111, 13);
            this.label4.TabIndex = 0;
            this.label4.Text = "PostGIS Template DB";
            // 
            // groupBox3
            // 
            this.groupBox3.Controls.Add(this.cmbSysDb);
            this.groupBox3.Controls.Add(this.label1);
            this.groupBox3.ForeColor = System.Drawing.Color.Blue;
            this.groupBox3.Location = new System.Drawing.Point(275, 267);
            this.groupBox3.Name = "groupBox3";
            this.groupBox3.Size = new System.Drawing.Size(241, 47);
            this.groupBox3.TabIndex = 3;
            this.groupBox3.TabStop = false;
            this.groupBox3.Text = "Sys Database Selection";
            // 
            // cmbSysDb
            // 
            this.cmbSysDb.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbSysDb.FormattingEnabled = true;
            this.cmbSysDb.Location = new System.Drawing.Point(119, 18);
            this.cmbSysDb.Name = "cmbSysDb";
            this.cmbSysDb.Size = new System.Drawing.Size(113, 21);
            this.cmbSysDb.TabIndex = 6;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.ForeColor = System.Drawing.SystemColors.ControlText;
            this.label1.Location = new System.Drawing.Point(6, 21);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(107, 13);
            this.label1.TabIndex = 0;
            this.label1.Text = "BGT-ChaloIS Sys DB";
            // 
            // ckbCreateNG
            // 
            this.ckbCreateNG.AutoSize = true;
            this.ckbCreateNG.Location = new System.Drawing.Point(17, 468);
            this.ckbCreateNG.Name = "ckbCreateNG";
            this.ckbCreateNG.Size = new System.Drawing.Size(157, 17);
            this.ckbCreateNG.TabIndex = 9;
            this.ckbCreateNG.Text = "Create NedGraphics Report";
            this.ckbCreateNG.UseVisualStyleBackColor = true;
            // 
            // groupBox4
            // 
            this.groupBox4.Controls.Add(this.dtpDate);
            this.groupBox4.Controls.Add(this.label6);
            this.groupBox4.Controls.Add(this.label5);
            this.groupBox4.Controls.Add(this.label3);
            this.groupBox4.Controls.Add(this.label2);
            this.groupBox4.Controls.Add(this.tbPrecision);
            this.groupBox4.Controls.Add(this.tbOrganization);
            this.groupBox4.Controls.Add(this.cbMethod);
            this.groupBox4.ForeColor = System.Drawing.Color.Blue;
            this.groupBox4.Location = new System.Drawing.Point(15, 129);
            this.groupBox4.Name = "groupBox4";
            this.groupBox4.Size = new System.Drawing.Size(421, 121);
            this.groupBox4.TabIndex = 1;
            this.groupBox4.TabStop = false;
            this.groupBox4.Text = "Project Specific Default PBP Info";
            // 
            // dtpDate
            // 
            this.dtpDate.Location = new System.Drawing.Point(137, 90);
            this.dtpDate.Name = "dtpDate";
            this.dtpDate.Size = new System.Drawing.Size(274, 20);
            this.dtpDate.TabIndex = 4;
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.ForeColor = System.Drawing.SystemColors.ControlText;
            this.label6.Location = new System.Drawing.Point(6, 96);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(30, 13);
            this.label6.TabIndex = 0;
            this.label6.Text = "Date";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.ForeColor = System.Drawing.SystemColors.ControlText;
            this.label5.Location = new System.Drawing.Point(6, 70);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(50, 13);
            this.label5.TabIndex = 0;
            this.label5.Text = "Precision";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.ForeColor = System.Drawing.SystemColors.ControlText;
            this.label3.Location = new System.Drawing.Point(6, 43);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(43, 13);
            this.label3.TabIndex = 0;
            this.label3.Text = "Method";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.ForeColor = System.Drawing.SystemColors.ControlText;
            this.label2.Location = new System.Drawing.Point(6, 21);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(66, 13);
            this.label2.TabIndex = 0;
            this.label2.Text = "Organization";
            // 
            // tbPrecision
            // 
            this.tbPrecision.Location = new System.Drawing.Point(137, 67);
            this.tbPrecision.Name = "tbPrecision";
            this.tbPrecision.Size = new System.Drawing.Size(274, 20);
            this.tbPrecision.TabIndex = 3;
            this.tbPrecision.Text = "23";
            // 
            // tbOrganization
            // 
            this.tbOrganization.Location = new System.Drawing.Point(137, 14);
            this.tbOrganization.Name = "tbOrganization";
            this.tbOrganization.Size = new System.Drawing.Size(274, 20);
            this.tbOrganization.TabIndex = 1;
            this.tbOrganization.Text = "G0000";
            // 
            // cbMethod
            // 
            this.cbMethod.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cbMethod.FormattingEnabled = true;
            this.cbMethod.Items.AddRange(new object[] {
            "transitie",
            "geconstrueerd",
            "bouwtekening",
            "scannen",
            "digitaliseren",
            "panoramabeelden",
            "fotogrammetrisch",
            "laser",
            "terrestrisch"});
            this.cbMethod.Location = new System.Drawing.Point(137, 40);
            this.cbMethod.Name = "cbMethod";
            this.cbMethod.Size = new System.Drawing.Size(274, 21);
            this.cbMethod.TabIndex = 2;
            // 
            // pbBanner
            // 
            this.pbBanner.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("pbBanner.BackgroundImage")));
            this.pbBanner.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.pbBanner.Dock = System.Windows.Forms.DockStyle.Top;
            this.pbBanner.Location = new System.Drawing.Point(0, 0);
            this.pbBanner.Name = "pbBanner";
            this.pbBanner.Size = new System.Drawing.Size(530, 34);
            this.pbBanner.TabIndex = 5;
            this.pbBanner.TabStop = false;
            // 
            // menuStrip1
            // 
            this.menuStrip1.Dock = System.Windows.Forms.DockStyle.None;
            this.menuStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.toolsToolStripMenuItem});
            this.menuStrip1.Location = new System.Drawing.Point(-8, 36);
            this.menuStrip1.Name = "menuStrip1";
            this.menuStrip1.Size = new System.Drawing.Size(55, 24);
            this.menuStrip1.TabIndex = 11;
            this.menuStrip1.Text = "menuStrip1";
            // 
            // toolsToolStripMenuItem
            // 
            this.toolsToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.clearTableToolStripMenuItem,
            this.changeOwnerToolStripMenuItem});
            this.toolsToolStripMenuItem.Name = "toolsToolStripMenuItem";
            this.toolsToolStripMenuItem.Size = new System.Drawing.Size(47, 20);
            this.toolsToolStripMenuItem.Text = "Tools";
            // 
            // clearTableToolStripMenuItem
            // 
            this.clearTableToolStripMenuItem.Name = "clearTableToolStripMenuItem";
            this.clearTableToolStripMenuItem.Size = new System.Drawing.Size(153, 22);
            this.clearTableToolStripMenuItem.Text = "Clear Table";
            this.clearTableToolStripMenuItem.Click += new System.EventHandler(this.clearTableToolStripMenuItem_Click);
            // 
            // changeOwnerToolStripMenuItem
            // 
            this.changeOwnerToolStripMenuItem.Name = "changeOwnerToolStripMenuItem";
            this.changeOwnerToolStripMenuItem.Size = new System.Drawing.Size(153, 22);
            this.changeOwnerToolStripMenuItem.Text = "Change Owner";
            this.changeOwnerToolStripMenuItem.Click += new System.EventHandler(this.changeOwnerToolStripMenuItem_Click);
            // 
            // groupBox5
            // 
            this.groupBox5.Controls.Add(this.txtMsgToelichiting);
            this.groupBox5.Controls.Add(this.label12);
            this.groupBox5.Controls.Add(this.txtIdentificationPrefix);
            this.groupBox5.Controls.Add(this.label11);
            this.groupBox5.Controls.Add(this.txtReferencePrefix);
            this.groupBox5.Controls.Add(this.label10);
            this.groupBox5.Controls.Add(this.txtAdministration);
            this.groupBox5.Controls.Add(this.label9);
            this.groupBox5.Controls.Add(this.txtApplicationName);
            this.groupBox5.Controls.Add(this.label8);
            this.groupBox5.Controls.Add(this.txtBronhouder);
            this.groupBox5.Controls.Add(this.label7);
            this.groupBox5.ForeColor = System.Drawing.Color.Blue;
            this.groupBox5.Location = new System.Drawing.Point(15, 331);
            this.groupBox5.Name = "groupBox5";
            this.groupBox5.Size = new System.Drawing.Size(501, 120);
            this.groupBox5.TabIndex = 4;
            this.groupBox5.TabStop = false;
            this.groupBox5.Text = "Stuff Message Config";
            // 
            // txtMsgToelichiting
            // 
            this.txtMsgToelichiting.BackColor = System.Drawing.SystemColors.ActiveBorder;
            this.txtMsgToelichiting.Location = new System.Drawing.Point(379, 85);
            this.txtMsgToelichiting.Name = "txtMsgToelichiting";
            this.txtMsgToelichiting.ReadOnly = true;
            this.txtMsgToelichiting.Size = new System.Drawing.Size(113, 20);
            this.txtMsgToelichiting.TabIndex = 0;
            this.txtMsgToelichiting.TabStop = false;
            this.txtMsgToelichiting.Text = "BGT";
            // 
            // label12
            // 
            this.label12.AutoSize = true;
            this.label12.ForeColor = System.Drawing.Color.Black;
            this.label12.Location = new System.Drawing.Point(261, 88);
            this.label12.Name = "label12";
            this.label12.Size = new System.Drawing.Size(84, 13);
            this.label12.TabIndex = 10;
            this.label12.Text = "Msg toelichting :";
            // 
            // txtIdentificationPrefix
            // 
            this.txtIdentificationPrefix.BackColor = System.Drawing.SystemColors.ActiveBorder;
            this.txtIdentificationPrefix.Location = new System.Drawing.Point(379, 52);
            this.txtIdentificationPrefix.Name = "txtIdentificationPrefix";
            this.txtIdentificationPrefix.ReadOnly = true;
            this.txtIdentificationPrefix.Size = new System.Drawing.Size(113, 20);
            this.txtIdentificationPrefix.TabIndex = 0;
            this.txtIdentificationPrefix.TabStop = false;
            this.txtIdentificationPrefix.Text = "GXXXX.8A";
            // 
            // label11
            // 
            this.label11.AutoSize = true;
            this.label11.ForeColor = System.Drawing.Color.Black;
            this.label11.Location = new System.Drawing.Point(261, 55);
            this.label11.Name = "label11";
            this.label11.Size = new System.Drawing.Size(98, 13);
            this.label11.TabIndex = 8;
            this.label11.Text = "Identification prefix:";
            // 
            // txtReferencePrefix
            // 
            this.txtReferencePrefix.BackColor = System.Drawing.SystemColors.ActiveBorder;
            this.txtReferencePrefix.Location = new System.Drawing.Point(379, 19);
            this.txtReferencePrefix.Name = "txtReferencePrefix";
            this.txtReferencePrefix.ReadOnly = true;
            this.txtReferencePrefix.Size = new System.Drawing.Size(113, 20);
            this.txtReferencePrefix.TabIndex = 0;
            this.txtReferencePrefix.TabStop = false;
            this.txtReferencePrefix.Text = "8ABEA";
            // 
            // label10
            // 
            this.label10.AutoSize = true;
            this.label10.ForeColor = System.Drawing.Color.Black;
            this.label10.Location = new System.Drawing.Point(261, 22);
            this.label10.Name = "label10";
            this.label10.Size = new System.Drawing.Size(88, 13);
            this.label10.TabIndex = 6;
            this.label10.Text = "Reference prefix:";
            // 
            // txtAdministration
            // 
            this.txtAdministration.Location = new System.Drawing.Point(139, 85);
            this.txtAdministration.Name = "txtAdministration";
            this.txtAdministration.Size = new System.Drawing.Size(115, 20);
            this.txtAdministration.TabIndex = 8;
            this.txtAdministration.Text = "AOXX";
            // 
            // label9
            // 
            this.label9.AutoSize = true;
            this.label9.ForeColor = System.Drawing.Color.Black;
            this.label9.Location = new System.Drawing.Point(16, 88);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(111, 13);
            this.label9.TabIndex = 4;
            this.label9.Text = "Sender administration:";
            // 
            // txtApplicationName
            // 
            this.txtApplicationName.BackColor = System.Drawing.SystemColors.ActiveBorder;
            this.txtApplicationName.Location = new System.Drawing.Point(139, 52);
            this.txtApplicationName.Name = "txtApplicationName";
            this.txtApplicationName.ReadOnly = true;
            this.txtApplicationName.Size = new System.Drawing.Size(115, 20);
            this.txtApplicationName.TabIndex = 0;
            this.txtApplicationName.TabStop = false;
            this.txtApplicationName.Text = "ChaloIS-BGTLink";
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.ForeColor = System.Drawing.Color.Black;
            this.label8.Location = new System.Drawing.Point(16, 55);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(130, 13);
            this.label8.TabIndex = 2;
            this.label8.Text = "Sender application name :";
            // 
            // txtBronhouder
            // 
            this.txtBronhouder.Location = new System.Drawing.Point(139, 19);
            this.txtBronhouder.Name = "txtBronhouder";
            this.txtBronhouder.Size = new System.Drawing.Size(115, 20);
            this.txtBronhouder.TabIndex = 7;
            this.txtBronhouder.Text = "GXXXX";
            this.txtBronhouder.TextChanged += new System.EventHandler(this.txtBronhouder_TextChanged);
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.ForeColor = System.Drawing.Color.Black;
            this.label7.Location = new System.Drawing.Point(16, 22);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(104, 13);
            this.label7.TabIndex = 0;
            this.label7.Text = "Sender bronhouder :";
            // 
            // frmSricptRunner
            // 
            this.AcceptButton = this.btnInstall;
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(530, 496);
            this.Controls.Add(this.groupBox5);
            this.Controls.Add(this.menuStrip1);
            this.Controls.Add(this.groupBox4);
            this.Controls.Add(this.ckbCreateNG);
            this.Controls.Add(this.pbBanner);
            this.Controls.Add(this.groupBox3);
            this.Controls.Add(this.groupBox2);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.btnInstall);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedToolWindow;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.MinimumSize = new System.Drawing.Size(461, 338);
            this.Name = "frmSricptRunner";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "BGT Database Installer";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.frmSricptRunner_FormClosing);
            this.Load += new System.EventHandler(this.frmSricptRunner_Load);
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.groupBox2.ResumeLayout(false);
            this.groupBox2.PerformLayout();
            this.groupBox3.ResumeLayout(false);
            this.groupBox3.PerformLayout();
            this.groupBox4.ResumeLayout(false);
            this.groupBox4.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pbBanner)).EndInit();
            this.menuStrip1.ResumeLayout(false);
            this.menuStrip1.PerformLayout();
            this.groupBox5.ResumeLayout(false);
            this.groupBox5.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button btnInstall;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.PictureBox pbBanner;
        private System.Windows.Forms.TextBox tbProjectDB;
        private System.Windows.Forms.ComboBox cmbProjectDB;
        private System.Windows.Forms.GroupBox groupBox2;
        private System.Windows.Forms.ComboBox cmbTemplateDB;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.RadioButton rbInputDB;
        private System.Windows.Forms.RadioButton rbSelectDB;
        private System.Windows.Forms.GroupBox groupBox3;
        private System.Windows.Forms.ComboBox cmbSysDb;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.CheckBox ckbCreateNG;
        private System.Windows.Forms.GroupBox groupBox4;
        private System.Windows.Forms.TextBox tbOrganization;
        private System.Windows.Forms.ComboBox cbMethod;
        private System.Windows.Forms.TextBox tbPrecision;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.DateTimePicker dtpDate;
        private System.Windows.Forms.MenuStrip menuStrip1;
        private System.Windows.Forms.ToolStripMenuItem toolsToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem clearTableToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem changeOwnerToolStripMenuItem;
        private System.Windows.Forms.GroupBox groupBox5;
        private System.Windows.Forms.TextBox txtMsgToelichiting;
        private System.Windows.Forms.Label label12;
        private System.Windows.Forms.TextBox txtIdentificationPrefix;
        private System.Windows.Forms.Label label11;
        private System.Windows.Forms.TextBox txtReferencePrefix;
        private System.Windows.Forms.Label label10;
        private System.Windows.Forms.TextBox txtAdministration;
        private System.Windows.Forms.Label label9;
        private System.Windows.Forms.TextBox txtApplicationName;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.TextBox txtBronhouder;
        private System.Windows.Forms.Label label7;


    }
}
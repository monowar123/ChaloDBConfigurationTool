namespace ChaloDBConfigurationTool
{
    partial class frmInstallSummary
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmInstallSummary));
            this.btnFinish = new System.Windows.Forms.Button();
            this.lbDbCreation = new System.Windows.Forms.Label();
            this.pictureBox1 = new System.Windows.Forms.PictureBox();
            this.pbBanner = new System.Windows.Forms.PictureBox();
            this.rtbErrorMsg = new System.Windows.Forms.RichTextBox();
            this.lbTLCred = new System.Windows.Forms.Label();
            this.lbGuestCred = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.pbBanner)).BeginInit();
            this.SuspendLayout();
            // 
            // btnFinish
            // 
            this.btnFinish.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnFinish.Location = new System.Drawing.Point(415, 180);
            this.btnFinish.Name = "btnFinish";
            this.btnFinish.Size = new System.Drawing.Size(82, 29);
            this.btnFinish.TabIndex = 7;
            this.btnFinish.Text = "Exit";
            this.btnFinish.UseVisualStyleBackColor = true;
            this.btnFinish.Click += new System.EventHandler(this.btnFinish_Click);
            // 
            // lbDbCreation
            // 
            this.lbDbCreation.AutoSize = true;
            this.lbDbCreation.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbDbCreation.Location = new System.Drawing.Point(66, 76);
            this.lbDbCreation.Name = "lbDbCreation";
            this.lbDbCreation.Size = new System.Drawing.Size(52, 17);
            this.lbDbCreation.TabIndex = 8;
            this.lbDbCreation.Text = "label1";
            // 
            // pictureBox1
            // 
            this.pictureBox1.Image = global::ChaloDBConfigurationTool.Properties.Resources.success;
            this.pictureBox1.Location = new System.Drawing.Point(15, 51);
            this.pictureBox1.Name = "pictureBox1";
            this.pictureBox1.Size = new System.Drawing.Size(48, 50);
            this.pictureBox1.TabIndex = 10;
            this.pictureBox1.TabStop = false;
            // 
            // pbBanner
            // 
            this.pbBanner.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("pbBanner.BackgroundImage")));
            this.pbBanner.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.pbBanner.Dock = System.Windows.Forms.DockStyle.Top;
            this.pbBanner.Location = new System.Drawing.Point(0, 0);
            this.pbBanner.Name = "pbBanner";
            this.pbBanner.Size = new System.Drawing.Size(509, 34);
            this.pbBanner.TabIndex = 6;
            this.pbBanner.TabStop = false;
            // 
            // rtbErrorMsg
            // 
            this.rtbErrorMsg.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.rtbErrorMsg.ForeColor = System.Drawing.Color.Red;
            this.rtbErrorMsg.Location = new System.Drawing.Point(15, 107);
            this.rtbErrorMsg.Name = "rtbErrorMsg";
            this.rtbErrorMsg.ReadOnly = true;
            this.rtbErrorMsg.ScrollBars = System.Windows.Forms.RichTextBoxScrollBars.Vertical;
            this.rtbErrorMsg.Size = new System.Drawing.Size(482, 67);
            this.rtbErrorMsg.TabIndex = 11;
            this.rtbErrorMsg.Text = "";
            this.rtbErrorMsg.Visible = false;
            // 
            // lbTLCred
            // 
            this.lbTLCred.AutoSize = true;
            this.lbTLCred.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbTLCred.ForeColor = System.Drawing.Color.Blue;
            this.lbTLCred.Location = new System.Drawing.Point(66, 121);
            this.lbTLCred.Name = "lbTLCred";
            this.lbTLCred.Size = new System.Drawing.Size(45, 16);
            this.lbTLCred.TabIndex = 12;
            this.lbTLCred.Text = "label1";
            this.lbTLCred.Visible = false;
            // 
            // lbGuestCred
            // 
            this.lbGuestCred.AutoSize = true;
            this.lbGuestCred.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbGuestCred.ForeColor = System.Drawing.Color.Blue;
            this.lbGuestCred.Location = new System.Drawing.Point(66, 143);
            this.lbGuestCred.Name = "lbGuestCred";
            this.lbGuestCred.Size = new System.Drawing.Size(45, 16);
            this.lbGuestCred.TabIndex = 13;
            this.lbGuestCred.Text = "label2";
            this.lbGuestCred.Visible = false;
            // 
            // frmInstallSummary
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(509, 215);
            this.Controls.Add(this.lbGuestCred);
            this.Controls.Add(this.lbTLCred);
            this.Controls.Add(this.rtbErrorMsg);
            this.Controls.Add(this.pictureBox1);
            this.Controls.Add(this.btnFinish);
            this.Controls.Add(this.lbDbCreation);
            this.Controls.Add(this.pbBanner);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedToolWindow;
            this.MaximizeBox = false;
            this.MaximumSize = new System.Drawing.Size(515, 338);
            this.MinimizeBox = false;
            this.Name = "frmInstallSummary";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "BGT Database Installer";
            this.Load += new System.EventHandler(this.frmInstallSummary_Load);
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.pbBanner)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.PictureBox pbBanner;
        private System.Windows.Forms.Button btnFinish;
        private System.Windows.Forms.Label lbDbCreation;
        private System.Windows.Forms.PictureBox pictureBox1;
        private System.Windows.Forms.RichTextBox rtbErrorMsg;
        private System.Windows.Forms.Label lbTLCred;
        private System.Windows.Forms.Label lbGuestCred;

    }
}
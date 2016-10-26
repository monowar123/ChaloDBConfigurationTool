namespace ChaloDBConfigurationTool
{
    partial class frmSricptRunnerSimple
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
            this.btnRunDataDBScript = new System.Windows.Forms.Button();
            this.label1 = new System.Windows.Forms.Label();
            this.tbDataDBName = new System.Windows.Forms.TextBox();
            this.btnRunSysDBScript = new System.Windows.Forms.Button();
            this.label2 = new System.Windows.Forms.Label();
            this.tbSysDBName = new System.Windows.Forms.TextBox();
            this.SuspendLayout();
            // 
            // btnRunDataDBScript
            // 
            this.btnRunDataDBScript.Location = new System.Drawing.Point(291, 33);
            this.btnRunDataDBScript.Name = "btnRunDataDBScript";
            this.btnRunDataDBScript.Size = new System.Drawing.Size(117, 23);
            this.btnRunDataDBScript.TabIndex = 0;
            this.btnRunDataDBScript.Text = "Run Data DB Script";
            this.btnRunDataDBScript.UseVisualStyleBackColor = true;
            this.btnRunDataDBScript.Click += new System.EventHandler(this.btnRunDataDBScript_Click);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(12, 38);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(84, 13);
            this.label1.TabIndex = 1;
            this.label1.Text = "Database Name";
            // 
            // tbDataDBName
            // 
            this.tbDataDBName.Location = new System.Drawing.Point(102, 35);
            this.tbDataDBName.Name = "tbDataDBName";
            this.tbDataDBName.Size = new System.Drawing.Size(172, 20);
            this.tbDataDBName.TabIndex = 2;
            // 
            // btnRunSysDBScript
            // 
            this.btnRunSysDBScript.Location = new System.Drawing.Point(291, 70);
            this.btnRunSysDBScript.Name = "btnRunSysDBScript";
            this.btnRunSysDBScript.Size = new System.Drawing.Size(117, 23);
            this.btnRunSysDBScript.TabIndex = 0;
            this.btnRunSysDBScript.Text = "Run Sys DB Script";
            this.btnRunSysDBScript.UseVisualStyleBackColor = true;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(12, 75);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(84, 13);
            this.label2.TabIndex = 1;
            this.label2.Text = "Database Name";
            // 
            // tbSysDBName
            // 
            this.tbSysDBName.Location = new System.Drawing.Point(102, 72);
            this.tbSysDBName.Name = "tbSysDBName";
            this.tbSysDBName.Size = new System.Drawing.Size(172, 20);
            this.tbSysDBName.TabIndex = 2;
            // 
            // frmSricptRunnerSimple
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(601, 262);
            this.Controls.Add(this.tbSysDBName);
            this.Controls.Add(this.tbDataDBName);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.btnRunSysDBScript);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.btnRunDataDBScript);
            this.Name = "frmSricptRunnerSimple";
            this.Text = "Run Sql Sricpt";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button btnRunDataDBScript;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox tbDataDBName;
        private System.Windows.Forms.Button btnRunSysDBScript;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox tbSysDBName;
    }
}
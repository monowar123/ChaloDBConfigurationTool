using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ToolsLib
{
    public class ToolHelper
    {
        public void ClearTable()
        {
            frmClearTable clearTableForm = new frmClearTable();
            clearTableForm.ShowDialog();
        }

        public void ChangeOwner()
        {
            frmChangeOwner changeOwnerForm = new frmChangeOwner();
            changeOwnerForm.ShowDialog();    
        }
    }
}

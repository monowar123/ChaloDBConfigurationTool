using ChaloDBConfigurationTool;
using PasswordCrypto;
using System.Data;
using System.IO;
using System.Reflection;

namespace DBInstaller
{
    public class DBInstall
    {
        private string ScriptBasePath = Path.Combine(Path.GetDirectoryName(Assembly.GetExecutingAssembly().Location), "Scripts");
        QueryProvider queryProvider = new QueryProvider();

        public void CreateDatabase(string connectionString, string dbName, string templateName)
        {
            DBHandler superDBMan = new DBHandler(connectionString);
            superDBMan.ExecuteNonQuery(queryProvider.GetSQLFor_CreateDatabase(dbName.ToUpper(), templateName));
        }

        public void ChangeOwner(string connectionString, string projectDBName)
        {
            DBHandler superDBMan = new DBHandler(connectionString);
            superDBMan.ExecuteNonQuery(queryProvider.GetSQLFor_ChangeOwner(projectDBName.ToUpper()));
        }

        public DataTable CheckDatabaseExist(string connectionString, string projectDBName)
        {
            DBHandler superDBMan = new DBHandler(connectionString);
            return superDBMan.GetDataTable(queryProvider.GetSQLFor_DatabaseExist(projectDBName.ToUpper()));
        }

        public DataTable CreateRole(string connectionString, string projectDBName)
        {
            DBHandler superDBMan = new DBHandler(connectionString);
            return superDBMan.GetDataTable(queryProvider.GetSQLFor_CreateRole(projectDBName.ToUpper()));
        }

        public DataTable CheckRoleExist(string connectionString, string projectDBName)
        {
            DBHandler superDBMan = new DBHandler(connectionString);
            return superDBMan.GetDataTable(queryProvider.GetSQLFor_RoleExist(projectDBName.ToUpper()));
        }

        public bool DeleteDB(string connectionString, string projectDBName)
        {
            bool deleted = true;
            DBHandler superDBManager = new DBHandler(connectionString);
            try
            {
                superDBManager.ExecuteNonQuery(queryProvider.GetSQLFor_DeleteDB(projectDBName));
            }
            catch
            {
                deleted = false;
            }

            return deleted;
        }

        public bool UserExist(string connectionString, string userID, string projectDBName)
        {
            bool exist = false;
            try
            {
                DBHandler dbMan = new DBHandler(connectionString);
                DataTable dt = dbMan.GetDataTable(queryProvider.GetSQLForGetUserByID(userID, projectDBName.ToUpper()));
                if (dt.Rows.Count > 0) exist = true;
            }
            catch
            {

            }

            return exist;
        }
        
        /// <summary>
        /// Delete existing data from all the Sys tables
        /// </summary>
        /// <param name="connectionString"></param>
        /// <param name="scriptPath"></param>
        /// <param name="projectDbName"></param>
        /// <param name="superUserId"></param>
        /// <param name="teamLeadUserId"></param>
        /// <param name="guestUserId"></param>
        public void Sys_Delete_Prev_Data(string connectionString, string scriptPath, string projectDbName, string superUserId, string teamLeadUserId, string guestUserId)
        {
            string sysDBQuery = File.ReadAllText(Path.Combine(ScriptBasePath, scriptPath));

            sysDBQuery = sysDBQuery.Replace("AOXX", projectDbName.ToUpper());
            sysDBQuery = sysDBQuery.Replace("SuperUserIDXX", superUserId);
            sysDBQuery = sysDBQuery.Replace("TeamleadUserIDXX", teamLeadUserId);
            sysDBQuery = sysDBQuery.Replace("GuestUserIDXX", guestUserId);

            DBHandler sysDBMan = new DBHandler(connectionString);
            sysDBMan.ExecuteNonQuery(sysDBQuery);
        }

        /// <summary>
        /// Install Role independent data. For example, in sys_dfn_repdetail etc.
        /// </summary>
        /// <param name="connectionString"></param>
        /// <param name="scriptPath"></param>
        /// <param name="projectDBName"></param>
        /// <param name="port"></param>
        public void Sys_Install_Role_Independent_Data(string connectionString, string scriptPath, string projectDBName, string port)
        {
            string sysDBQuery = File.ReadAllText(Path.Combine(ScriptBasePath, scriptPath));

            sysDBQuery = sysDBQuery.Replace("AOXX", projectDBName.ToUpper());
            sysDBQuery = sysDBQuery.Replace("Port=5432", "Port=" + port);

            DBHandler sysDBMan = new DBHandler(connectionString);
            sysDBMan.ExecuteNonQuery(sysDBQuery);
        }

        /// <summary>
        /// Install Super Role data
        /// </summary>
        /// <param name="connectionString"></param>
        /// <param name="scriptPath"></param>
        /// <param name="projectDBName"></param>
        /// <param name="sysSuperUserName"></param>
        /// <param name="sysSuperUserId"></param>
        /// <param name="sysSuperUserPass"></param>
        public void Sys_Install_SuperRole(string connectionString, string scriptPath, string projectDBName, string sysSuperUserName, string sysSuperUserId, string sysSuperUserPass)
        {
            string sysDBQuery = File.ReadAllText(Path.Combine(ScriptBasePath, scriptPath));

            sysDBQuery = sysDBQuery.Replace("AOXX", projectDBName.ToUpper());
            sysDBQuery = sysDBQuery.Replace("UserIDXX", sysSuperUserId);
            sysDBQuery = sysDBQuery.Replace("PaswordXX", Crypto.EncryptString(sysSuperUserPass));
            sysDBQuery = sysDBQuery.Replace("UserNameXX", sysSuperUserName);

            DBHandler sysDBMan = new DBHandler(connectionString);
            sysDBMan.ExecuteNonQuery(sysDBQuery);
        }

        /// <summary>
        /// Install TeamLead data
        /// </summary>
        /// <param name="connectionString"></param>
        /// <param name="scriptPath"></param>
        /// <param name="projectDBName"></param>
        /// <param name="TeamleadUserName"></param>
        /// <param name="TeamleadUserID"></param>
        /// <param name="TeamleadUserPassword"></param>
        public void Sys_Install_TeamleadRole(string connectionString, string scriptPath, string projectDBName, string TeamleadUserName, string TeamleadUserID, string TeamleadUserPassword)
        {
            string sysDBQuery = File.ReadAllText(Path.Combine(ScriptBasePath, scriptPath));

            sysDBQuery = sysDBQuery.Replace("AOXX", projectDBName.ToUpper());
            sysDBQuery = sysDBQuery.Replace("UserIDXX", TeamleadUserID);
            sysDBQuery = sysDBQuery.Replace("PaswordXX", Crypto.EncryptString(TeamleadUserPassword));
            sysDBQuery = sysDBQuery.Replace("UserNameXX", TeamleadUserName);

            DBHandler sysDBMan = new DBHandler(connectionString);
            sysDBMan.ExecuteNonQuery(sysDBQuery);
        }

        /// <summary>
        /// Install Guest Data
        /// </summary>
        /// <param name="connectionString"></param>
        /// <param name="scriptPath"></param>
        /// <param name="projectDBName"></param>
        /// <param name="GuestUserName"></param>
        /// <param name="GuestUserID"></param>
        /// <param name="GuestUserPassword"></param>
        public void Sys_Install_GuestRole(string connectionString, string scriptPath, string projectDBName, string GuestUserName, string GuestUserID, string GuestUserPassword)
        {
            string sysDBQuery = File.ReadAllText(Path.Combine(ScriptBasePath, scriptPath));

            sysDBQuery = sysDBQuery.Replace("AOXX", projectDBName.ToUpper());
            sysDBQuery = sysDBQuery.Replace("UserIDXX", GuestUserID);
            sysDBQuery = sysDBQuery.Replace("PaswordXX", Crypto.EncryptString(GuestUserPassword));
            sysDBQuery = sysDBQuery.Replace("UserNameXX", GuestUserName);

            DBHandler sysDBMan = new DBHandler(connectionString);
            sysDBMan.ExecuteNonQuery(sysDBQuery);
        }

        /// <summary>
        /// Install Project Specific Data (with default data)
        /// </summary>
        /// <param name="connectionString"></param>
        /// <param name="scriptPath"></param>
        /// <param name="projectDBName"></param>
        /// <param name="Organization"></param>
        /// <param name="MethodIndex"></param>
        /// <param name="MethodName"></param>
        /// <param name="Precision"></param>
        /// <param name="Date"></param>
        public void Install_ProjectData(string connectionString, string scriptPath, string projectDBName, string Organization, string MethodIndex, string MethodName, string Precision, string Date)
        {
            string projectDBQuery = File.ReadAllText(Path.Combine(ScriptBasePath, scriptPath));

            projectDBQuery = projectDBQuery.Replace("AOXX", projectDBName.ToUpper());
            projectDBQuery = projectDBQuery.Replace("default_pbp_info_GCXXX", Organization);
            projectDBQuery = projectDBQuery.Replace("default_pbp_info_MCXXX", MethodIndex);
            projectDBQuery = projectDBQuery.Replace("default_pbp_info_MNXXX", MethodName);
            projectDBQuery = projectDBQuery.Replace("default_pbp_info_precXXX", Precision);
            projectDBQuery = projectDBQuery.Replace("default_pbp_info_dateXXX", Date);

            DBHandler projectDBMan = new DBHandler(connectionString);
            projectDBMan.ExecuteNonQuery(projectDBQuery);
        }

        public void Install_ProjectData(string connectionString, string scriptPath, string projectDBName, string Organization, string MethodIndex, string MethodName, string Precision, string Date,
                                        string bronhouder, string appName, string administration, string referencePrefix, string identificationPrefix, string msgToelichting)
        {
            string projectDBQuery = File.ReadAllText(Path.Combine(ScriptBasePath, scriptPath));

            projectDBQuery = projectDBQuery.Replace("AOXX", projectDBName.ToUpper());
            projectDBQuery = projectDBQuery.Replace("default_pbp_info_GCXXX", Organization);
            projectDBQuery = projectDBQuery.Replace("default_pbp_info_MCXXX", MethodIndex);
            projectDBQuery = projectDBQuery.Replace("default_pbp_info_MNXXX", MethodName);
            projectDBQuery = projectDBQuery.Replace("default_pbp_info_precXXX", Precision);
            projectDBQuery = projectDBQuery.Replace("default_pbp_info_dateXXX", Date);

            projectDBQuery = projectDBQuery.Replace("msgconfig_sender_bronhouder", bronhouder);
            projectDBQuery = projectDBQuery.Replace("msgconfig_sender_application", appName);
            projectDBQuery = projectDBQuery.Replace("msgconfig_sender_administration", administration);
            projectDBQuery = projectDBQuery.Replace("msgconfig_msg_ref_prefix", referencePrefix);
            projectDBQuery = projectDBQuery.Replace("msgconfig_msg_identification_prefix", identificationPrefix);
            projectDBQuery = projectDBQuery.Replace("msgconfig_toelichting", msgToelichting);

            DBHandler projectDBMan = new DBHandler(connectionString);
            projectDBMan.ExecuteNonQuery(projectDBQuery);
        }

        /// <summary>
        /// Install Project Specific Data (without default data)
        /// </summary>
        /// <param name="connectionString"></param>
        /// <param name="scriptPath"></param>
        /// <param name="projectDBName"></param>
        public void Install_ProjectData(string connectionString, string scriptPath, string projectDBName)
        {
            string projectDBQuery = File.ReadAllText(Path.Combine(ScriptBasePath, scriptPath));

            projectDBQuery = projectDBQuery.Replace("AOXX", projectDBName.ToUpper());

            DBHandler projectDBMan = new DBHandler(connectionString);
            projectDBMan.ExecuteNonQuery(projectDBQuery);
        }

        /// <summary>
        /// Install Ned Graphics sys data
        /// </summary>
        /// <param name="connectionString"></param>
        /// <param name="scriptPath"></param>
        /// <param name="projectDBName"></param>
        /// <param name="port"></param>
        public void Install_NedGraphics_Sys(string connectionString, string scriptPath, string projectDBName, string port)
        {
            string ngSysDBQuery = File.ReadAllText(Path.Combine(ScriptBasePath, scriptPath));

            ngSysDBQuery = ngSysDBQuery.Replace("AOXX", projectDBName.ToUpper());
            ngSysDBQuery = ngSysDBQuery.Replace("Port=5432", "Port=" + port);

            DBHandler sysDBMan = new DBHandler(connectionString);
            sysDBMan.ExecuteNonQuery(ngSysDBQuery);
        }

        /// <summary>
        /// Install Ned Graphics Project data
        /// </summary>
        /// <param name="connectionString"></param>
        /// <param name="scriptPath"></param>
        /// <param name="projectDBName"></param>
        public void Install_NedGraphics_Projects(string connectionString, string scriptPath, string projectDBName)
        {
            string ngProjDBQuery = File.ReadAllText(Path.Combine(ScriptBasePath, scriptPath));

            ngProjDBQuery = ngProjDBQuery.Replace("AOXX", projectDBName.ToUpper());

            DBHandler projectDBMan = new DBHandler(connectionString);
            projectDBMan.ExecuteNonQuery(ngProjDBQuery);
        }

        public void UpdateEncryptedPassword(string connectionString, string scriptPath, string password, string dbName)
        {
            string query = File.ReadAllText(Path.Combine(ScriptBasePath, scriptPath));
            query = query.Replace("PasswordXX", Crypto.EncryptString(password));
            query = query.Replace("AOXX", dbName);

            DBHandler sysDBMan = new DBHandler(connectionString);
            sysDBMan.ExecuteNonQuery(query);
        }
    }
}

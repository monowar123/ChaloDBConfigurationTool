using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ChaloDBConfigurationTool
{
    public class QueryProvider
    {
        public string GetSQLFor_CreateRole(string roleName)
        {
            return string.Format("CREATE ROLE \"{0}\" WITH LOGIN PASSWORD '{0}';",roleName);
        }

        public string GetSQLFor_GetAllRole()
        {
            return "SELECT rolname FROM pg_roles;";
        }

        public string GetSQLFor_RoleExist(string roleName)
        {
            return string.Format("SELECT rolname FROM pg_roles where rolname='{0}';", roleName);
        }

        public string GetSQLFor_CreateDatabase(string dbName,string templateName)
        {
            return string.Format("CREATE DATABASE \"{0}\" WITH OWNER = \"{0}\" ENCODING = 'UTF8' TABLESPACE = pg_default template = {1} CONNECTION LIMIT = -1;",
                dbName,templateName);
        }

        public string GetSQLFor_GetAllDatabase()
        {
            return "SELECT datname FROM pg_database";
        }

        public string GetSQLFor_DatabaseExist(string dbName)
        {
            return string.Format("SELECT datname FROM pg_database WHERE datistemplate = false AND datname='{0}';",dbName);
        }

        public string GetSQLFor_ChangeOwner(string roleName)
        {
            string format = "ALTER TABLE spatial_ref_sys OWNER TO \"{0}\";ALTER TABLE geography_columns OWNER TO \"{0}\";ALTER TABLE geometry_columns OWNER TO \"{0}\";";

            return string.Format(format,roleName);
        }

        public string GetSQLForGetUserByID(string userID,string domain)
        {
            return string.Format("select * from sys_user_reg where user_id = '{0}' and domain <>'{1}'", userID,domain);
        }

        public string GetSQLFor_DeleteDB(string dbName)
        {
            return string.Format("DROP DATABASE IF EXISTS \"{0}\"", dbName);
        }
    }
}

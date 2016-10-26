using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ToolsLib
{
    class QueryProvider
    {
        public static string GetSQLFor_GetAllRole()
        {
            return "SELECT rolname FROM pg_roles;";
        }

        public static string GetSQLFor_ChangeDBRole(string dbName, string newOwner)
        {
            return string.Format("ALTER DATABASE \"{0}\" OWNER TO \"{1}\"", dbName, newOwner);  
        }

        public static string GetSQLFor_ChangeOwner(string tableName, string ownerName)
        {
            return string.Format("ALTER TABLE {0} OWNER TO \"{1}\";", tableName, ownerName);
        }

        public static string GetSQLFor_GetTableName()
        {
            return "SELECT table_name FROM information_schema.tables WHERE table_type='BASE TABLE' AND table_schema='public'";
        }

        public static string GetSQLFor_GetViewsName()
        {
            return "SELECT table_name FROM information_schema.views WHERE table_schema='public'";
        }

        public static string GetSQLFor_CurrentOwner(string dbname)
        {
            return string.Format("SELECT pg_catalog.pg_get_userbyid(d.datdba) as owner FROM pg_catalog.pg_database d WHERE d.datname = '{0}'", dbname);
        }

        public static string GetSQLFor_DatabaseExist(string dbName)
        {
            return string.Format("SELECT datname FROM pg_database WHERE datistemplate = false AND datname='{0}';", dbName);
        }

        public static string GetSQLFor_TruncateTable(List<string> tableName)
        {
            string str = null;
            foreach (string table in tableName)
            {
                str += string.Format("TRUNCATE TABLE  {0};", table);
            }

            return str;
        }

    }
}

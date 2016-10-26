using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ToolsLib
{
    public static class ToolConfig
    {
        public static string Host { get; set; }
        public static string Port { get; set; }
        public static string SuperUserId { get; set; }
        public static string SuperPassword { get; set; }

        public static string GetSuperConnectionString()
        {
            return string.Format("SERVER={0};Port={1};User id={2};Password={3};encoding=unicode",
                Host, Port, SuperUserId, SuperPassword);
        }

        public static string GetDBConnectionString(string dbName)
        {
            return string.Format("SERVER={0};Port={1};Database={2};User id={3};Password={4};encoding=unicode",
                Host, Port, dbName, SuperUserId, SuperPassword);
        }
    }
}

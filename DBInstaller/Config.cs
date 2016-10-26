namespace DBInstaller
{
    public static class Config
    {
        public static string Host { get; set; }
        public static string Port { get; set; }
        public static string SuperUserId { get; set; }
        public static string SuperPassword { get; set; }
        public static string SysDbName { get; set; }
        public static string TemplateDBName { get; set; }

        public static string GetSuperConnectionString()
        {
            return string.Format("SERVER={0};Port={1};User id={2};Password={3};encoding=unicode",
                Host, Port, SuperUserId, SuperPassword);
        }

        public static string GetSysDBConnectionString()
        {
            return string.Format("SERVER={0};Port={1};Database={2};User id={3};Password={4};encoding=unicode",
                Host, Port, SysDbName, SuperUserId, SuperPassword);
        }

        public static string GetProjectDBConnectionString(string projectDBName)
        {
            return string.Format("SERVER={0};Port={1};Database={2};User id={2};Password={2};encoding=unicode",
                Host, Port, projectDBName);
        }

        public static string GetChangeOwnerConnectionString(string projectDBName)
        {
            return string.Format("SERVER={0};Port={1};Database={2};User id={3};Password={4};encoding=unicode",
                Host, Port, projectDBName, SuperUserId, SuperPassword);
        }
    }
}

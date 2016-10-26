using System;
using System.IO;
using System.Reflection;

namespace DBInstaller
{
    public class LogWriter
    {
        public static void WriteLog(string message)
        {
            string fullFilePath = Path.Combine(Path.GetDirectoryName(Assembly.GetExecutingAssembly().Location), "Log", "log.txt");

            if (!Directory.Exists(Path.GetDirectoryName(fullFilePath)))
            {
                Directory.CreateDirectory(Path.GetDirectoryName(fullFilePath));
            }

            using (StreamWriter w = File.AppendText(fullFilePath))
            {
                w.WriteLine("At " + DateTime.Now.ToString() + " : " + message);
            }
        }
    }
}

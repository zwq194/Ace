using System;
using System.Text;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Hosting;

namespace Chloe.Admin
{
    public class Program
    {
        public static void Main(string[] args)
        {
            Encoding.RegisterProvider(CodePagesEncodingProvider.Instance); /* 支持中文 */

            string contentRoot = Directory.GetCurrentDirectory();

            var host = new WebHostBuilder()
                .UseKestrel()
                .BindUrls(args, contentRoot)
                .UseContentRoot(contentRoot)
                .UseIISIntegration()
                .UseStartup<Startup>()
                .UseApplicationInsights()
                .Build();

            host.Run();
        }
    }
}

using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using System.Text;

namespace Chloe.Home
{
    public class Program
    {
        public static void Main(string[] args)
        {
            Encoding.RegisterProvider(CodePagesEncodingProvider.Instance); /* 支持中文 */

            string contentRoot = Directory.GetCurrentDirectory();

            //http://www.cnblogs.com/chenchuxin/archive/2017/04/26/6771427.html
            //http://www.cnblogs.com/frankyou/archive/2016/07/22/5695214.html

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

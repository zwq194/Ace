using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ace.Application.Wiki
{
    public class WikiDocumentDetailModel
    {
        public string Id { get; set; }

        public string Title { get; set; }
        public string Summary { get; set; }

        public string HtmlContent { get; set; }
    }
}

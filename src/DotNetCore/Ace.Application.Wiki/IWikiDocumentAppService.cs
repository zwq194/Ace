using Ace;
using Ace.Application;
using Ace.Entity.Wiki;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ace.Application.Wiki
{
    public interface IWikiDocumentAppService : IAppService
    {
        WikiDocumentDetailModel GetDetailModel(string id);
        string Add(AddDocumentInput input);
        void Update(UpdateDocumentInput input);
        List<WikiDocument> GetAll();
        PagedData<WikiDocument> GetPageData(Pagination page, string keyword);
        WikiDocumentDetail GetDocumentDetail(string id);
    }
}

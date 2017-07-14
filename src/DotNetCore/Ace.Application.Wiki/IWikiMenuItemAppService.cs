using Ace.Application;
using Ace.Entity.Wiki;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ace.Application.Wiki
{
    public interface IWikiMenuItemAppService : IAppService
    {
        List<WikiMenuItem> GetWikiMenuItems();
        List<WikiMenuItem> GetRootWikiMenuItems();
        List<WikiMenuItem_WikiDocument> GetWikiMenuItem_Documents();
        WikiMenuItem Add(AddWikiMenuItemInput input);
        void Update(UpdateWikiMenuItemInput input);
        void Delete(string id);
    }
}

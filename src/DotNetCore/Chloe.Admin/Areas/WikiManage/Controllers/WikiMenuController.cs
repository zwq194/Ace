using Chloe.Admin.Common.Tree;
using Ace.Entity;
using Chloe.Admin.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using Microsoft.AspNetCore.Mvc;
using Ace.Application.Wiki;
using Ace.Entity.Wiki;

namespace Chloe.Admin.Areas.WikiManage.Controllers
{
    [Area(AreaNames.WikiManage)]
    [LoginAuthorizeAttribute]
    public class WikiMenuController : WebController
    {
        // GET: Wiki
        public ActionResult Index()
        {
            List<WikiMenuItem> rootMenuItems = this.CreateService<IWikiMenuItemAppService>().GetRootWikiMenuItems();
            this.ViewBag.RootMenuItems = rootMenuItems;

            var docs = this.CreateService<IWikiDocumentAppService>().GetAll();
            this.ViewBag.Documents = docs;

            return View();
        }
        public ActionResult GetModels(string keyword)
        {
            var data = this.CreateService<IWikiMenuItemAppService>().GetWikiMenuItems();
            if (!string.IsNullOrEmpty(keyword))
            {
                data = TreeHelper.TreeWhere(data, a => a.Name.Contains(keyword), a => a.Id, a => a.ParentId);
            }

            List<DataTableTree> ret = new List<DataTableTree>();
            DataTableTree.AppendChildren(data, ref ret, null, 0, a => a.Id, a => a.ParentId, a => a.SortCode);

            return this.SuccessData(ret);
        }

        [HttpPost]
        public ActionResult Add(AddWikiMenuItemInput input)
        {
            IWikiMenuItemAppService service = this.CreateService<IWikiMenuItemAppService>();
            WikiMenuItem entity = service.Add(input);
            return this.AddSuccessData(entity);
        }

        [HttpPost]
        public ActionResult Update(UpdateWikiMenuItemInput input)
        {
            IWikiMenuItemAppService service = this.CreateService<IWikiMenuItemAppService>();
            service.Update(input);
            return this.UpdateSuccessMsg();
        }
        [HttpPost]
        public ActionResult Delete(string id)
        {
            IWikiMenuItemAppService service = this.CreateService<IWikiMenuItemAppService>();
            service.Delete(id);
            return this.DeleteSuccessMsg();
        }
    }
}
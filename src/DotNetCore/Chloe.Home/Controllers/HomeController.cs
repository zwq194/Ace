using Ace.Application.Wiki;
using Chloe.Home.Common;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;

namespace Chloe.Home.Controllers
{
    public class HomeController : WebController
    {
        // GET: Home
        [ResponseCache(Duration = WebConsts.PageOutputCacheDuration)]
        public ActionResult Index()
        {
            return View();
        }

        [ResponseCache(Duration = WebConsts.PageOutputCacheDuration, VaryByQueryKeys = new string[] { "id" })]
        public ActionResult UpgradeNotes(string id)
        {
            string docId = id;

            WikiDocumentDetailModel model = this.CreateService<IWikiDocumentService>().GetDetailModel(docId);

            if (model == null)
            {
                /* 404 */
                return this.NotFoundView();
            }

            this.ViewBag.Document = model;
            return View();
        }

        public ActionResult Error()
        {
            return this.View();
        }
    }
}
using Ace;
using Ace.IdStrategy;
using Ace.Entity.Wiki;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Chloe;
using Ace.AutoMapper;

namespace Ace.Application.Wiki.Implements
{
    public class WikiDocumentAppService : AdminAppService, IWikiDocumentAppService
    {
        public WikiDocumentDetailModel GetDetailModel(string id)
        {
            var details = this.DbContext.Query<WikiDocumentDetail>().FilterDeleted();
            WikiDocumentDetailModel model = details.Select(a => new WikiDocumentDetailModel() { Id = a.Id, Title = a.Title, Summary = a.Summary, HtmlContent = a.HtmlContent }).Where(a => a.Id == id).FirstOrDefault();

            return model;
        }

        public string Add(AddDocumentInput input)
        {
            input.Validate();

            WikiDocumentDetail detail = AceMapper.Map<WikiDocumentDetail>(input);
            detail.Id = IdHelper.CreateSnowflakeId().ToString();
            detail.IsDeleted = false;
            detail.CreationTime = DateTime.Now;

            this.DbContext.Insert(detail);

            return detail.Id;
        }
        public void Update(UpdateDocumentInput input)
        {
            input.Validate();

            this.DbContext.UpdateFromDto<WikiDocumentDetail, UpdateDocumentInput>(input);
        }

        public List<WikiDocument> GetAll()
        {
            var q = this.DbContext.Query<WikiDocument>().FilterDeleted();
            return q.ToList();
        }
        public PagedData<WikiDocument> GetPageData(Pagination page, string keyword)
        {
            var q = this.DbContext.Query<WikiDocument>().FilterDeleted().WhereIfNotNullOrEmpty(keyword, a => a.Title.Contains(keyword) || a.Tag.Contains(keyword));

            var pagedData = q.TakePageData(page);

            return pagedData;
        }
        public WikiDocumentDetail GetDocumentDetail(string id)
        {
            var doc = this.DbContext.QueryByKey<WikiDocumentDetail>(id);
            return doc;
        }
    }
}

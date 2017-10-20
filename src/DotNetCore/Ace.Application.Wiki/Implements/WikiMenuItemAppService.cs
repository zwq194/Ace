﻿using Ace.Entity.Wiki;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Ace.Application;
using Ace.Exceptions;
using Chloe;
using Ace.AutoMapper;

namespace Ace.Application.Wiki.Implements
{
    public class WikiMenuItemAppService : AdminAppService, IWikiMenuItemAppService
    {
        public List<WikiMenuItem> GetWikiMenuItems()
        {
            List<WikiMenuItem> menuItems = this.DbContext.Query<WikiMenuItem>().ToList();

            return menuItems;
        }
        public List<WikiMenuItem> GetRootWikiMenuItems()
        {
            List<WikiMenuItem> menuItems = this.DbContext.Query<WikiMenuItem>().Where(a => a.ParentId == null).OrderBy(a => a.SortCode).ToList();
            return menuItems;
        }
        public List<WikiMenuItem_WikiDocument> GetWikiMenuItem_Documents()
        {
            var items = this.DbContext.Query<WikiMenuItem>();

            var q = items.LeftJoin<WikiDocument>((menuItem, doc) => menuItem.DocumentId == doc.Id);

            var ret = q.Select((menuItem, doc) => new WikiMenuItem_WikiDocument() { MenuItem = menuItem, Document = doc }).ToList();

            return ret;
        }

        public WikiMenuItem Add(AddWikiMenuItemInput input)
        {
            input.Validate();

            WikiMenuItem entity = this.DbContext.InsertFromDto<WikiMenuItem, AddWikiMenuItemInput>(input);
            return entity;
        }

        public void Update(UpdateWikiMenuItemInput input)
        {
            input.Validate();

            this.DbContext.UpdateFromDto<WikiMenuItem, UpdateWikiMenuItemInput>(input);
        }
        public void Delete(string id)
        {
            id.NotNullOrEmpty();

            bool existsChildren = this.DbContext.Query<WikiMenuItem>(a => a.ParentId == id).Any();
            if (existsChildren)
                throw new InvalidDataException("删除失败！操作的对象包含了下级数据");

            this.DbContext.DeleteByKey<WikiMenuItem>(id);
        }
    }
}

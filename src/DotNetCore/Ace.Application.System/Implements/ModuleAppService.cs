using Ace.Exceptions;
using Ace.IdStrategy;
using Ace.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Chloe;
using Ace.AutoMapper;
using Ace.Entity.System;

namespace Ace.Application.System.Implements
{
    public class ModuleAppService : AdminAppService, IModuleAppService
    {
        public List<Sys_Module> GetList()
        {
            return this.DbContext.Query<Sys_Module>().OrderBy(t => t.SortCode).ToList();
        }
        public void Add(AddModuleInput input)
        {
            input.Validate();
            this.DbContext.InsertFromDto<Sys_Module, AddModuleInput>(input);
        }

        public void Update(UpdateModuleInput input)
        {
            input.Validate();
            this.DbContext.UpdateFromDto<Sys_Module, UpdateModuleInput>(input);
        }

        public void DeleteById(string id)
        {
            id.NotNullOrEmpty();

            bool existsChildren = this.DbContext.Query<Sys_Module>(a => a.ParentId == id).Any();
            if (existsChildren)
                throw new InvalidDataException("删除失败！操作的对象包含了下级数据");

            this.DbContext.DeleteByKey<Sys_Module>(id);
        }
    }
}

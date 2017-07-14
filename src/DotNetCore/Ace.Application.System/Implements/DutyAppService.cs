using Ace.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Chloe;
using Ace.Entity.System;

namespace Ace.Application.System.Implements
{
    public class DutyAppService : AdminAppService, IDutyAppService
    {
        public List<Sys_Duty> GetDutyList(string keyword)
        {
            var q = this.DbContext.Query<Sys_Duty>().FilterDeleted().WhereIfNotNullOrEmpty(keyword, a => a.Name.Contains(keyword));
            q = q.OrderBy(a => a.SortCode);

            return q.ToList();
        }
        public List<SimpleDutyModel> GetSimpleModels()
        {
            var models = this.DbContext.Query<Sys_Duty>().Where(a => !a.IsDeleted).OrderBy(a => a.SortCode).Select(a => new SimpleDutyModel() { Id = a.Id, Name = a.Name, DepartmenId = a.DepartmentId }).ToList();
            return models;
        }
    }
}

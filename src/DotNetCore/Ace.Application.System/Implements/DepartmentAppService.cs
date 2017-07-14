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
    public class DepartmentAppService : AdminAppService, IDepartmentAppService
    {
        public List<Sys_Department> GetDepartments(string keyword)
        {
            var q = this.DbContext.Query<Sys_Department>().FilterDeleted().WhereIfNotNullOrEmpty(keyword, a => a.Name.Contains(keyword) || a.EnCode.Contains(keyword));
            q = q.OrderBy(a => a.SortCode);

            return q.ToList();
        }
        public List<SimpleDepartmentModel> GetSimpleModels()
        {
            var q = this.DbContext.Query<Sys_Department>().FilterDeleted();
            q = q.OrderBy(a => a.SortCode);

            return q.Select(a => new SimpleDepartmentModel() { Id = a.Id, Name = a.Name }).ToList();
        }
    }
}

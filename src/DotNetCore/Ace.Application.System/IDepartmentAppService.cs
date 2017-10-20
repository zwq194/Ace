using Ace.Application;
using Ace.Entity;
using Ace.Entity.System;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ace.Application.System
{
    public interface IDepartmentAppService : IAppService
    {
        List<Sys_Department> GetDepartments(string keyword);
        List<SimpleDepartmentModel> GetSimpleModels();
    }
}

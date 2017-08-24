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
    public interface IDutyAppService : IAppService
    {
        List<Sys_Duty> GetDutyList(string keyword);
        List<SimpleDutyModel> GetSimpleModels();
    }
}

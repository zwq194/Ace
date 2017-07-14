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
    public interface IModuleAppService : IAppService
    {
        List<Sys_Module> GetList();
        void Add(AddModuleInput input);
        void Update(UpdateModuleInput input);
        void DeleteById(string id);
    }
}

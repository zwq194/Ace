using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ace.Application.System
{
    public class UpdateUserInput : AddUpdateUserInputBase
    {
        [RequiredAttribute(ErrorMessage = "{0}不能为空")]
        public string Id { get; set; }
    }

}

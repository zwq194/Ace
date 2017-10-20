﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Ace.AutoMapper;
using Ace.Entity.Wiki;

namespace Ace.Application.Wiki
{
    [MapToType(typeof(WikiDocumentDetail))]
    public class AddDocumentInput : AddOrUpdateDocumentInputBase
    {
    }
}

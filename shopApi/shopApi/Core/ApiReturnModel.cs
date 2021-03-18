using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Application.Core
{
    public class ApiReturnModel
    {
        public bool IsVailed { get; set; }
        public object Model { get; set; }
        public string Messages { get; set; }
    }
}

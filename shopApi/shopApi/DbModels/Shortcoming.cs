using Application.DbModels;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace ShopApi.DbModels
{
    public class Shortcoming
    {
        [Key]
        public int ShortcomingId { get; set; }
        public string Name { get; set; }
        public string Quantity { get; set; }
        public string UnitPrice { get; set; }
        public int StoreId { get; set;  }
        public Store Store { get; set; }
    }
}

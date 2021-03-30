using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace ShopApi.DbModels
{
    public class OrderDetail
    {
        [Key]
        public int OrderDetailId { get; set; }
        public string productName { get; set; }
        public double Amount { get; set; }
        public string Note { get; set; }
        public int OrderId { get; set; }
        public Order Order { get; set; }

    }
}

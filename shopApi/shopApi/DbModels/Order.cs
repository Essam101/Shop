using Application.DbModels;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace ShopApi.DbModels
{
    public class Order
    {
        [Key]
        public int OrderId { get; set; }
        public int NumberOfProduct { get; set; }
        public double Amount { get; set;  }
        public string Note { get; set; }
        public int StoreId { get; set; }
        public Store Store { get; set; }
        public ICollection<OrderDetail> OrderDetails { get; set; }
    }
}

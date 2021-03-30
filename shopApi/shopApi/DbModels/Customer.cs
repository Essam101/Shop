using Application.DbModels;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace ShopApi.DbModels
{
    public class Customer
    {
        [Key]
        public int CustomerId { get; set; }
        public string CustomerName { get; set; }
        public int NationalId { get; set; }
        public ActiveStatus CustomerStatus { get; set; }
        public string Address { get; set; }
        public  string  PhoneNumber { get; set; }
        public int StoreId { get; set; }
        public Store Store { get; set; }
        public int AccountId { get; set; }
        public Account Account { get; set; }
    }
    public enum ActiveStatus
    {
        Low = 0,
        Medium = 1,
        High = 2
    }
}

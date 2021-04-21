using ShopApi.DbModels;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Application.DbModels
{
    public class Store
    {
        [Key]
        public int StoreId { get; set; }
        public string UserId { get; set; }
        public string StoreName { get; set; }
        public string StoreDetails { get; set; }
        public int NumbersOfUsers { get; set; }
        public string Image { get; set; }
        public string WorkActivity { get; set; }
        public string Currency { get; set; }
        public string ActivationKey { get; set; }
        public bool HasBeenActivated { get; set; }
        public DateTime CreationDate { get; set; }
        public ICollection<Customer> Customers { get; set; }
        public ICollection<Shortcoming> Shortcomings { get; set; }
        public ICollection<Order> Orders { get; set; }


    }
}



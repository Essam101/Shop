using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace ShopApi.DbModels
{
    public class Transaction
    {
        [Key]
        public int TransactionId { get; set; }
        public DateTime CreationDate { get; set; } = DateTime.Now;
        public double Amount { get; set; }
        public string Note { get; set; }
        public int  AccountId { get; set; }
        public Account Account { get; set; }
    }
}

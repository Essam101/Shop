using Application.DbModels;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace ShopApi.DbModels
{
    public class User
    {
        [Key]
        public int UserId { get; set; }
        public string SocialId { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public int StoreId { get; set; }
        public Store Store { get; set; }

    }
}

using Microsoft.EntityFrameworkCore;
using OurChat.DbModels;

namespace Application.Models
{
    public class ApplicationContext : DbContext
    {
        public ApplicationContext(DbContextOptions<ApplicationContext> options)
            : base(options)
        {
        }


        public DbSet<Store> Stores { get; set; }

    }
}                                                           
using Application.DbModels;
using Microsoft.EntityFrameworkCore;
 
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
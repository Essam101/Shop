using Application.DbModels;
using Microsoft.EntityFrameworkCore;
using ShopApi.DbModels;

namespace Application.Models
{
    public class ApplicationContext : DbContext
    {
        public ApplicationContext(DbContextOptions<ApplicationContext> options)
           : base(options)
        {
        }


        public DbSet<Store> Stores { get; set; }
        public DbSet<Customer> Customers { get; set; }
        public DbSet<Account> Accounts { get; set; }
        public DbSet<Transaction> Transactions { get; set; }
        public DbSet<Order> Orders { get; set; }
        public DbSet<OrderDetail> OrderDetails { get; set; }
        public DbSet<Shortcoming> Shortcomings { get; set; }
        public DbSet<User> Users { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Account>()
                .HasOne(a => a.Customer)
                .WithOne(b => b.Account)
                .HasForeignKey<Customer>(b => b.AccountId);
            modelBuilder.Entity<User>()
                .HasIndex(u => u.SocialId)
                .IsUnique();
        }

    }
}
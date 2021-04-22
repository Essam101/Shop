using Application.Models;
using Microsoft.EntityFrameworkCore;
using ShopApi.DbModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ShopApi.Services
{
    public class CustomerService
    {
        private readonly ApplicationContext _context;

        public CustomerService(ApplicationContext context)
        {
            _context = context;
        }


        public async Task<List<Customer>> GetCustomers()
        {
            List<Customer> customer = await _context.Customers.ToListAsync();
            return customer;
        }

        public async Task<Customer> AddCustomer(Customer customer)
        {
            await _context.Customers.AddAsync(customer);
            await _context.SaveChangesAsync();
            return customer;
        }

        public async Task<Customer> UpdateCustomer(Customer customer)
        {
            Customer obj = await _context.Customers.Where(s => s.CustomerId == customer.CustomerId).FirstOrDefaultAsync();
            obj.AccountId = customer.AccountId;
            obj.Address = customer.Address;
            obj.CustomerName = customer.CustomerName;
            obj.CustomerStatus = customer.CustomerStatus;
            obj.NationalId = customer.NationalId;
            obj.PhoneNumber = customer.PhoneNumber;
            await _context.SaveChangesAsync();
            return customer;
        }

        public async Task<Customer> GetUserCustomer(int customerId)
        {
            return await _context.Customers.Where(e => e.CustomerId == customerId).FirstOrDefaultAsync();
        }

        public async Task<Customer> DeleteCustomer(int customerId)
        {
            Customer obj = await _context.Customers.Where(s => s.CustomerId == customerId).FirstOrDefaultAsync();
            _context.Customers.Remove(obj);
            await _context.SaveChangesAsync();
            return obj;
        }

        public async Task<bool> CustomerExists(int customerId)
        {
            return await _context.Customers.AnyAsync(e => e.CustomerId == customerId);
        }
    }
}

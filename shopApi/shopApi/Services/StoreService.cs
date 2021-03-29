using Application.DbModels;
using Application.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Application.Services
{
    public class StoreService
    {
        private readonly ApplicationContext _context;
        public StoreService(ApplicationContext context)
        {
            _context = context;
        }
        public async Task<List<Store>> GetStores()
        {
            List<Store> stores = new List<Store>();
            stores = await _context.Stores.ToListAsync();
            return stores;
        }

        public async Task<Store> AddStore(Store store)
        {
            store.CreationDate = DateTime.Now;
            await _context.Stores.AddAsync(store);
            await _context.SaveChangesAsync();
            return store;
        }
        public async Task<Store> UpdateStore(Store store)
        {
            Store obj = await _context.Stores.Where(s => s.UserId == store.UserId).FirstOrDefaultAsync();
            obj.StoreName = store.StoreName;
            obj.WorkActivity = store.WorkActivity;
            obj.StoreDetails = store.StoreDetails;
            obj.NumbersOfUsers = store.NumbersOfUsers;
            obj.Image = store.Image;
            obj.Currency = store.Currency;
            await _context.SaveChangesAsync();
            return store;
        }
        public async Task<Store> GetUserStore(string userId)
        {
            return await _context.Stores.Where(e => e.UserId == userId).FirstOrDefaultAsync();
        }
        public async Task<Store> DeleteStore(string userId)
        {
            Store obj = await _context.Stores.Where(s => s.UserId == userId).FirstOrDefaultAsync();
            _context.Stores.Remove(obj);
            await _context.SaveChangesAsync();
            return obj;
        }
        public async Task<bool> StoreExists(string userId)
        {
            return await _context.Stores.AnyAsync(e => e.UserId == userId);
        }
    }
}

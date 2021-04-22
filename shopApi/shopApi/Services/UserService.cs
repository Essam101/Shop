using Application.Models;
using Microsoft.EntityFrameworkCore;
using ShopApi.DbModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ShopApi.Services
{
    public class UserService
    {

        private readonly ApplicationContext _context;

        public UserService(ApplicationContext context)
        {
            _context = context;
        }

        public async Task<List<User>> GetUsers(int storeId)
        {
            List<User> users = await _context.Users.Where(s => s.StoreId == storeId).ToListAsync();
            return users;
        }

        public async Task<User> AddUser(User user)
        {
            await _context.Users.AddAsync(user);
            await _context.SaveChangesAsync();
            return user;
        }

        public async Task<User> UpdateUser(User user)
        {
            User obj = await _context.Users.Where(s => s.UserId == user.UserId).FirstOrDefaultAsync();
            obj.Email = user.Email;
            obj.Password = user.Password;
            obj.SocialId = user.SocialId;
            await _context.SaveChangesAsync();
            return user;
        }

        public async Task<User> GetUser(int userId)
        {
            return await _context.Users.Where(e => e.UserId == userId).FirstOrDefaultAsync();
        }

        public async Task<User> DeleteUser(int userId)
        {
            User obj = await _context.Users.Where(s => s.UserId == userId).FirstOrDefaultAsync();
            _context.Users.Remove(obj);
            await _context.SaveChangesAsync();
            return obj;
        }

        public async Task<bool> UserExists(int userId)
        {
            return await _context.Users.AnyAsync(e => e.UserId == userId);
        }
    }
}

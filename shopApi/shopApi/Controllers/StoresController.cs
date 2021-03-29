using Application.Core;
using Application.DbModels;
using Application.Models;
using Application.Services;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Threading.Tasks;

namespace Application.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class StoresController : ApiControllerBase
    {
        private readonly StoreService _storeService;
        public StoresController(StoreService storeService)
        {
            _storeService = storeService;
        }

        [HttpGet]
        public async Task<JsonResult> GetStores()
        {
            var obj = await _storeService.GetStores();
            return ReturnResponse(HttpStatusCode.OK, true, obj);
        }
        [HttpGet("GetUserStore")]
        public async Task<JsonResult> GetUserStore(string userId)
        {
            var obj = await _storeService.GetUserStore(userId);
            return ReturnResponse(HttpStatusCode.OK, true, obj, "Done");
        }
        [HttpPost("Add")]
        public async Task<JsonResult> AddStore(Store store)
        {
            var obj = await _storeService.AddStore(store);
            return ReturnResponse(HttpStatusCode.Created, true, obj, "Done");
        }


        [HttpPut("Update")]
        public async Task<JsonResult> UpdateStore(Store store)
        {
            if (store.UserId == null)
            {
                return ReturnResponse(HttpStatusCode.BadRequest, false, null, "StoreId is requird ");
            }
            if (!await _storeService.StoreExists(store.UserId))
            {
                return ReturnResponse(HttpStatusCode.NoContent, true, null, "Store Not Exists");
            }
            var obj = await _storeService.UpdateStore(store);
            return ReturnResponse(HttpStatusCode.OK, true, obj, "Update Succsesfully");
        }

        [HttpDelete("Delete")]
        public async Task<JsonResult> DeleteTodoItem(string userId)
        {
            if (userId == null)
            {
                return ReturnResponse(HttpStatusCode.BadRequest, false, null, "StoreId is requird ");
            }
            if (!await _storeService.StoreExists(userId))
            {
                return ReturnResponse(HttpStatusCode.NoContent, true, null, "Store Not Exists");
            }
            var obj = await _storeService.DeleteStore(userId);
            return ReturnResponse(HttpStatusCode.OK, true, obj, "Delete Succsesfully");
        }

    }
}

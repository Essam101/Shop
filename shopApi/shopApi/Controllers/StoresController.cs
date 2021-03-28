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
        [HttpGet("GetStoreById")]
        public async Task<JsonResult> GetStoreById(int storeId)
        {
            var obj = await _storeService.GetStoreById(storeId);
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
            if (store.StoreId == 0)
            {
                return ReturnResponse(HttpStatusCode.BadRequest, false, null, "StoreId is requird ");
            }
            if (!await _storeService.StoreExists(store.StoreId))
            {
                return ReturnResponse(HttpStatusCode.NoContent, true, null, "Store Not Exists");
            }
            var obj = await _storeService.UpdateStore(store);
            return ReturnResponse(HttpStatusCode.OK, true, obj, "Update Succsesfully");
        }

        [HttpDelete("Delete")]
        public async Task<JsonResult> DeleteTodoItem(int StoreId)
        {
            if (StoreId == 0)
            {
                return ReturnResponse(HttpStatusCode.BadRequest, false, null, "StoreId is requird ");
            }
            if (!await _storeService.StoreExists(StoreId))
            {
                return ReturnResponse(HttpStatusCode.NoContent, true, null, "Store Not Exists");
            }
            var obj = await _storeService.DeleteStore(StoreId);
            return ReturnResponse(HttpStatusCode.OK, true, obj, "Delete Succsesfully");
        }

    }
}

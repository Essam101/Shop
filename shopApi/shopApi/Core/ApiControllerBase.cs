using System.Net.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Threading.Tasks;
 
namespace Application.Core
{
    public abstract class ApiControllerBase : ControllerBase
    {
        protected JsonResult ReturnResponse(HttpStatusCode returnCode, bool isValied = false, object data = null, string message = null)
        {
            if (message == null)
            {
                message = string.Empty;
            }
            var returnModel = new ApiReturnModel
            {
                IsVailed = isValied,
                Model = data,
                Messages = message
            };
            var result = new JsonResult(returnModel)
            {
                StatusCode = (int)returnCode
            };
            return result;
        }
    }
}
using Application.Core;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Diagnostics;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Http.Features;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Threading.Tasks;

namespace ShopApi.Core
{
    public static class ExceptionMiddlewareExtenstions
    {
        public static void ConfigureBuildInExceptionHandler(this IApplicationBuilder app)
        {
            app.UseExceptionHandler(appError =>
            {
                appError.Run(async context =>
                {
                     context.Response.ContentType = "application/json";

                    var contextFeature = context.Features.Get<IExceptionHandlerFeature>();
                    var contextRequest = context.Features.Get<IHttpRequestFeature>();
                    if (contextFeature != null)
                    {
                        await context.Response.WriteAsync(new ApiReturnModel()
                        {

                            IsValid = false,
                            Model = null,
                            Messages = contextFeature.Error.Message,
                            //StatusCode = context.Response.StatusCode,
                            //Message = contextFeature.Error.Message,
                            //Path = contextRequest.Path

                        }.ToString()); ;
                    }
                });
            });
        }
    }
}

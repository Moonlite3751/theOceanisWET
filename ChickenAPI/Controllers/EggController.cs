using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;

namespace ChickenAPI.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class EggController : Controller
    {
      
        [HttpGet("/GetMeEggs")]
        public IActionResult GetEggs()
        {
            return Ok("Here are some eggs! :)");
        }
    }
}
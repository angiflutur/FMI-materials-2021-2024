using Lab4_13.Services;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Lab4_13.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class DemoController : ControllerBase
    {
        public readonly IDemoService _demoService;

        public DemoController(IDemoService demoService)
        {
            _demoService = demoService;
        }

        [HttpGet]
        public IActionResult GetByTitle(string title)
        {
            var result = _demoService.GetDataMappedByTitle(title);

            return Ok(result);
        }
    }
}

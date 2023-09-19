using Lab3_14.Data;
using Lab3_14.Models.DTOs;
using Lab3_14.Models.One_to_Many;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace Lab3_14.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class StudentController : ControllerBase
    {
        private readonly Lab3Context _lab3Context;

        public StudentController(Lab3Context lab3Context)
        {
            _lab3Context = lab3Context;
        }

        [HttpGet]
        public async Task<IActionResult> Get()
        {
            return Ok(await _lab3Context.Students.ToListAsync());
        }

        [HttpGet("model1ById/{id}")]
        public async Task<IActionResult> GetModel1ById([FromRoute] Guid id)
        {
            var model1ById = from model1 in _lab3Context.Models1
                             where model1.Id == id
                             select model1;

            return Ok(model1ById);
        }

        [HttpPost("model1")]
        public async Task<IActionResult> Create(Model1Dto model1Dto)
        {

            var newModel1 = new Model1();
            newModel1.Name = model1Dto.Name;

            await _lab3Context.AddAsync(newModel1);
            await _lab3Context.SaveChangesAsync();

            return Ok(newModel1);
        }
    }
}

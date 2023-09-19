using DAL.Models.DTOs;
using Demo.Helpers.Attributes;
using Demo.Models.DTOs;
using Demo.Models.Enums;
using Demo.Services;
using Demo.Services.CourseService;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Demo.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CourseController : ControllerBase
    {
        public readonly ICourseService _courseService;

        public CourseController(ICourseService courseService)
        {
            _courseService = courseService;
        }

        [HttpGet]
        [Authorization(Role.Admin, Role.User)]
        public async Task<IActionResult> GetAll()
        {
            return Ok(await _courseService.GetAll());
        }

        [HttpPost]
        [Authorization(Role.Admin)]
        public async Task<IActionResult> AddCourse(CourseDto newCourse)
        {
            await this._courseService.AddCourse(newCourse);
            return Ok();
        }


        [HttpPost("{courseId}")]
        [Authorization(Role.Admin, Role.User)]
        public async Task<IActionResult> AddStudentsToCourse([FromRoute] Guid courseId, [FromBody] List<Guid> studentsIds)
        {
            return Ok(await this._courseService.AddStudentsToCourse(courseId, studentsIds));
        }


        [HttpDelete("{courseId}")]
        [Authorization(Role.Admin)]
        public async Task<IActionResult> DeleteCourse([FromRoute] Guid courseId)
        {
            await this._courseService.DeleteCourse(courseId);
            return Ok(await _courseService.GetAll());
        }
    }
}

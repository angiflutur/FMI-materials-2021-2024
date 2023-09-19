using Demo.Helpers.Attributes;
using Demo.Models.Enums;
using Demo.Services;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Demo.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class StudentController : ControllerBase
    {
        public readonly IStudentService _studentService;

        public StudentController(IStudentService studentService)
        {
            _studentService = studentService;
        }

        [HttpGet]
        [Authorization(Role.User, Role.Admin)]
        public async Task<IActionResult> GetAllStudents()
        {
            return Ok( await _studentService.GetAllStudents());
        }

        [HttpDelete("{studentId}")]
        [Authorization(Role.Admin)]
        public async Task<IActionResult> DeleteCourse([FromRoute] Guid studentId)
        {
            await this._studentService.DeleteStudent(studentId);
            return Ok(await _studentService.GetAllStudents());
        }
    }
}

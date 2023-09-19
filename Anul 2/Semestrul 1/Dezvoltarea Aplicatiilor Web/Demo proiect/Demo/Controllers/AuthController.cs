using Demo.Helpers.Attributes;
using Demo.Models;
using Demo.Models.DTOs.TeacherAuthRequestDto;
using Demo.Models.Enums;
using Demo.Services.TeacherService;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Demo.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AuthController : ControllerBase
    {
        private ITeacherService _teacherService;

        public AuthController(ITeacherService teacherService)
        {
            _teacherService = teacherService;
        }

        [HttpPost("create-teacher")]
        public async Task<IActionResult> CreateTeacher(TeacherAuthRequestDto user)
        {
            await _teacherService.Create(user);
            return Ok();
        }

        [HttpPost("login-teacher")]
        public IActionResult LoginTeacher(TeacherAuthRequestDto user)
        {
            var response = _teacherService.Authentificate(user);
            if (response == null)
            {
                return BadRequest("Username or password is invalid!");
            }
            return Ok(response);
        }
    }
}

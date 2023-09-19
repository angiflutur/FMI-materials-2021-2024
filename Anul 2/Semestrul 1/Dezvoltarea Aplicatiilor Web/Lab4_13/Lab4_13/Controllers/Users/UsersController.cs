using Lab4_13.Models;
using Lab4_13.Models.DTOs.Users;
using Lab4_13.Models.Enums;
using Lab4_13.Services.Users;
using BCryptNet = BCrypt.Net.BCrypt;
using Microsoft.AspNetCore.Mvc;
using Lab4_13.Helpers.Attributes;

namespace Lab4_13.Controllers.Users
{
    [Route("api/[controller]")]
    [ApiController]
    public class UsersController : ControllerBase
    {
        private IUsersService _userService;

        public UsersController(IUsersService userService)
        {
            _userService = userService;
        }

        [HttpPost("create-user")]
        public async Task<IActionResult> CreateUser(UserRequestDto user)
        {
            var userToCreate = new User
            {
                Username = user.UserName,
                FirstName = user.FirstName,
                LastName = user.LastName,
                Role = Role.User,
                Email = user.Email,
                PasswordHash = BCryptNet.HashPassword(user.Password)
            };

            await _userService.Create(userToCreate);
            return Ok();
        }

        [HttpPost("create-admin")]
        public async Task<IActionResult> CreateAdmin(UserRequestDto user)
        {
            var userToCreate = new User
            {
                Username = user.UserName,
                FirstName = user.FirstName,
                LastName = user.LastName,
                Role = Role.Admin,
                Email = user.Email,
                PasswordHash = BCryptNet.HashPassword(user.Password)
            };

            await _userService.Create(userToCreate);
            return Ok();
        }

        [HttpPost("authenticate")]
        public async Task<IActionResult> Authenticate(UserRequestDto user)
        {
            var response = _userService.Atuhentificate(user);
            if(response == null)
            {
                return BadRequest("Username or password is invalid!");
            }
            return Ok();
        }

        [Authorization(Role.Admin)]
        [HttpGet("admin")]
        public IActionResult GetAllAdmin()
        {
            var users = _userService.GetAllUsers();
            return Ok(users);
        }

        [Authorization(Role.User)]
        [HttpGet("user")]
        public IActionResult GetAllUser()
        {
            return Ok("User");
        }
    }
}

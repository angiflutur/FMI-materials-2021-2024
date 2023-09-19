using Lab4_13.Models;
using Lab4_13.Models.DTOs.Users;

namespace Lab4_13.Services.Users
{
    public interface IUsersService
    {
        UserResponseDto Atuhentificate(UserRequestDto model);
        Task<List<User>> GetAllUsers();
        User GetById(Guid id);
        Task Create(User newUser);
    }
}

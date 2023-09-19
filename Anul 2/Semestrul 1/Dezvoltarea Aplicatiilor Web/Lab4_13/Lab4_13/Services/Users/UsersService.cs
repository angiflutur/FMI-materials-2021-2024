using Lab4_13.Helpers.JwtUtils;
using Lab4_13.Models;
using Lab4_13.Models.DTOs.Users;
using Lab4_13.Repositories.UsersRepository;
using BCryptNet = BCrypt.Net.BCrypt;

namespace Lab4_13.Services.Users
{
    public class UsersService: IUsersService
    {
        public IUserRepository _userRepository;
        private IJwtUtils _jwtUtils;

        public UsersService(IUserRepository userRepository, IJwtUtils jwtUtils)
        {
            _userRepository = userRepository;
            _jwtUtils = jwtUtils;
        }

        public UserResponseDto Atuhentificate(UserRequestDto model)
        {
            var user = _userRepository.FindByUsername(model.UserName);
            if(user == null || !BCryptNet.Verify(model.Password, user.PasswordHash))
            {
                return null; //or throw exception
            }


            // jwt generation
            var jwtToken = _jwtUtils.GenerateJwtToken(user);
            return new UserResponseDto(user, jwtToken);
        }

        public async Task Create(User newUser)
        {
            await _userRepository.CreateAsync(newUser);
            await _userRepository.SaveAsync();
        }

        public async Task<List<User>> GetAllUsers()
        {
            return await _userRepository.GetAllAsync();
        }

        public User GetById(Guid id)
        {
            return _userRepository.FindById(id);
        }
    }
}

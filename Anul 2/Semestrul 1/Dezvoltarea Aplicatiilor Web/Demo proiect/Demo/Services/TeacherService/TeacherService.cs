using AutoMapper;
using Demo.Helpers.Jwt;
using Demo.Models;
using Demo.Models.DTOs.TeacherAuthRequestDto;
using Demo.Models.DTOs.TeacherAuthResponseDto;
using Demo.Models.Enums;
using Demo.Repositories.TeacherRepository;
using Microsoft.AspNetCore.Identity;
using BCryptNet = BCrypt.Net.BCrypt;

namespace Demo.Services.TeacherService
{
    public class TeacherService : ITeacherService
    {
        public ITeacherRepository _teacherRepository;
        public IJwtUtils _jwtUtilis;
        public IMapper _mapper;

        public TeacherService(ITeacherRepository teacherRepository, IJwtUtils jwtUtilis, IMapper mapper)
        {
            _teacherRepository = teacherRepository;
            _jwtUtilis = jwtUtilis;
            _mapper = mapper;
        }

        public TeacherAuthResponseDto Authentificate(TeacherAuthRequestDto model)
        {
            var teacher = _teacherRepository.FindByEmail(model.Email);
            if (teacher == null || !BCryptNet.Verify(model.Password, teacher.PasswordHash)){
                return null; // or throw exception
            }

            // jwt generation
            var jwtToken = _jwtUtilis.GenerateJwtToken(teacher);
            return new TeacherAuthResponseDto(teacher, jwtToken);
        }

        public async Task Create(TeacherAuthRequestDto teacher)
        {
           var newDBTeacher = _mapper.Map<Teacher>(teacher);
           newDBTeacher.PasswordHash = BCryptNet.HashPassword(teacher.Password);
           newDBTeacher.Role = Role.User;
           
           await _teacherRepository.CreateAsync(newDBTeacher);
           await _teacherRepository.SaveAsync();
        }

        public async Task<List<Teacher>> GetAllTeachers()
        {
           return await _teacherRepository.GetAll();
        }

        public Teacher GetById(Guid id)
        {
            return _teacherRepository.FindById(id);
        }
    }
}

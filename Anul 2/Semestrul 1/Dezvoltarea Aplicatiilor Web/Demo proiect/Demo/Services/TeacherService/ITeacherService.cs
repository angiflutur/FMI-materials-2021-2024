using Demo.Models;
using Demo.Models.DTOs.TeacherAuthRequestDto;
using Demo.Models.DTOs.TeacherAuthResponseDto;

namespace Demo.Services.TeacherService
{
    public interface ITeacherService
    {
        TeacherAuthResponseDto Authentificate(TeacherAuthRequestDto model);
        Task<List<Teacher>> GetAllTeachers();
        Teacher GetById(Guid id);
        Task Create(TeacherAuthRequestDto newTeacher);
    }
}

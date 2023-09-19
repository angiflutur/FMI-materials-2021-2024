using Demo.Models.DTOs;

namespace Demo.Services
{
    public interface IStudentService
    {
        Task<List<StudentDto>> GetAllStudents();
        public Task DeleteStudent(Guid studentId);

    }
}

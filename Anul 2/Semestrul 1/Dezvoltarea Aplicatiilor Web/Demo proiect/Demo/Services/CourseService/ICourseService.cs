using DAL.Models.DTOs;
using Demo.Models;
using Demo.Models.DTOs;

namespace Demo.Services.CourseService
{
    public interface ICourseService
    {
        public Task<List<CourseDto>> GetAll();
        public Task AddCourse(CourseDto newCourse);
        public Task<List<CourseWithStudentsDto>> AddStudentsToCourse(Guid courseId, List<Guid> studentsIds);
        public Task DeleteCourse(Guid courseId);
    }
}

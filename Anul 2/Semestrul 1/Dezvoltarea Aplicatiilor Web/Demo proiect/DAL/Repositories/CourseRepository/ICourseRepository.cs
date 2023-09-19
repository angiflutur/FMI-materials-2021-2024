using Demo.Models;
using Demo.Repository.GenericRepository;

namespace DAL.Repositories.CourseRepository
{
    public interface ICourseRepository : IGenericRepository<Course>
    {
        public Task<List<Course>> GetCoursesWithStudents();
    }
}

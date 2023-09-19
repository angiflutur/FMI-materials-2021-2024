using Demo.Data;
using Demo.Models;
using Demo.Repository.GenericRepository;

namespace DAL.Repositories.StudentInCourseRepository
{
    public class StudentInCourseRepository : GenericRepository<StudentInCourse>, IStudentInCourseRepository
    {
        public StudentInCourseRepository(DemoContext context) : base(context) { }
    }
}

using Demo.Data;
using Demo.Models;
using Demo.Repository.GenericRepository;
using Microsoft.EntityFrameworkCore;

namespace DAL.Repositories.CourseRepository
{
    public class CourseRepository : GenericRepository<Course>, ICourseRepository
    {
        public CourseRepository(DemoContext context) : base(context) { }

        public async Task<List<Course>> GetCoursesWithStudents()
        {
            return await _table.Include(x => x.StudentsInCourses).ThenInclude(x => x.Student).ToListAsync();
        }
    }
}


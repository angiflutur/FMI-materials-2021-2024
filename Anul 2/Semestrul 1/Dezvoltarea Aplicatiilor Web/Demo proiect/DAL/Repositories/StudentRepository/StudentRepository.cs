using Demo.Data;
using Demo.Models;
using Demo.Repository.GenericRepository;
using Microsoft.EntityFrameworkCore;

namespace Demo.Repositories.StudentRepository
{
    public class StudentRepository : GenericRepository<Student>, IStudentRepository
    {
        public StudentRepository(DemoContext context) : base(context) { }

        public async Task<List<Student>> FindRange(List<Guid> studentsIds)
        {
           return await _table.Where(x => studentsIds.Contains(x.Id)).ToListAsync();
        }
    }
}

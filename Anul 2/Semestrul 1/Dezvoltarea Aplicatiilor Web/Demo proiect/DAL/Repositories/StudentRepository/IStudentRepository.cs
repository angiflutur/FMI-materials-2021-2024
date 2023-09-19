using Demo.Models;
using Demo.Repository.GenericRepository;

namespace Demo.Repositories.StudentRepository
{
    public interface IStudentRepository: IGenericRepository<Student>
    {
        public Task<List<Student>> FindRange(List<Guid> studentsIds);
    }
}

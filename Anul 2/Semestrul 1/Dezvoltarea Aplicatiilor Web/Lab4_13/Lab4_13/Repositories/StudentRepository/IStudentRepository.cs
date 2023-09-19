using Lab4_13.Models;
using Lab4_13.Repositories.GenericRepository;

namespace Lab4_13.Repositories.StudentRepository
{
    public interface IStudentRepository: IGenericRepository<Student>
    {
        public void OrderByAge();
        public void OrderByAgeAndName();
        public void GroupBy();
    }
}

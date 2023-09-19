using Demo.Models;
using Demo.Repository.GenericRepository;

namespace Demo.Repositories.TeacherRepository
{
    public interface ITeacherRepository: IGenericRepository<Teacher>
    {
        Teacher FindByEmail(string email);   
    }
}

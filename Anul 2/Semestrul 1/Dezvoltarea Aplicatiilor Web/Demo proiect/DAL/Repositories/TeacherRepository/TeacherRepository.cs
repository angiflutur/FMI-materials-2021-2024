using Demo.Data;
using Demo.Models;
using Demo.Repository.GenericRepository;

namespace Demo.Repositories.TeacherRepository
{
    public class TeacherRepository: GenericRepository<Teacher>, ITeacherRepository
    {
        public TeacherRepository(DemoContext context): base(context)
        {

        }

        public Teacher FindByEmail(string email)
        {
            return _table.FirstOrDefault(x => x.Email == email);
        }
    }
}

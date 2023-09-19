using Lab4_13.Data;
using Lab4_13.Models;
using Lab4_13.Repositories.GenericRepository;

namespace Lab4_13.Repositories.UsersRepository
{
    public class UsersRepository: GenericRepository<User>, IUserRepository
    {
        public UsersRepository(Lab4Context context): base(context)
        {

        }

        public User FindByUsername(string username)
        {
            return _table.FirstOrDefault(x => x.Username == username);
        }
    }
}

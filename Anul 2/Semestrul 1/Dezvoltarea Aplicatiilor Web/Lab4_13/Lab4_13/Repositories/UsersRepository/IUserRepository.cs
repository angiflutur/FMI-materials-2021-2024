using Lab4_13.Models;
using Lab4_13.Repositories.GenericRepository;

namespace Lab4_13.Repositories.UsersRepository
{
    public interface IUserRepository: IGenericRepository<User>
    {
        User FindByUsername(string username);   
    }
}

using Lab4_13.Models;
using Lab4_13.Repositories.GenericRepository;

namespace Lab4_13.Repositories.DatabaseRepository
{
    public interface IDatabaseRepository: IGenericRepository<Model1>
    {
        Model1 GetByTitle(string title);   
        Model1 GetByTitleIncludingModel2(string title);

        Task<List<Model1>> GetAllWithInclude();
        Task<List<Model1>> GetAllWithJoin();
    }
}

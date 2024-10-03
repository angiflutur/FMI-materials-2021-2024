using proiect.Models;
using proiect.Repositories.GenericRepository;

namespace proiect.Repositories.DatabaseRepository
{
  public interface IDatabaseRepository : IGenericRepository<Film>
  {
    Film GetByStars(int number);

    Task<List<Film>> GetAllWithInclude();
  }
}

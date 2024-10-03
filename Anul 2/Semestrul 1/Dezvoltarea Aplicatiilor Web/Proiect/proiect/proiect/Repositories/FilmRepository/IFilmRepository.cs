using System.Collections.Generic;
using System.Threading.Tasks;
using proiect.Models;
using proiect.Repositories.GenericRepository;

namespace proiect.Repositories.StoreRepository
{
    public interface IFilmRepository : IGenericRepository<Film>
    {
        Film FindByName(string name);

        Task<List<Film>> FilmsByStar(int star);

        List<Film> FilmsByStarGroupBy(int star);
    }
}

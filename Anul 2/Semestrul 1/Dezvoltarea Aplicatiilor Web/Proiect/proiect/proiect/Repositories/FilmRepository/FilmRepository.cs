using Microsoft.EntityFrameworkCore;
using proiect.Data;
using proiect.Models;
using proiect.Repositories.GenericRepository;
using proiect.Repositories.StoreRepository;

namespace proiect.Repositories.FilmRepository
{
    public class FilmRepository : GenericRepository<Film>, IFilmRepository
  {
    public FilmRepository(AppDbContext context) : base(context) { }

    public Film FindByName(string name)
    {
      return _table.FirstOrDefault(x => x.Titlu == name);
    }

    //where
    public async Task<List<Film>> FilmsByStar(int star)
    {
      return await _table.Where(x => x.Stars>=star).ToListAsync();
    }

    //groupby
        public List<Film> FilmsByStarGroupBy(int star)
        {
            var filmsGrouped = _table.GroupBy(x => x.Stars)
                                    .Where(gr => gr.Key == star)
                                    .SelectMany(gr => gr.ToList())
                                    .ToList();

            return filmsGrouped;
        }

    }
}

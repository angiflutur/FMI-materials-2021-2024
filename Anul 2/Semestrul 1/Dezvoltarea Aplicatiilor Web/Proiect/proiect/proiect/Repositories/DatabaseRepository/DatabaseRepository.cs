using proiect.Data;
using proiect.Models;
using proiect.Repositories.GenericRepository;
using Microsoft.EntityFrameworkCore;

namespace proiect.Repositories.DatabaseRepository
{
  public class DatabaseRepository : GenericRepository<Film>, IDatabaseRepository
  {
    public DatabaseRepository(AppDbContext context) : base(context)
    {

    }

    public Film GetByStars(int number)
    {
      return _table.FirstOrDefault(x => x.Stars >= number);
    }
    public async Task<Film> GetByStarsAsync(int number)
    {
      return await _table.FirstOrDefaultAsync(x => x.Stars >= number);
    }

    //include
    public async Task<List<Film>> GetAllWithInclude()
    {
      return await _table.Include(x => x.Actori_Filme).ToListAsync();
    }


  //join
  //public async Task<List<Film>> GetAllWithJoin()
  ////{
  ////    //var result = _table.Join(
  ////    //_context.Owners,               
  ////    //film => film.IdFilm,          
  ////    //owner => owner.Id,            
  ////    //(film, owner) => film ).ToList();

  ////    //      return result;
  //}
    }
}

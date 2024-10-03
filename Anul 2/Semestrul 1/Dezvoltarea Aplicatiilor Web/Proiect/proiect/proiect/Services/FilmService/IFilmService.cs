using proiect.Models.DTOs;

namespace proiect.Services
{
  public interface IFilmService
  {
    public Task DeleteStore(Guid StoreId);
    public Task<List<FilmDto>> GetAllStores();

    public Task AddStore(FilmDto newStore);
  }
}

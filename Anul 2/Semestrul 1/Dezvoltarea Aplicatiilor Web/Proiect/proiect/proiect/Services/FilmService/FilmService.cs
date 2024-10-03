using proiect.Services;
using proiect.Models;
using proiect.Models.DTOs;
using proiect.Repositories.StoreRepository;
using proiect.Repositories.EmployeeRepository;
using AutoMapper;

namespace Demo.Services.CourseService
{
    public class FilmService : IFilmService
  {
    public IFilmRepository _storeRepository;

    public IActorRepository _employeeRepository;
    public IMapper _mapper;
    public FilmService(IFilmRepository storeRepository, IMapper mapper, IActorRepository employeeRepository)
    {
      _storeRepository = storeRepository;
      _employeeRepository = employeeRepository;
      _mapper = mapper;
    }

    public async Task AddStore(FilmDto newStore)
    {
      var newDbStore = _mapper.Map<Film>(newStore);
      await _storeRepository.CreateAsync(newDbStore);
      await _storeRepository.SaveAsync();
    }

    public async Task DeleteStore(Guid storeId)
    {
      var store = await _storeRepository.FindByIdAsync(storeId);
      _storeRepository.Delete(store);
      await _storeRepository.SaveAsync();
    }

    public async Task<List<FilmDto>> GetAllStores()
    {
      var stores = await _storeRepository.GetAllAsync();
      return _mapper.Map<List<FilmDto>>(stores);
    }
  }
}

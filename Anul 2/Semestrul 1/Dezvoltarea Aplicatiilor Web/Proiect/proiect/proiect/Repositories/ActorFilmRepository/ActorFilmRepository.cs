using proiect.Data;
using proiect.Models;
using proiect.Repositories.GenericRepository;

namespace proiect.Repositories.EmployeeStoreRepository
{
  public class ActorFilmRepository : GenericRepository<Actor_Film>, IActorFilmRepository
  {
    public ActorFilmRepository(AppDbContext context) : base(context) { }
  }
}

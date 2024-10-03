using proiect.Models;
using proiect.Repositories.GenericRepository;

namespace proiect.Repositories.EmployeeRepository
{
  public interface IActorRepository : IGenericRepository<Actor>
  {
        Actor FindById(Guid IdActor);
    }
}

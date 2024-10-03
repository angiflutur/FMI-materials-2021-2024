using proiect.Data;
using proiect.Models;
using proiect.Repositories.EmployeeRepository;
using proiect.Repositories.GenericRepository;

public class ActorRepository : GenericRepository<Actor>, IActorRepository
{
    public ActorRepository(AppDbContext context) : base(context) { }

    public Actor FindById(int id)
    {
        var actor = _table.FirstOrDefault(x => x.IdActor == id);
        return actor;
    }

    public Actor FindById(Guid IdActor)
    {
        throw new NotImplementedException();
    }
}

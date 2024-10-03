using proiect.Data;
using proiect.Models;
using proiect.Repositories.GenericRepository;

namespace proiect.Repositories.OwnerRepository
{
  public class OwnerRepository : GenericRepository<Owner>, IOwnerRepository
  {
    public OwnerRepository(AppDbContext context) : base(context)
    {

    }

    public Owner FindByEmail(string email)
    {
      return _table.FirstOrDefault(x => x.Email == email);
    }
  }
}

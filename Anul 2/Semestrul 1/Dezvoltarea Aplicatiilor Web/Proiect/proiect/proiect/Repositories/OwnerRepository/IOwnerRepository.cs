using proiect.Models;
using proiect.Repositories.GenericRepository;

namespace proiect.Repositories.OwnerRepository
{
  public interface IOwnerRepository : IGenericRepository<Owner>
  {
    Owner FindByEmail(string email);
  }
}

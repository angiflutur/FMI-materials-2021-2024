using proiect.Data;
using proiect.Models;

namespace proiect.Helpers.Seeders
{
  public class ActorSeeder
  {
    public readonly AppDbContext _AppDbContext;

    public ActorSeeder(AppDbContext AppDbContext)
    {
      _AppDbContext = AppDbContext;
    }

    public void SeedInitialActors()
    {
      if (!_AppDbContext.Actori.Any())
      {
        var Actor1 = new Actor
        {
          NumeActor = "nume",
          Bio = "bio"
        };
        var Actor2 = new Actor
        {
            NumeActor = "nume",
            Bio = "bio"
        };

        _AppDbContext.Actori.Add(Actor1);
        _AppDbContext.Actori.Add(Actor2);

        _AppDbContext.SaveChanges();
      }
    }
  }
}

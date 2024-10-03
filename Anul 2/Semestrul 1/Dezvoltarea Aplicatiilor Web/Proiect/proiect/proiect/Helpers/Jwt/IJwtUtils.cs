using proiect.Models;

namespace proiect.Helpers.Jwt
{
  public interface IJwtUtils
  {
    public string GenerateJwtToken(Owner admin);
    public Guid ValidateJwtToken(string token);
  }
}

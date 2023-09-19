using Demo.Models;

namespace Demo.Helpers.Jwt
{
    public interface IJwtUtils
    {
        public string GenerateJwtToken(Teacher teacher);
        public Guid ValidateJwtToken(string token);
    }
}

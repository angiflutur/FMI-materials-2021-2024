using proiect.Helpers.Jwt;
using proiect.Services.OwnerService;

namespace proiect.Helpers.Middleware
{
    public class JwtMiddleware
  {
    private readonly RequestDelegate _nextRequestDelegate;

    public JwtMiddleware(RequestDelegate requestDelegate)
    {
      _nextRequestDelegate = requestDelegate;
    }

    public async Task Invoke(HttpContext httpContext, IOwnerService ownerService, IJwtUtils jwtUtils)
    {
      var token = httpContext.Request.Headers["Authorization"].FirstOrDefault()?.Split("").Last();

      var ownerId = jwtUtils.ValidateJwtToken(token);

      if (ownerId != Guid.Empty)
      {
        httpContext.Items["Owner"] = ownerService.GetById(ownerId);
      }

      await _nextRequestDelegate(httpContext);
    }

  }
}

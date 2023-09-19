using Demo.Helpers.Jwt;
using Demo.Services.TeacherService;

namespace Demo.Helpers.Middleware
{
    public class JwtMiddleware
    {
        private readonly RequestDelegate _next;

        public JwtMiddleware(RequestDelegate next)
        {
            _next = next;
        } 
        
        public async Task Invoke(HttpContext httpContext, ITeacherService teacherService, IJwtUtils jwtUtils)
        {
            var token = httpContext.Request.Headers["Authorization"].FirstOrDefault()?.Split(" ").Last();

            var userId = jwtUtils.ValidateJwtToken(token);

            if(userId != Guid.Empty)
            {
                // httpContext.Items["User"] = teacherService.GetById(userId);

                httpContext.Items["Teacher"] = teacherService.GetById(userId);

            }

            await _next(httpContext);
        }
    }
}

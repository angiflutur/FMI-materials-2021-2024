using Demo.Models;
using Demo.Models.Enums;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;

namespace Demo.Helpers.Attributes
{
    public class AuthorizationAttribute:Attribute, IAuthorizationFilter
    {
        private readonly ICollection<Role> _roles;

        public AuthorizationAttribute(params Role[] roles)
        {
            _roles = roles;
        }

        public void OnAuthorization(AuthorizationFilterContext context)
        {
            var unauthorizedStatusObject = new JsonResult(new { Message = "Unauthorized" })
            { StatusCode = StatusCodes.Status401Unauthorized };

            if(_roles == null)
            {
                context.Result = unauthorizedStatusObject;
            }

            // Teacher? techer = context.HttpContext.Items["User"] as Teacher;
            Teacher? teacher = context.HttpContext.Items["Teacher"] as Teacher;

            if (teacher == null || !_roles.Contains(teacher.Role))
            {
                context.Result = unauthorizedStatusObject;
            }
        }
    }
}

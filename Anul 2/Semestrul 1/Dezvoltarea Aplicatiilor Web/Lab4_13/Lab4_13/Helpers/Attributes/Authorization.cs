using Lab4_13.Models;
using Lab4_13.Models.Enums;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;

namespace Lab4_13.Helpers.Attributes
{
    public class AuthorizationAttribute: Attribute, IAuthorizationFilter
    {
        private readonly ICollection<Role> _roles;

        public AuthorizationAttribute(params Role[] roles)
        {
            _roles = roles;
        }

        public void OnAuthorization(AuthorizationFilterContext context)
        {
            var unauthorizedStatusObject = new JsonResult(new { Message = "Unauthorzed" })
            { StatusCode = StatusCodes.Status401Unauthorized };


            if(_roles == null)
            {
                context.Result = unauthorizedStatusObject;  
            }

            var user = (User)context.HttpContext.Items["User"];
            if(user == null || !_roles.Contains(user.Role))
            {
                context.Result = unauthorizedStatusObject;
            }
        }
    }
}

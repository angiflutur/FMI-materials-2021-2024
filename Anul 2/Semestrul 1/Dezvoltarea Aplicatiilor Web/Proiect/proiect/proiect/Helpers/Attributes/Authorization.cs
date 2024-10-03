using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using proiect.Models;
using proiect.Models.Enums;

namespace Demo.Helpers.Attributes
{
  public class AuthorizationAttribute : Attribute, IAuthorizationFilter
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

      if (_roles == null)
      {
        context.Result = unauthorizedStatusObject;
      }

      Owner? owner = context.HttpContext.Items["Owner"] as Owner;

      if (owner == null || !_roles.Contains(owner.Role))
      {
        context.Result = unauthorizedStatusObject;
      }
    }
  }
}

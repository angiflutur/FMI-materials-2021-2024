using Demo.Models;

namespace Demo.Helpers.Extensions
{
    public static class OnlyActive
    {
        public static IQueryable<Student> GetActive(this IQueryable<Student> entities)
        {
            return entities.Where(x => x.IsDeleted == false);
        }
    }
}

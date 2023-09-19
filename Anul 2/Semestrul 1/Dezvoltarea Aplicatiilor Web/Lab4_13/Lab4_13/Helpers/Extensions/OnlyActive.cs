using Lab4_13.Models;

namespace Lab4_13.Helpers.Extensions
{
    public static class OnlyActive
    {
        public static IQueryable<Student> GetActive(this IQueryable<Student> students)
        {
            return students.Where(x => x.IsDeleted == false);
        }
    }
}

namespace DAL.Models.DTOs
{
    public class CourseDto
    {
        public Guid Id { get; set; }
        public string Title { get; set; } = string.Empty;
        public string Description { get; set; } = string.Empty;

        public int MaximumStudentsAllowed { get; set; }
        public string TeacherName { get; set; } = string.Empty;
        public int Grade { get; set; }
    }
}

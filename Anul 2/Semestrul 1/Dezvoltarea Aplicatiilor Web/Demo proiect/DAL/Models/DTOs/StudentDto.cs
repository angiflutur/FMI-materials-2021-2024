using DAL.Models.DTOs;

namespace Demo.Models.DTOs
{
    public class StudentDto
    {
        public Guid Id { get; set; }
        public string FirstName { get; set; } = string.Empty;
        public string LastName { get; set; } = string.Empty;

        public int Age { get; set; }
        public string Email { get; set; } = string.Empty;

        public string StudyingYear { get; set; } = string.Empty;
        public bool IsToBuget { get; set; }

        public ICollection<CourseDto>? Courses { get; set; }
    }
}
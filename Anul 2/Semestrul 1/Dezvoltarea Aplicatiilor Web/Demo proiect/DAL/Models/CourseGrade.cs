using Demo.Models.Base;

namespace Demo.Models
{
    public class CourseGrade: BaseEntity
    {
        public double Value { get; set; }
        public string? Description { get; set; }

        public StudentInCourse StudentInCourse { get; set; }
    }
}

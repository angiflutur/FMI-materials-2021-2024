using System.Reflection;

namespace Demo.Models
{
    public class StudentInCourse
    {
        public Guid StudentId { get; set; }
        public Student Student { get; set; }


        public Guid CourseId { get; set; }
        public Course Course { get; set; }

        public CourseGrade? StudentCourseGrade { get; set; }
        public Guid? StudentCourseGradeId { get; set; }

    }
}

using Demo.Models.Base;

namespace Demo.Models
{
    public class Student: BaseEntity
    {
        public string FirstName { get; set; } = "";
        public string LastName { get; set; } = "";

        public int Age { get; set; }
        public string Email { get; set; } = "";

        public string StudyingYear { get; set; } = DateTime.UtcNow.Year.ToString();
        public bool IsToBuget { get; set; }
 
        public ICollection<StudentInCourse> StudentsInCourses { get; set; }

        public bool IsDeleted { get; set; }

        // var Student = new Student(..prop)
        // var Course = new Course (..prop)
        // Student.Course = course;
        // save();
    }
}

using DAL.Models.DTOs;
using Demo.Models.Base;

namespace Demo.Models
{
    public class Course: BaseEntity
    {
        public string Title { get; set; } = "";
        public string Description { get; set; } = "";

        public int MaximumStudentsAllowed { get; set; } = 0;

        public ICollection<StudentInCourse>? StudentsInCourses { get; set; }

        public Teacher? Teacher { get; set; }    
    }
}

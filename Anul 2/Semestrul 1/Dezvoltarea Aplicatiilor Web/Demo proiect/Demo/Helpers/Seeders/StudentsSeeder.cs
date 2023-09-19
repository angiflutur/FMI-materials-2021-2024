using Demo.Data;
using Demo.Models;

namespace Demo.Helpers.Seeders
{
    public class StudentsSeeder
    {
        public readonly DemoContext _demoContext;

        public StudentsSeeder(DemoContext demoContext)
        {
            _demoContext = demoContext;
        }

        public void SeedInitialStudents()
        {
            if (!_demoContext.Students.Any())
            {
                var student1 = new Student
                {
                    FirstName = "Student 1",
                    Age = 21,
                    IsDeleted = false
                };
                var student2 = new Student
                {
                    FirstName = "Student 2",
                    Age = 21,
                    IsDeleted = false
                };

                _demoContext.Students.Add(student1);
                _demoContext.Students.Add(student2);

                _demoContext.SaveChanges();
            }
        }
    }
}

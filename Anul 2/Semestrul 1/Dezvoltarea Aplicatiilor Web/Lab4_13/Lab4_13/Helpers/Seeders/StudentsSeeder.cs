using Lab4_13.Data;
using Lab4_13.Models;

namespace Lab4_13.Helpers.Seeders
{
    public class StudentsSeeder
    {
        public readonly Lab4Context _lab4Context;

        public StudentsSeeder(Lab4Context lab4Context)
        {
            _lab4Context = lab4Context;
        }

        public void SeedIntialStudents()
        {
            if (!_lab4Context.Students.Any())
            {
                var student1 = new Student
                {
                    Name = "Student1",
                    Age = 21,
                    IsDeleted = false
                };

                var student2 = new Student
                {
                    Name = "Student2",
                    Age = 24,
                    IsDeleted = false
                };

                _lab4Context.Add(student1);
                _lab4Context.Add(student2);

                _lab4Context.SaveChanges();
            }
        }
    }
}

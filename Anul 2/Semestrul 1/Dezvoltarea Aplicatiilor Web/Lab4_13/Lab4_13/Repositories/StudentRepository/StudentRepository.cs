using Lab4_13.Data;
using Lab4_13.Helpers.Extensions;
using Lab4_13.Models;
using Lab4_13.Repositories.GenericRepository;

namespace Lab4_13.Repositories.StudentRepository
{
    public class StudentRepository: GenericRepository<Student>, IStudentRepository
    {
        public StudentRepository(Lab4Context lab4Context) : base(lab4Context)
        {

        }

        public void OrderByAge()
        {
            var studentsOrderAsc1 = _table.OrderBy(x => x.Age);
            var studentsOrderDesc1 = _table.OrderByDescending(x => x.Age);


            // linq query syntax
            var studentsOrderAsc2 = from s in _table
                                    orderby s.Age
                                    select s;

            var studentsOrderDesc2 = from s in _table
                                    orderby s.Age descending
                                    select s;
        }

        public void OrderByAgeAndName()
        {
            var studentsOrderAsc1 = _table.GetActive().OrderBy(x => x.Age).ThenBy(x => x.Name);
            var studentsOrderDesc1 = _table.OrderByDescending(x => x.Age).ThenByDescending(x => x.Name);
        }


        public void GroupBy()
        {
            var groupedStudents1 = from s in _table
                                   group s by s.Age;

            foreach(var studentGroupByAge in groupedStudents1)
            {
                Console.WriteLine("Student group age: " + studentGroupByAge.Key);
                foreach(Student s in studentGroupByAge)
                {
                    Console.WriteLine("Student name: " + s.Name);
                }
            }

            var groupedStudents2 = _table.GroupBy(x => x.Age); 
        }

    }
}

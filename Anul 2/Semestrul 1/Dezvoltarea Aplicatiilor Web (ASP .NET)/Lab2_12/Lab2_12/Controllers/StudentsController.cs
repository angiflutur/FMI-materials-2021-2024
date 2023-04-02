using Lab2_12.Models;
using Microsoft.AspNetCore.JsonPatch;
using Microsoft.AspNetCore.Mvc;

namespace Lab2_12.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class StudentsController : ControllerBase
    {
        public static List<Student> students = new List<Student>
        {
            new Student{ Id = 1, Name = "Ana", Age = 21},
            new Student {Id = 2, Name = "Maria", Age = 30},
            new Student {Id = 3, Name = "Vlad", Age = 31 },
            new Student {Id = 4, Name = "Florin", Age = 40},
            new Student{ Id = 5, Name = "Ana", Age = 11},
            new Student{ Id = 6, Name = "Ana", Age = 31},
        };

        public static Dictionary<int, Student> studentsDictionary = new Dictionary<int, Student>
        {
            {1, new Student{ Id = 1, Name = "Ana", Age = 21}},
            {2, new Student {Id = 2, Name = "Maria", Age = 30}}
        };

        //public static List<Student> students2 = new List<Student>();
        //StudentsController()
        //{
        //    var student = new Student { Id = 2, Name = "Maria", Age = 30 };
        //    var student2 = new Student();
        //    student2.Id = 3;
        //    student2.Name = "Mihai";
        //    student2.Age = 12;
        //    students2.Add(student);
        //}


        // endpoint
        // GET
        [HttpGet]
        public List<Student> Get()
        {
            return students;
        }


        // sa nu avem methode de acelasi tip cu aceiasi ruta
        //[HttpGet]
        //public List<Student> Get2()
        //{
        //    return students;
        //}

        [HttpGet("byId")]
        public Student GetById(int id)
        {
            return students.FirstOrDefault(x => x.Id.Equals(id));
        }

        [HttpGet("byId/{id}")]
        public Student GetByIdInEndpoint(int id)
        {
            return students.FirstOrDefault(x => x.Id.Equals(id));
        }

        [HttpGet("filter/{name}/{age}")]
        public List<Student> GetWithFilters(string name, int age)
        {
            return students.Where(x => x.Name.ToLower() == name.ToLower() && x.Age > age).ToList();
        }

        // atribute .net
        // unele sunt necesare atunci cand transmitem date in query params/ruta/headere
        [HttpGet("fromRouteWithId/{id}")]
        public Student GetByIdWithFromRoute([FromRoute] int id)
        {
            Student student = students.FirstOrDefault(x => x.Id.Equals(id));
            return student;
        }

        [HttpGet("fromHeader")]
        public Student GetByIdWithHeader([FromHeader] int id)
        {
            return students.FirstOrDefault(x => x.Id.Equals(id));
        }

        [HttpGet("fromQuery")]
        public Student GetByIdWithFromQuery([FromQuery] int id)
        {
            return students.FirstOrDefault(x => x.Id.Equals(id));
        }

        // STATUS CODES 

        // 200
        [HttpGet("statusCodeOk")]
        public IActionResult StatusCodeOk()
        {
            return Ok("It's ok!");
        }

        //204
        [HttpGet("statusCodeNoContent")]
        public IActionResult StatusCodeNoContent()
        {
            return NoContent();
        }

        //404
        [HttpGet("statusCodeNotFound")]
        public IActionResult StatusCodeNotFount()
        {
            return NotFound();
        }

        //403
        [HttpGet("statusCodeForbid")]
        public IActionResult StatusCodeForbid()
        {
            return Forbid();
        }

        //400
        [HttpGet("statusCodeBadRequest")]
        public IActionResult StatusCodeBadRequest()
        {
            return BadRequest();
        }

        // CREATE
        [HttpPost]
        public IActionResult Add(Student student)
        {
            students.Add(student);
            return Ok(students);
        }

        [HttpPost("postInDictionary")]
        public IActionResult AddInDictionary(Student student)
        {
            studentsDictionary.Add(student.Id, student);
            return Ok(studentsDictionary);
        }

        [HttpPost("fromBody")]
        public IActionResult AddWithFromBody([FromBody] Student student)
        {
            students.Add(student);
            return Ok(students);
        }

        [HttpPost("fromForm")]
        public IActionResult AddWithFromForm([FromForm] Student student)
        {
            students.Add(student);
            return Ok(students);
        }

        //metoda async
        [HttpPost("addAsync")]
        public async Task<IActionResult> AddAsync(Student student)
        {
            students.Add(student);
            return Ok(students);
        }

        //update total
        [HttpPost("update")]
        public IActionResult Update(Student student)
        {
            var studentIndex = students.FindIndex(x => x.Id == student.Id);
            students[studentIndex] = student;
            return Ok(students);
        }

        //update partial
        [HttpPatch("{id:int}")]
        public IActionResult Patch([FromRoute] int id, [FromBody] JsonPatchDocument<Student> student)
        {
            if(student == null)
            {
                return BadRequest();
            }

            var studentToUpdate = students.FirstOrDefault(x => x.Id == id);
            student.ApplyTo(studentToUpdate);

            return Ok(students);
        }

        //Delete
        [HttpDelete]
        public IActionResult Delete(Student student)
        {
            var studentIndex = students.FindIndex(x => x.Id == student.Id);
            students.RemoveAt(studentIndex);
            return Ok(students);
        }
    }
}

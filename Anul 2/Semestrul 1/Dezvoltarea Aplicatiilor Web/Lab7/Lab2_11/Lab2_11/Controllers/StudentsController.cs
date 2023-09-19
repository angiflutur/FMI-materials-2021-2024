using Lab2_11.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.JsonPatch;
//using Microsoft.AspNetCore.JsonPatch;
using Microsoft.AspNetCore.Mvc;

namespace Lab2_11.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class StudentsController : ControllerBase
    {
        public static List<Student> students = new List<Student>
        {
            new Student {Id = 1, Name = "Ana", Age = 21},
            new Student {Id = 2, Name = "Maria", Age = 30},
            new Student {Id = 4, Name = "Vlad", Age = 31},
            new Student {Id = 5, Name = "Florin", Age = 10},
            new Student {Id = 6, Name = "Andreea", Age = 25},
            new Student {Id = 7, Name = "Andreea", Age = 35},
            new Student {Id = 8, Name = "Andreea", Age = 7}
        };

        public static Dictionary<int, Student> studentsDictionary = new Dictionary<int, Student>
        {
            {1, new Student {Id = 1, Name = "Ana", Age = 21} },
            {2, new Student {Id = 2, Name = "Maria", Age = 30} }
        };

        // Endpoint

        // GET
        [HttpGet]
        public List<Student> Get()
        {
            return students;
        }

        [HttpGet("byId")]
        public Student GetById(int id)
        {
            return students.FirstOrDefault(x => x.Id.Equals(id));
        }

        [HttpGet("byId/{id}")]
        public Student GetByIdInEndpoint(int id)
        {
            return students.FirstOrDefault(s => s.Id.Equals(id));
        }

        [HttpGet("filter/{name}/{age}")]
        public List<Student> GetWithFilters(string name, int age)
        {
            return students.Where(s => s.Name.ToLower().Equals(name.ToLower()) && s.Age > age).ToList();
        }

        [HttpGet("fromRouteWithId/{id}")]
        public Student GetByIdWithFromRoute([FromRoute] int id)
        {
            Student student = students.FirstOrDefault(x => x.Id.Equals(id));
            return student;
        }

        [HttpGet("fromHeader")]
        public Student GetByIdWithFromHeader([FromHeader] int id)
        {
            return students.FirstOrDefault(s => s.Id.Equals(id));
        }

        [HttpGet("fromQuery")]
        public Student GetByIdWithFromQuery([FromQuery] int id)
        {
            return students.FirstOrDefault(s => s.Id.Equals(id));
        }


        // STATUS CODES

        // 200
        [HttpGet("StatusCodeOk")]
        public IActionResult StatusCodeOK()
        {
            return Ok("It's ok");
        }

        // 204
        [HttpGet("NoContent")]
        public IActionResult NoContent()
        {
            return NoContent();
        }

        // 404
        [HttpGet("StatusCodeNotFound")]
        public IActionResult StatusCodeNotFound()
        {
            return NotFound();
        }

        // 403
        [HttpGet("StatusCodeForbid")]
        public IActionResult StatusCodeForbid()
        {
            return Forbid();
        }

        // 400
        [HttpGet("StatusCodeBadRequest")]
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

        // update

        // Full update
        [HttpPost("update")]
        public IActionResult Update([FromBody] Student student)
        {
            var studentIndex = students.FindIndex((Student x) => x.Id == student.Id);
            students[studentIndex] = student;

            return Ok(students);
        }

        // methoda async 
        [HttpPost("updateAsync")]
        public async Task<IActionResult> UpdateAsync([FromBody] Student student)
        {
            var studentIndex = students.FindIndex((Student x) => x.Id == student.Id);

            // await
            students[studentIndex] = student;

            return Ok(students);
        }

        // update partial
        [HttpPatch("patch/{id:int}")]
        public IActionResult Patch([FromRoute] int id, [FromBody] JsonPatchDocument<Student> student)
        {
            if (student != null)
            {
                var studentToUpdate = students.FirstOrDefault(x => x.Id == id);
                student.ApplyTo(studentToUpdate);

                //if (!ModelState.IsValid)
                //{
                //    return BadRequest();
                //}
                return Ok(students);
            }
            else
            {
                return BadRequest();
            }
        }

        // delete
        [HttpDelete]
        public IActionResult Delete(Student student)
        {
            var studentIndex = students.FindIndex((Student x) => x.Id == student.Id);
            students.RemoveAt(studentIndex);
            return Ok(students);
        }

    }
}

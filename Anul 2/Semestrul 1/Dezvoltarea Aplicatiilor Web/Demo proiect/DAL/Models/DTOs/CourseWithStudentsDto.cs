using Demo.Models.DTOs;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Models.DTOs
{
    public class CourseWithStudentsDto: CourseDto
    {
        public ICollection<StudentDto>? Students { get; set; }

    }
}

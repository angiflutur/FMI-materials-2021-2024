using System.ComponentModel.DataAnnotations;

namespace Lab2_12.Models
{
    public class Student
    {
        [Required]
        public int Id { get; set; }

        [StringLength(100)] 
        public string Name { get; set; }

        [Range(0, 100)]
        public int Age { get; set; }
    }
}

using System.ComponentModel.DataAnnotations;

namespace Demo.Models.DTOs.TeacherAuthRequestDto
{
    public class TeacherAuthRequestDto
    {

        [Required]
        public string Password { get; set; }

        [Required]
        public string Email { get; set; }
        public string? FirstName { get; set; }
        public string? LastName { get; set; }
    }
}

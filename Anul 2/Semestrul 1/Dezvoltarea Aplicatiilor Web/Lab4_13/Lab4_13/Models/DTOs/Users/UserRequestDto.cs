using System.ComponentModel.DataAnnotations;

namespace Lab4_13.Models.DTOs.Users
{
    public class UserRequestDto
    {
        [Required]
        public string UserName { get; set; }

        [Required]
        public string Password { get; set; }

        [Required]
        public string Email { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
    }
}

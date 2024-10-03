using System.ComponentModel.DataAnnotations;

namespace proiect.Models.DTOs.OwnerAuthRequestDto
{
    public class OwnerAuthRequestDto
    {
        [Required]
        public string Password { get; set; }

        [Required]
        public string Email { get; set; }
    }
}

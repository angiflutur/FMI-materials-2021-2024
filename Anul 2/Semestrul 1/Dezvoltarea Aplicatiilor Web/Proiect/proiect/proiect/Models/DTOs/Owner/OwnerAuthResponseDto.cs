using proiect.Models;

namespace proiect.Models.DTOs.OwnerAuthResponseDto
{
    public class OwnerAuthResponseDto
    {
        public Guid Id { get; set; }
        public string Email { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }

        public string Token { get; set; }
        public OwnerAuthResponseDto(Owner owner, string token)
        {
            Id = owner.Id;
            FirstName = owner.FirstName;
            LastName = owner.LastName;
            Email = owner.Email;
            Token = token;
        }
    }
}




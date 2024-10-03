namespace proiect.Models.DTOs
{
    public class ActorDto
    {
        public Guid Id { get; set; }

        public string FirstName { get; set; } = string.Empty;

        public string LastName { get; set; } = string.Empty;

        public int Age { get; set; }

        public string Email { get; set; } = string.Empty;

        public ICollection<FilmDto>? Stores { get; set; }
    }
}

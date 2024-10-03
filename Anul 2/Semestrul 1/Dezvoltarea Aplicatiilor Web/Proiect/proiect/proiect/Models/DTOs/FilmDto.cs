using proiect.Models.Base;

namespace proiect.Models.DTOs
{
    public class FilmDto
    {
        public Guid Id { get; set; }
        public string Name { get; set; }
        public string Stars { get; set; }
        public string? Type { get; set; }
        public string OwnerName { get; set; } = string.Empty;
        public string Location { get; set; } = string.Empty;
    }
}

using proiect.Models.Base;
using proiect.Models.Enums;
using System.Data;
using System.Text.Json.Serialization;

namespace proiect.Models
{
    public class Owner : BaseEntity
    {
        public string FirstName { get; set; } = "";
        public string LastName { get; set; } = "";
        public int Age { get; set; }
        public string? Email { get; set; }

        public ICollection<Film>? Filme { get; set; }

        public Role Role { get; set; }

        [JsonIgnore]
        public string PasswordHash { get; set; } = string.Empty;
    }
}

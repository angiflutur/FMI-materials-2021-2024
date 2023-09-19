using Demo.Models.Base;
using Demo.Models.Enums;
using System.Data;
using System.Text.Json.Serialization;

namespace Demo.Models
{
    public class Teacher: BaseEntity
    {
        public string FirstName { get; set; } = string.Empty;
        public string LastName { get; set; } = string.Empty;

        public int Age { get; set; }
        public string Email { get; set; } = string.Empty;

        public DateTime HiredData { get; set; } = DateTime.UtcNow;

        public ICollection<Course> Courses { get; set; }

        public Role Role { get; set; }

        [JsonIgnore]
        public string PasswordHash { get; set; } = string.Empty;
    }
}

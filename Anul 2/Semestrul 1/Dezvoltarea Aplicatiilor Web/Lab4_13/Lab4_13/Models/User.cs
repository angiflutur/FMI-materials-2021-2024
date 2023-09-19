using Lab4_13.Models.Base;
using Lab4_13.Models.Enums;
using System.Text.Json.Serialization;

namespace Lab4_13.Models
{
    public class User: BaseEntity
    {
        public string FirstName { get; set; }
        public string LastName { get; set; } 
        
        public string Email { get; set; }   
        public string Username { get; set; }

        [JsonIgnore]
        public string PasswordHash { get; set; }

        public Role Role { get; set; }
    }
}

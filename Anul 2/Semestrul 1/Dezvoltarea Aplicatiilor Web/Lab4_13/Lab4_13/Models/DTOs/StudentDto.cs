namespace Lab4_13.Models.DTOs
{
    public class StudentDTO
    {
        public string Name { get; set; }
        public int Age { get; set; }

        public Guid StudentId { get; set; }
        public string Password { get; set; }
    }
}

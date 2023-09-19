namespace Demo.Models.DTOs.TeacherAuthResponseDto
{
    public class TeacherAuthResponseDto
    {
        public Guid Id { get; set; }
        public string Email { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }

        public string Token { get; set; }

        public TeacherAuthResponseDto(Teacher teacher , string token)
        {
            Id = teacher.Id;
            FirstName = teacher.FirstName;
            LastName = teacher.LastName;
            Email = teacher.Email;
            Token = token;
        }
    }
}

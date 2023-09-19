using AutoMapper;
using Demo.Models.DTOs;
using Demo.Repositories.StudentRepository;

namespace Demo.Services
{
    public class StudentService: IStudentService
    {
        public IStudentRepository _studentRepository;
        public IMapper _mapper;
        public StudentService(IStudentRepository studentRepository, IMapper mapper)
        {
            _studentRepository = studentRepository;
            _mapper = mapper;
        }

        public async Task<List<StudentDto>> GetAllStudents()
        {
            var students = await _studentRepository.GetAll();
            List<StudentDto> result = _mapper.Map<List<StudentDto>>(students);
  
            return result;
        }

        public async Task DeleteStudent(Guid studentId)
        {
            var studentToDelete = await _studentRepository.FindByIdAsync(studentId);
            _studentRepository.Delete(studentToDelete);
            await _studentRepository.SaveAsync();
        }
    }
}

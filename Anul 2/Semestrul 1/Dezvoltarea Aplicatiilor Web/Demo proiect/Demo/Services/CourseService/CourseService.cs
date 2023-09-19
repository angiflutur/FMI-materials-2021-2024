using AutoMapper;
using DAL.Models.DTOs;
using DAL.Repositories.CourseRepository;
using Demo.Models.DTOs;
using Demo.Models;
using Demo.Repositories.StudentRepository;
using DAL.Repositories.StudentInCourseRepository;
using System.Collections.Generic;

namespace Demo.Services.CourseService
{
    public class CourseService : ICourseService
    {
        public ICourseRepository _courseRepository;
        public IStudentInCourseRepository _studentInCourseRepository;

        public IStudentRepository _studentRepository;
        public IMapper _mapper;
        public CourseService(ICourseRepository courseRepository, IMapper mapper, IStudentRepository studentRepository, IStudentInCourseRepository studentInCourseRepository)
        {
            _courseRepository = courseRepository;
            _studentRepository = studentRepository;
            _studentInCourseRepository = studentInCourseRepository;
            _mapper = mapper;
        }

        public async Task AddCourse(CourseDto newCourse)
        {
            // var newDbCourse = new Course();
            var newDbCourse = _mapper.Map<Course>(newCourse);
            await _courseRepository.CreateAsync(newDbCourse);
            await _courseRepository.SaveAsync();
        }

        public async Task<List<CourseWithStudentsDto>> AddStudentsToCourse(Guid courseId, List<Guid> studentsIds)
        {
            var courseToUpdate = await _courseRepository.FindByIdAsync(courseId);
            List<Student> studentsFromDbList = await _studentRepository.FindRange(studentsIds);
            
            List<StudentInCourse> studentInCourseList = new();

            foreach (var student in studentsFromDbList)
            {
                var newStudentInCourse = new StudentInCourse
                {
                    Student = student,
                    Course = courseToUpdate
                };

                studentInCourseList.Add(newStudentInCourse);
            }
            await _studentInCourseRepository.CreateRangeAsync(studentInCourseList);
            await _studentInCourseRepository.SaveAsync();

            var coursesWithStudents = await _courseRepository.GetCoursesWithStudents();
            return _mapper.Map<List<CourseWithStudentsDto>> (coursesWithStudents);
        }

        public async Task DeleteCourse(Guid courseId)
        {
            var courseToDelete = await _courseRepository.FindByIdAsync(courseId);
            _courseRepository.Delete(courseToDelete);
            await _courseRepository.SaveAsync();
        }

        public async Task<List<CourseDto>> GetAll()
        {
            var courses = await _courseRepository.GetAll();
            return _mapper.Map< List<CourseDto>>(courses);
        }
    }
}

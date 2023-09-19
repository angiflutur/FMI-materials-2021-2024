using AutoMapper;
using Demo.Models.DTOs;
using Demo.Models;
using DAL.Models.DTOs;
using Demo.Models.DTOs.TeacherAuthRequestDto;
using Demo.Models.DTOs.TeacherAuthResponseDto;

namespace Demo.Helpers
{
    public class MapperProfile: Profile
    {
        public MapperProfile()
        {
            CreateMap<Student, StudentDto>();
            CreateMap<Course, CourseDto>();
            CreateMap<CourseDto, Course>();
            CreateMap<CourseWithStudentsDto, Course>();
            CreateMap<Course, CourseWithStudentsDto>().ForMember(
                dest => dest.Students,
                opt => opt.MapFrom(src => src.StudentsInCourses.Select(x=>x.Student))
            );

            CreateMap<Teacher, TeacherAuthRequestDto>();
            CreateMap<TeacherAuthRequestDto, Teacher>();
            CreateMap<TeacherAuthResponseDto, Teacher>();
            CreateMap<Teacher, TeacherAuthResponseDto>();

        }

    }
}

using AutoMapper;
using Lab4_13.Models;
using Lab4_13.Models.DTOs;

namespace Lab4_13.Helpers.Mapper
{
    public class MapperProfile: Profile
    {
        public MapperProfile()
        {
            // CreateMap<Student, StudentDTO>().ReverseMap();
            CreateMap<Student, StudentDTO>();
            CreateMap<StudentDTO, Student>();

            CreateMap<Model1, ModelResultDTO>().ReverseMap();

            CreateMap<Student, StudentDTO>()
                .ForMember(dest => dest.StudentId,
                opts => opts.MapFrom(source => source.Id));
        }
    }
}

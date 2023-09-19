using DAL.Repositories.CourseRepository;
using DAL.Repositories.StudentInCourseRepository;
using Demo.Helpers.Jwt;
using Demo.Helpers.Seeders;
using Demo.Repositories.StudentRepository;
using Demo.Repositories.TeacherRepository;
using Demo.Services;
using Demo.Services.CourseService;
using Demo.Services.TeacherService;

namespace Demo.Helpers.Extensions
{
    public static class ServiceExtensions
    {
        public static IServiceCollection AddRepositories(this IServiceCollection services)
        {
            services.AddTransient<IStudentRepository, StudentRepository>();
            services.AddTransient<ITeacherRepository, TeacherRepository>();
            services.AddTransient<ICourseRepository, CourseRepository>();
            services.AddTransient<IStudentInCourseRepository, StudentInCourseRepository>();

            return services;
        }

        public static IServiceCollection AddServices(this IServiceCollection services)
        {
            services.AddTransient<IStudentService, StudentService>();
            services.AddTransient<ITeacherService, TeacherService>();
            services.AddTransient<ICourseService, CourseService>();

            return services;
        }

        public static IServiceCollection AddSeeders(this IServiceCollection services)
        {
            services.AddTransient<StudentsSeeder>();

            return services;
        }

        public static IServiceCollection AddUtils(this IServiceCollection services)
        {
            services.AddTransient<IJwtUtils, JwtUtils>();

            return services;
        }
    }
}

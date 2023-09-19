using Lab4_13.Repositories.DatabaseRepository;
using Lab4_13.Repositories.StudentRepository;
using Lab4_13.Services;
using Lab4_13.Helpers.Seeders;
using Lab4_13.Repositories.UsersRepository;
using Lab4_13.Services.Users;
using Lab4_13.Helpers.JwtUtils;

namespace Lab4_13.Helpers.Extensions
{
    public static class ServiceExtensions
    {
        public static IServiceCollection AddRepositories(this IServiceCollection services)
        {
            services.AddTransient<IDatabaseRepository, DatabaseRepository>();
            services.AddTransient<IStudentRepository, StudentRepository>();
            services.AddTransient<IUserRepository, UsersRepository>();

            return services;
        }

        public static IServiceCollection AddServices(this IServiceCollection services)
        {
            services.AddTransient<IDemoService, DemoService>();
            services.AddTransient<IUsersService, UsersService>();

            return services;
        }

        public static IServiceCollection AddSeeders(this IServiceCollection services)
        {
            services.AddTransient<StudentsSeeder>();
            return services;
        }

        public static IServiceCollection AddUtils(this IServiceCollection services)
        {
            services.AddScoped<IJwtUtils, IJwtUtils>();

            return services;
        }
    }
}

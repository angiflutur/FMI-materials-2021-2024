using Demo.Services.CourseService;

using proiect.Services;
using proiect.Helpers.Jwt;
using proiect.Helpers.Seeders;
using proiect.Repositories.DatabaseRepository;
using proiect.Repositories.EmployeeRepository;
using proiect.Repositories.EmployeeStoreRepository;
using proiect.Repositories.FilmRepository;
using proiect.Repositories.OwnerRepository;
using proiect.Repositories.StoreRepository;

namespace proiect.Helpers.Extensions
{
    public static class ServiceExtensions
    {
        public static IServiceCollection AddRepositories(this IServiceCollection services)
        {
            services.AddTransient<IActorRepository, ActorRepository>();
            services.AddTransient<IOwnerRepository, OwnerRepository>();
            services.AddTransient<IFilmRepository, FilmRepository>();
            services.AddTransient<IActorFilmRepository, ActorFilmRepository>();
            services.AddTransient<IDatabaseRepository, DatabaseRepository>();

      return services;
        }

        public static IServiceCollection AddServices(this IServiceCollection services)
        {
            services.AddTransient<IActorService, ActorService>();
            services.AddTransient<IFilmService, FilmService>();

      return services;
        }

        public static IServiceCollection AddSeeders(this IServiceCollection services)
        {
            services.AddTransient<ActorSeeder>();
      return services;
        }

        public static IServiceCollection AddUtils(this IServiceCollection services)
        {
            services.AddTransient<IJwtUtils, JwtUtils>();
      return services;
        }
    }
}

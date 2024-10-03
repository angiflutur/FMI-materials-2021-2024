using Microsoft.EntityFrameworkCore;
using proiect.Models;

namespace proiect.Data
{
    public class AppDbContext:DbContext
    {
        public AppDbContext(DbContextOptions<AppDbContext> options) : base(options)
        {
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Actor_Film>()
    .HasKey(af => new { af.IdActor, af.IdFilm });

            modelBuilder.Entity<Actor_Film>()
                .HasOne(af => af.Actor)
                .WithMany(actor => actor.Actori_Filme)
                .HasForeignKey(af => af.IdActor);

            modelBuilder.Entity<Actor_Film>()
                .HasOne(af => af.Film)
                .WithMany(film => film.Actori_Filme)
                .HasForeignKey(af => af.IdFilm);


            base.OnModelCreating(modelBuilder);
        }
        public DbSet<Actor> Actori { get; set; }
        public DbSet<Film> Filme { get; set; }
        public DbSet<Actor_Film> Actori_Filme { get; set; }
        public DbSet<Cinema> Cinematografe { get; set; }
        public DbSet<Producator> Producatori { get; set; }
        public DbSet<Owner> Owners { get; set; }

    }
}

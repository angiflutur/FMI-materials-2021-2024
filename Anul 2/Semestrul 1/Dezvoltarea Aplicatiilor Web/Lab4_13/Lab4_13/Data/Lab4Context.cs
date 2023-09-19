using Lab4_13.Models;
using Microsoft.EntityFrameworkCore;

namespace Lab4_13.Data
{
    public class Lab4Context: DbContext
    {
        // tables
        public DbSet<Model1> Models1 { get; set; }
        public DbSet<Model2> Models2 { get; set; }

        public DbSet<Student> Students { get; set; }

        public DbSet<User> Users { get; set; }

        public Lab4Context(DbContextOptions<Lab4Context> options) : base(options)
        {

        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Model1>()
                .HasMany(m1 => m1.Models2)
                .WithOne(m2 => m2.Model1);

            base.OnModelCreating(modelBuilder);
        }
    }
}

using Lab3_14.Models;
using Lab3_14.Models.Many_to_Many;
using Lab3_14.Models.One_to_Many;
using Lab3_14.Models.One_to_One;
using Microsoft.EntityFrameworkCore;

namespace Lab3_14.Data
{
    public class Lab3Context: DbContext
    {
        public DbSet<Student> Students { get; set; }


        // One to Many

        public DbSet<Model1> Models1 { get; set; }
        public DbSet<Model2> Models2 { get; set; }


        // One to One
        public DbSet<Model5> Models5 { get; set; }
        public DbSet<Model6> Models6 { get; set; }


        // One to Many
        public DbSet<Model3> Models3 { get; set; }
        public DbSet<Model4> Models4 { get; set; }
        public DbSet<ModelsRelation> ModelsRelations { get; set; }


        public Lab3Context(DbContextOptions<Lab3Context> options) : base(options)
        {

        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            // One to Many
            modelBuilder.Entity<Model1>()
                .HasMany(m1 => m1.Models2)
                .WithOne(m2 => m2.Model1);

            // another option
            //modelBuilder.Entity<Model2>()
            //    .HasOne(m2 => m2.Model1)
            //    .WithMany(m1 => m1.Models2);


            // One to One
            modelBuilder.Entity<Model5>()
                .HasOne(m5 => m5.Model6)
                .WithOne(m6 => m6.Model5)
                .HasForeignKey<Model6>(m6 => m6.Model5Id);

            // One to Many
            // cheie compusa
            modelBuilder.Entity<ModelsRelation>()
                        .HasKey(mr => new { mr.Model3Id, mr.Model4Id });

            modelBuilder.Entity<ModelsRelation>()
                        .HasOne<Model3>(mr => mr.Model3)
                        .WithMany(m3 => m3.ModelsRelations)
                        .HasForeignKey(mr => mr.Model3Id);

            modelBuilder.Entity<ModelsRelation>()
                        .HasOne<Model4>(mr => mr.Model4)
                        .WithMany(m4 => m4.ModelsRelations)
                        .HasForeignKey(mr => mr.Model4Id);

            base.OnModelCreating(modelBuilder);
        }
    }
}

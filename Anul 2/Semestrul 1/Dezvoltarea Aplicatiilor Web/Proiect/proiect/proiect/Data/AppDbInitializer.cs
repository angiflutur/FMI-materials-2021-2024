using proiect.Models;

namespace proiect.Data
{
    public class AppDbInitializer
    {
        public static void Seed(IApplicationBuilder applicationBuilder)
        {
            using (var serviceScope = applicationBuilder.ApplicationServices.CreateScope())
            {
                var context = serviceScope.ServiceProvider.GetService<AppDbContext>();

                context.Database.EnsureCreated();
                
                //cinematografe
                if(!context.Cinematografe.Any())
                {
                    context.Cinematografe.AddRange(new List<Cinema>()
                    {
                        new Cinema()
                        {
                            NumeCinema = "Cinema 1",
                            Descriere = "This is the description of the first cinema"
                        },
                        new Cinema()
                        {
                            NumeCinema = "Cinema 2",
                            Descriere = "This is the description of the first cinema"
                        },
                        new Cinema()
                        {
                            NumeCinema = "Cinema 3",
                            Descriere = "This is the description of the first cinema"
                        },
                        new Cinema()
                        {
                            NumeCinema = "Cinema 4",
                            Descriere = "This is the description of the first cinema"
                        },
                        new Cinema()
                        {
                            NumeCinema = "Cinema 5",
                            Descriere = "This is the description of the first cinema"
                        },
                    });
                    context.SaveChanges();
                }
                //actori
                if (!context.Actori.Any())
                {
                    context.Actori.AddRange(new List<Actor>()
                    {
                        new Actor()
                        {
                            NumeActor = "Actor 1",
                            Bio = "This is the Bio of the first actor",
                            Imagine = "http://dotnethow.net/images/actors/actor-1.jpeg"

                        },
                        new Actor()
                        {
                            NumeActor = "Actor 2",
                            Bio = "This is the Bio of the second actor",
                            Imagine = "http://dotnethow.net/images/actors/actor-2.jpeg"
                        },
                        new Actor()
                        {
                            NumeActor = "Actor 3",
                            Bio = "This is the Bio of the second actor",
                            Imagine = "http://dotnethow.net/images/actors/actor-3.jpeg"
                        },
                        new Actor()
                        {
                            NumeActor = "Actor 4",
                            Bio = "This is the Bio of the second actor",
                            Imagine = "http://dotnethow.net/images/actors/actor-4.jpeg"
                        },
                        new Actor()
                        {
                            NumeActor = "Actor 5",
                            Bio = "This is the Bio of the second actor",
                            Imagine = "http://dotnethow.net/images/actors/actor-5.jpeg"
                        }
                    });
                    context.SaveChanges();
                }
                //producatori
                if (!context.Producatori.Any())
                {
                    context.Producatori.AddRange(new List<Producator>()
                    {
                        new Producator()
                        {
                            NumeProducator = "Producator 1",
                            Bio = "This is the Bio of the first actor",
                            Imagine = "http://dotnethow.net/images/Producatori/Producator-1.jpeg"

                        },
                        new Producator()
                        {
                            NumeProducator = "Producator 2",
                            Bio = "This is the Bio of the second actor",
                            Imagine = "http://dotnethow.net/images/Producatori/Producator-2.jpeg"
                        },
                        new Producator()
                        {
                            NumeProducator = "Producator 3",
                            Bio = "This is the Bio of the second actor",
                            Imagine = "http://dotnethow.net/images/Producatori/Producator-3.jpeg"
                        },
                        new Producator()
                        {
                            NumeProducator = "Producator 4",
                            Bio = "This is the Bio of the second actor",
                            Imagine = "http://dotnethow.net/images/Producatori/Producator-4.jpeg"
                        },
                        new Producator()
                        {
                            NumeProducator = "Producator 5",
                            Bio = "This is the Bio of the second actor",
                            Imagine = "http://dotnethow.net/images/Producatori/Producator-5.jpeg"
                        }
                    });
                    context.SaveChanges();
                }
                //filme
                if (!context.Filme.Any())
                {
                    context.Filme.AddRange(new List<Film>()
                    {
                        new Film()
                        {
                            Titlu = "Life",
                            Descriere = "This is the Life Film description",
                            Pret = 39.50,
                            Imagine = "http://dotnethow.net/images/Filme/Film-3.jpeg",
                            IdCinema = 3,
                            IdProducator = 3,
                            CategorieFilm = Enums.CategorieFilm.Documentar
                        },
                        new Film()
                        {
                            Titlu = "The Shawshank Redemption",
                            Descriere = "This is the Shawshank Redemption description",
                            Pret = 29.50,
                            Imagine = "http://dotnethow.net/images/Filme/Film-1.jpeg",
                            IdCinema = 1,
                            IdProducator = 1,
                            CategorieFilm = Enums.CategorieFilm.Actiune
                        },
                        new Film()
                        {
                            Titlu = "Ghost",
                            Descriere = "This is the Ghost Film description",
                            Pret = 39.50,
                            Imagine = "http://dotnethow.net/images/Filme/Film-4.jpeg",
                            IdCinema = 4,
                            IdProducator = 4,
                            CategorieFilm = Enums.CategorieFilm.Horror
                        },
                        new Film()
                        {
                            Titlu = "Race",
                            Descriere = "This is the Race Film description",
                            Pret = 39.50,
                            Imagine = "http://dotnethow.net/images/Filme/Film-6.jpeg",
                            IdCinema = 1,
                            IdProducator = 2,
                            CategorieFilm = Enums.CategorieFilm.Documentar
                        },
                        new Film()
                        {
                            Titlu = "Scoob",
                            Descriere = "This is the Scoob Film description",
                            Pret = 39.50,
                            Imagine = "http://dotnethow.net/images/Filme/Film-7.jpeg",
                            IdCinema = 1,
                            IdProducator = 3,
                            CategorieFilm = Enums.CategorieFilm.Desene
                        },
                        new Film()
                        {
                            Titlu = "Cold Soles",
                            Descriere = "This is the Cold Soles Film description",
                            Pret = 39.50,
                            Imagine = "http://dotnethow.net/images/Filme/Film-8.jpeg",
                            IdCinema = 1,
                            IdProducator = 5,
                            CategorieFilm = Enums.CategorieFilm.Drama
                        }
                    });
                    context.SaveChanges();
                }
                //actori&&filme
                if (!context.Actori_Filme.Any())
                {
                    context.Actori_Filme.AddRange(new List<Actor_Film>()
                    {
                        new Actor_Film()
                        {
                            IdActor = 1,
                            IdFilm = 1
                        },
                        new Actor_Film()
                        {
                            IdActor = 3,
                            IdFilm = 1
                        },

                         new Actor_Film()
                        {
                            IdActor = 1,
                            IdFilm = 2
                        },
                         new Actor_Film()
                        {
                            IdActor = 4,
                            IdFilm = 2
                        },

                        new Actor_Film()
                        {
                            IdActor = 1,
                            IdFilm = 3
                        },
                        new Actor_Film()
                        {
                            IdActor = 2,
                            IdFilm = 3
                        },
                        new Actor_Film()
                        {
                            IdActor = 5,
                            IdFilm = 3
                        },


                        new Actor_Film()
                        {
                            IdActor = 2,
                            IdFilm = 4
                        },
                        new Actor_Film()
                        {
                            IdActor = 3,
                            IdFilm = 4
                        },
                        new Actor_Film()
                        {
                            IdActor = 4,
                            IdFilm = 4
                        },


                        new Actor_Film()
                        {
                            IdActor = 2,
                            IdFilm = 5
                        },
                        new Actor_Film()
                        {
                            IdActor = 3,
                            IdFilm = 5
                        },
                        new Actor_Film()
                        {
                            IdActor = 4,
                            IdFilm = 5
                        },
                        new Actor_Film()
                        {
                            IdActor = 5,
                            IdFilm = 5
                        },


                        new Actor_Film()
                        {
                            IdActor = 3,
                            IdFilm = 6
                        },
                        new Actor_Film()
                        {
                            IdActor = 4,
                            IdFilm = 6
                        },
                        new Actor_Film()
                        {
                            IdActor = 5,
                            IdFilm = 6
                        },
                    });
                    context.SaveChanges();
                }
            }
        }
    }
}

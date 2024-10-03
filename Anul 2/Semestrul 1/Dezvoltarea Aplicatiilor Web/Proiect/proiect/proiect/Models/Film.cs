using proiect.Data.Enums;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace proiect.Models
{
    public class Film
    {
        [Key]
        public int IdFilm {  get; set; }
        public string Titlu { get; set; }
        public double Pret {  get; set; }
        public string Descriere {  get; set; }
        public string Imagine { get; set; }
        public int Stars { get; set; }

        public CategorieFilm CategorieFilm { get; set; }

        // definire relatii
        public List<Actor_Film> Actori_Filme { get; set; }

        // cinema
        public int IdCinema { get; set; }
        [ForeignKey("IdCinema")]
        public Cinema Cinema { get; set; }

        // producator
        public int IdProducator { get; set; }
        [ForeignKey("IdProducator")]
        public Producator Producator { get; set; }
    }
}

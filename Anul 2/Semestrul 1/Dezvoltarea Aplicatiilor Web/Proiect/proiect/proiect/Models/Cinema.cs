using System.ComponentModel.DataAnnotations;

namespace proiect.Models
{
    public class Cinema
    {
        [Key]
        public int IdCinema { get; set; }
        public string NumeCinema { get; set; }
        public string Descriere { get; set; }

        // definire relatii
        public List<Film> Filme {  get; set; }
    }
}

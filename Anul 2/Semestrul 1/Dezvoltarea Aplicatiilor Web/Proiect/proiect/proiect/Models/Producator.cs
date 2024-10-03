using System.ComponentModel.DataAnnotations;

namespace proiect.Models
{
    public class Producator
    {
        [Key]
        public int IdProducator { get; set; }

        public string NumeProducator { get; set; }

        public string Imagine { get; set; }

        public string Bio { get; set; }

        // definire relatii
        public List<Film> Filme { get; set; }

    }
}

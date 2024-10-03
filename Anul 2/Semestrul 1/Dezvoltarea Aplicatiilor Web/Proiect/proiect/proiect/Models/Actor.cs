using System.ComponentModel.DataAnnotations;

namespace proiect.Models
{
    public class Actor
    {
        [Key]
        public int IdActor { get; set; }
        [Display(Name = "Nume actor")]
        public string NumeActor { get; set; }
        [Display(Name = "Poza de profil")]
        public string Imagine { get; set; }
        [Display(Name = "Biografie")]
        public string Bio {  get; set; }

        // definire relatii
        public List<Actor_Film> Actori_Filme { get; set; }


    }
}

using Lab4_13.Models.Base;
namespace Lab4_13.Models
{
    public class Model1: BaseEntity
    {
        public string Title { get; set; }
        public int Order { get; set; }

        public ICollection<Model2> Models2 { get; set; }
    }
}

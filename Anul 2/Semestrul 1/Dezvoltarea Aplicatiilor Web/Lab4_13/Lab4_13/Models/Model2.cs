using Lab4_13.Models.Base;

namespace Lab4_13.Models
{
    public class Model2: BaseEntity
    {
        public String Name { get; set; }
        public Model1 Model1 { get; set; }
        public Guid Model1Id { get; set; }
    }
}

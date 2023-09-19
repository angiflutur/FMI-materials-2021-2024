using Lab3_14.Models.Base;

namespace Lab3_14.Models.One_to_Many
{
    public class Model1: BaseEntity
    {
        public string Name { get; set; }
        
        // relation
        public ICollection<Model2> Models2 { get; set; }
    }
}

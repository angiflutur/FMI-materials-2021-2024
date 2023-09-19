using Lab3_14.Models.Base;

namespace Lab3_14.Models.One_to_Many
{
    public class Model2: BaseEntity
    {
        public string Name { get; set; }

        // relation
        public Model1 Model1 { get; set; }
        // fk
        public Guid Model1Id { get; set; }
    }
}

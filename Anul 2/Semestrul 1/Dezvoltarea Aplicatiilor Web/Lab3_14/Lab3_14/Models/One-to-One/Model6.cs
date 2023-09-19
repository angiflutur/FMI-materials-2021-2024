using Lab3_14.Models.Base;

namespace Lab3_14.Models.One_to_One
{
    public class Model6: BaseEntity
    {
        public string Name { get; set; }

        // relation
        public Model5 Model5 { get; set; }
        public Guid Model5Id { get; set; }
    }
}

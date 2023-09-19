using Lab3_14.Models.Base;

namespace Lab3_14.Models.Many_to_Many
{
    public class Model3: BaseEntity
    {
        public string Name { get; set; }

        // relation
        // public ICollection<Model4> Models4 { get; set; }

        public ICollection<ModelsRelation> ModelsRelations { get; set; }

    }
}

using Lab3_14.Models.Base;

namespace Lab3_14.Models.Many_to_Many
{
    public class Model4: BaseEntity
    {
        public string Name { get; set; }    

        // relation
        // public ICollection<Model3> Models { get; set; }

        public ICollection<ModelsRelation> ModelsRelations { get; set; }
    }
}

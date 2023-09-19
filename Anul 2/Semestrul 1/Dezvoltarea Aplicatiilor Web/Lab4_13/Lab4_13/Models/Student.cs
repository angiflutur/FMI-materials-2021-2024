using Lab4_13.Models.Base;

namespace Lab4_13.Models
{
    public class Student: BaseEntity
    {
        public string Name { get; set; }
        public int Age { get; set; }
        public bool IsDeleted { get; set; } 
    }
}

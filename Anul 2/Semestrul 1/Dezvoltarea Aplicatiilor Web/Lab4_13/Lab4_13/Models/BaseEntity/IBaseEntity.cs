namespace Lab4_13.Models.Base
{
    public interface IBaseEntity
    {
        Guid Id { get; set; }   
        DateTime? DateCreated { get; set; }
        DateTime? DateModified { get; set; }    
    }
}

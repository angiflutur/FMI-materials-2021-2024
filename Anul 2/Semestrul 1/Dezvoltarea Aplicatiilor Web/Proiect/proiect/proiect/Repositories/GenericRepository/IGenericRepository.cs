using proiect.Models.Base;

namespace proiect.Repositories.GenericRepository
{
    public interface IGenericRepository<TEntity> where TEntity : class
    {
        // get all data
        Task<List<TEntity>> GetAllAsync();
        //IQueryable<TEntity> GetAllAsQueryable();

        // create
        //void Create(TEntity entity);
        Task CreateAsync(TEntity entity);
        Task CreateRangeAsync(IEnumerable<TEntity> entities);

        // update
        void Update(TEntity entity);
        void UpdateRange(IEnumerable<TEntity> entities);

        // delete
        void Delete(TEntity entity);
        void DeleteRange(IEnumerable<TEntity> entities);

        // find 
        TEntity FindById(object id);
        Task<TEntity> FindByIdAsync(object id);

        // save
        //bool Save();
        Task<bool> SaveAsync();
    }
}

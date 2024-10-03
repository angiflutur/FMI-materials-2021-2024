using proiect.Data;
using proiect.Models.Base;
using Microsoft.EntityFrameworkCore;
using System.Data.SqlClient;

namespace proiect.Repositories.GenericRepository
{
    public class GenericRepository<TEntity> : IGenericRepository<TEntity> where TEntity : class
    {
        protected readonly AppDbContext _context;
        protected readonly DbSet<TEntity> _table;

        public GenericRepository(AppDbContext context)
        {
            _context = context;
            _table = _context.Set<TEntity>();
        }

        public TEntity? FindById(object id)
        {
          return _table.Find(id);
        }

        public async Task<List<TEntity>> GetAllAsync()
        {
            var allItems = await _table.AsNoTracking().ToListAsync();
            return allItems;
        }
        public async Task CreateAsync(TEntity entity)
        {
            await _table.AddAsync(entity);
        }

        public void CreateRange(IEnumerable<TEntity> entities)
        {
            _table.AddRange(entities);
        }

        public async Task CreateRangeAsync(IEnumerable<TEntity> entities)
        {
            await _table.AddRangeAsync(entities);
        }

        // update
        public void Update(TEntity entity)
        {
            _table.Update(entity);
        }

        public void UpdateRange(IEnumerable<TEntity> entities)
        {
            _table.UpdateRange(entities);
        }

        // delete

        public void Delete(TEntity entity)
        {
            _table.Remove(entity);
        }

        public void DeleteRange(IEnumerable<TEntity> entities)
        {
            _table.RemoveRange(entities);
        }
        public async Task<TEntity> FindByIdAsync(object id)
        {
            return await _table.FindAsync(id);
        }
        public async Task<bool> SaveAsync()
        {
            try
            {
                return await _context.SaveChangesAsync() > 0;
            }
            catch (SqlException ex)
            {
                Console.WriteLine(ex);
            }

            return false;
        }
    }
}

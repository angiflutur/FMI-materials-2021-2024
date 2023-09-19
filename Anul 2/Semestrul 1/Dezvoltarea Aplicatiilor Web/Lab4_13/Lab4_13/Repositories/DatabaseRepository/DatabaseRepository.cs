using Lab4_13.Data;
using Lab4_13.Models;
using Lab4_13.Repositories.GenericRepository;
using Microsoft.EntityFrameworkCore;

namespace Lab4_13.Repositories.DatabaseRepository
{
    public class DatabaseRepository: GenericRepository<Model1>, IDatabaseRepository
    {
        public DatabaseRepository(Lab4Context lab4Context) : base(lab4Context)
        {

        }

        public Model1 GetByTitle(string title)
        {
            return _table.FirstOrDefault(x => x.Title.ToLower().Trim().Equals(title.ToLower().Trim()));
        }
        public async Task<Model1> GetByTitleAsync(string title)
        {
            return await _table.FirstOrDefaultAsync(x => x.Title.ToLower().Trim().Equals(title.ToLower().Trim()));
        }

        public Model1 GetByTitleIncludingModel2(string title)
        {
            return _table.Include(x => x.Models2).FirstOrDefault(x => x.Title.ToLower().Trim().Equals(title.ToLower().Trim()));
        }

        public async Task<List<Model1>> GetAllWithInclude()
        {
            return await _table.Include(x => x.Models2).ToListAsync();

            // Model1 model1_a
            //          model1_a.Model2 model2_a = has value
            // [{...model1_a, models2_a}, {...model1_b, models2_b}]
        }

        public async Task<List<Model1>> GetAllWithJoin()
        {
            var result = _table.Join(_context.Models2, model1 => model1.Id, model2 => model2.Model1Id,
                (model1, model2) => new { model1, model2 }).Select( x => x.model1);
            // model1, model2
            // [{...model1_a, ... model2_a}, {...model1_b, ...model2_b}]
            return await result.ToListAsync();
        }

        public Model1 WhereWithLinqQuerySyntax(int order)
        {
            var result = from m1 in _table
                         where m1.Order == order
                         select m1;

            return result.FirstOrDefault();
        }
    }
}

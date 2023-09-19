using AutoMapper;
using Lab4_13.Models;
using Lab4_13.Models.DTOs;
using Lab4_13.Repositories.DatabaseRepository;

namespace Lab4_13.Services
{
    public class DemoService : IDemoService
    {
        private readonly IDatabaseRepository _databaseRepository;
        private readonly IMapper _mapper;
        public DemoService(IDatabaseRepository databaseRepository, IMapper mapper)
        {
            _databaseRepository = databaseRepository;
            _mapper = mapper;
        }

        public ModelResultDTO GetDataMappedByTitle(string title)
        {
            Model1 model1 = _databaseRepository.GetByTitleIncludingModel2(title);

            //ModelResultDTO result = new ModelResultDTO
            //{
            //    Title = model1?.Title,
            //    Order = (int)(model1?.Order),
            //    Models2 = (List<Model2>)(model1?.Models2)
            //};

            ModelResultDTO result = _mapper.Map<ModelResultDTO>(model1);
            return result;
        }
    }
}

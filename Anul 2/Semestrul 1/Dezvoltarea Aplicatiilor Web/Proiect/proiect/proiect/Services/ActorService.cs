using AutoMapper;
using proiect.Models;
using proiect.Services;
using proiect.Models.DTOs;
using proiect.Repositories.EmployeeRepository;

namespace proiect.Services
{
    public class ActorService : IActorService
    {
        public IActorRepository _employeeRepository;
        public IMapper _mapper;

        public ActorService(IActorRepository employeeRepository, IMapper mapper)
        {
            _employeeRepository = employeeRepository;
            _mapper = mapper;
        }

        public async Task<List<ActorDto>> GetAllEmployees()
        {
            var employees = await _employeeRepository.GetAllAsync();
            List<ActorDto> result = _mapper.Map<List<ActorDto>>(employees);

            return result;
        }
        public async Task DeleteEmployee(Guid employeeId)
        {
            var employee = await _employeeRepository.FindByIdAsync(employeeId);
            _employeeRepository.Delete(employee);
            await _employeeRepository.SaveAsync();
        }
        public Actor FindById(Guid IdActor)
        {
            var employee = _employeeRepository.FindById(IdActor);
            return employee;
        }
    }
}

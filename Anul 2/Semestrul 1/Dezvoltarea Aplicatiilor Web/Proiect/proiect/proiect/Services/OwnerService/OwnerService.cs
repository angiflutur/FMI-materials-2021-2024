using AutoMapper;
using proiect.Models;
using proiect.Models.Enums;
using proiect.Helpers.Jwt;
using proiect.Repositories.OwnerRepository;
using proiect.Models.DTOs.OwnerAuthResponseDto;
using BCryptNet = BCrypt.Net.BCrypt;
using proiect.Models.DTOs.OwnerAuthRequestDto;

namespace proiect.Services.OwnerService
{
  public class OwnerService : IOwnerService
  {
    public IOwnerRepository _ownerRepository;
    public IJwtUtils _jwtUtilis;
    public IMapper _mapper;

    public OwnerService(IOwnerRepository ownerRepository, IJwtUtils jwtUtilis, IMapper mapper)
    {
      _ownerRepository = ownerRepository;
      _jwtUtilis = jwtUtilis;
      _mapper = mapper;
    }

    public OwnerAuthResponseDto Authentificate(OwnerAuthRequestDto model)
    {
      var owner = _ownerRepository.FindByEmail(model.Email);
      if (owner == null || !BCryptNet.Verify(model.Password, owner.PasswordHash))
      {
        return null;
      }

      var jwtToken = _jwtUtilis.GenerateJwtToken(owner);
      return new OwnerAuthResponseDto(owner, jwtToken);
    }

    public async Task Create(OwnerAuthRequestDto owner)
    {
      var newDBOwner = _mapper.Map<Owner>(owner);
      newDBOwner.PasswordHash = BCryptNet.HashPassword(owner.Password);
      newDBOwner.Role = Role.User;

      await _ownerRepository.CreateAsync(newDBOwner);
      await _ownerRepository.SaveAsync();
    }

    public async Task<List<Owner>> GetAllOwners()
    {
      return await _ownerRepository.GetAllAsync();
    }

    public Owner GetById(Guid id)
    {
      return _ownerRepository.FindById(id);
    }
  }
}

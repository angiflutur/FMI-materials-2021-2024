using proiect.Models;
using proiect.Models.DTOs.OwnerAuthRequestDto;
using proiect.Models.DTOs.OwnerAuthResponseDto;

namespace proiect.Services.OwnerService
{
    public interface IOwnerService
    {
        OwnerAuthResponseDto Authentificate(OwnerAuthRequestDto model);
        Task Create(OwnerAuthRequestDto newOwner);
        Owner GetById(Guid id);
    }
}

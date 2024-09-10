using TiendaRigo.DTOs;

namespace TiendaRigo.Services
{
    public interface IProductoService
    {
        Task<IEnumerable<ProductoDTO>> Get();
        Task<ProductoDTO> Get(int id);
    }
}

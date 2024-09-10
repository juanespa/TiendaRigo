using Microsoft.EntityFrameworkCore;
using TiendaRigo.DTOs;
using TiendaRigo.Models;

namespace TiendaRigo.Services
{
    public class ProductoService : IProductoService
    {
        private RigoContext _context;

        public ProductoService(RigoContext context)
        {
            _context = context;
        }

        public async Task<IEnumerable<ProductoDTO>> Get() =>
           await _context.Producto.Select(pro => new ProductoDTO
           {
               ProductoId = pro.ProductoId,
               NombreProducto = pro.NombreProducto,
               Cantidad = pro.Cantidad,
               precio = pro.precio
           }).ToListAsync();

        public Task<ProductoDTO> Get(int id)
        {
            throw new NotImplementedException();
        }
    }
}

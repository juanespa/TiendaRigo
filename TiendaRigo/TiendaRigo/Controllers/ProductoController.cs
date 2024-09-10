using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using TiendaRigo.DTOs;
using TiendaRigo.Models;
using TiendaRigo.Services;

namespace TiendaRigo.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductoController : ControllerBase
    {

        private IProductoService _productoService;

        public ProductoController(
            IProductoService productoService
            ) {


            _productoService = productoService;
        }

        [HttpGet]
        public async Task<IEnumerable<ProductoDTO>> Get() =>
            await _productoService.Get();
          
        
    }
}

using System.ComponentModel.DataAnnotations.Schema;

namespace TiendaRigo.DTOs
{
    public class ProductoDTO
    {
        public int ProductoId { get; set; }
        public string NombreProducto { get; set; }
        public decimal precio { get; set; }
        public int Cantidad { get; set; }
    }
}

using Microsoft.AspNetCore.Http.HttpResults;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace TiendaRigo.Models
{
    public class Producto
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int ProductoId { get; set; }
        public string NombreProducto { get; set; }

        [Column(TypeName ="decimal(20,2)")]
        public decimal precio { get; set; }
        public int Cantidad{ get; set; }
    }
}
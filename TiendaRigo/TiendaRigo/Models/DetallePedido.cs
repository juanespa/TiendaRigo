using Microsoft.AspNetCore.Http.HttpResults;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace TiendaRigo.Models
{
    public class DetallePedido
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int DetallePedidoId { get; set; }
        public int PedidoId { get; set; }
        public int ProductoId { get; set; }
        public int Cantidad { get; set; }
        [Column(TypeName = "decimal(200,2)")]
        public decimal SubTotal { get; set; }

        [ForeignKey("PedidoId")] 
        public virtual Pedidos Pedidos { get; set; }
        [ForeignKey("ProductoId")]
        public virtual Producto Productos { get; set; }
    }
}

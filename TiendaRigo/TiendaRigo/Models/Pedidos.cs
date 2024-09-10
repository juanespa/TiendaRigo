using Microsoft.AspNetCore.Http.HttpResults;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace TiendaRigo.Models
{
    public class Pedidos
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int PedidoId { get; set; }
        public int UsuarioId { get; set; }
        [Column(TypeName = "decimal(200,2)")]
        public decimal ValorTotal { get; set; }

        [ForeignKey("UsuarioId")]
        public virtual Usuarios Usuarios { get; set; }
    }
}

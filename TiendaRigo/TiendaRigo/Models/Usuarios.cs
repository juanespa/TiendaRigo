using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace TiendaRigo.Models
{
    public class Usuarios
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int UsuarioId { get; set; }
        public string Nombre { get; set; }
        public string DireccionEntrega { get; set; }
        public string Cedula { get; set; }
    }
}

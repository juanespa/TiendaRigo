using Microsoft.EntityFrameworkCore;

namespace TiendaRigo.Models
{
    public class RigoContext : DbContext
    {
        public RigoContext(DbContextOptions<RigoContext> options)
        : base(options)
        { }

        public DbSet<Usuarios> Usuarios { get; set; }
        public DbSet<Pedidos> Pedidos { get; set; }
        public DbSet<Producto> Producto { get; set; }
        public DbSet<DetallePedido> DetallePedido { get; set; }
    }
}

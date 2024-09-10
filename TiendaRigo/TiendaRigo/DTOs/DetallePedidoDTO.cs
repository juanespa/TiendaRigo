namespace TiendaRigo.DTOs
{
    public class DetallePedidoDTO
    {
        public int DetallePedidoId { get; set; }
        public int PedidoId { get; set; }
        public int ProductoId { get; set; }
        public int Cantidad { get; set; }
    }
}

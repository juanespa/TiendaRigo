using TiendaRigo.Models;

namespace TiendaRigo.Services
{
    public interface IDetallePedidoRepository
    {
        int InsertarDetallePedido(DetallePedido detallePedido);
        List<DetallePedido> ObtenerDetallePedidoPorPedidoId(int pedidoId);
        void ActualizarDetallePedido(DetallePedido detallePedido);
        void EliminarDetallePedido(int detallePedidoId);
        decimal ObtenerTotalPedido(int pedidoId);
    }
}

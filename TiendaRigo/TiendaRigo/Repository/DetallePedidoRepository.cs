using Microsoft.Data.SqlClient;
using System.Data;
using TiendaRigo.Models;
using TiendaRigo.Services;

namespace TiendaRigo.Repository
{
    public class DetallePedidoRepository : IDetallePedidoRepository
    {

        private readonly RigoContext _context;

        public DetallePedidoRepository(RigoContext context)
        {
            _context = context;
        }

        public void ActualizarDetallePedido(DetallePedido detallePedido)
        {
            using (SqlConnection connection = new SqlConnection("Rigo_conection"))
            {
                SqlCommand command = new SqlCommand("ActualizarDetallePedido", connection);
                command.CommandType = CommandType.StoredProcedure;

                command.Parameters.AddWithValue("@DetallePedidoId", detallePedido.DetallePedidoId);
                command.Parameters.AddWithValue("@ProductoId", detallePedido.ProductoId);
                command.Parameters.AddWithValue("@Cantidad", detallePedido.Cantidad);
                command.Parameters.AddWithValue("@SubTotal", detallePedido.SubTotal);

                connection.Open();
                command.ExecuteNonQuery();
            }
        }

        public void EliminarDetallePedido(int detallePedidoId)
        {
             using (SqlConnection connection = new SqlConnection("Rigo_conection"))
            {
                SqlCommand command = new SqlCommand("EliminarDetallePedido", connection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@DetallePedidoId", detallePedidoId);

                connection.Open();
                command.ExecuteNonQuery();
            }
        }

        public int InsertarDetallePedido(DetallePedido detallePedido)
        {
            using (SqlConnection connection = new SqlConnection("Rigo_conection"))
            {
                SqlCommand command = new SqlCommand("InsertarDetallePedido", connection);
                command.CommandType = CommandType.StoredProcedure;

                command.Parameters.AddWithValue("@PedidoId", detallePedido.PedidoId);
                command.Parameters.AddWithValue("@ProductoId", detallePedido.ProductoId);
                command.Parameters.AddWithValue("@Cantidad", detallePedido.Cantidad);
                command.Parameters.AddWithValue("@SubTotal", detallePedido.SubTotal);

                connection.Open();
                return Convert.ToInt32(command.ExecuteScalar());
            }
        }

        public List<DetallePedido> ObtenerDetallePedidoPorPedidoId(int pedidoId)
        {
            List<DetallePedido> detalles = new List<DetallePedido>();

            using (SqlConnection connection = new SqlConnection("Rigo_conection"))
            {
                SqlCommand command = new SqlCommand("ObtenerDetallePedidoPorPedidoId", connection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@PedidoId", pedidoId);

                connection.Open();
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        detalles.Add(new DetallePedido
                        {
                            DetallePedidoId = Convert.ToInt32(reader["DetallePedidoId"]),
                            PedidoId = Convert.ToInt32(reader["PedidoId"]),
                            ProductoId = Convert.ToInt32(reader["ProductoId"]),
                            Cantidad = Convert.ToInt32(reader["Cantidad"]),
                            SubTotal = Convert.ToDecimal(reader["SubTotal"])
                        });
                    }
                }
            }

            return detalles;
        }

        public decimal ObtenerTotalPedido(int pedidoId)
        {
            using (SqlConnection connection = new SqlConnection("Rigo_conection"))
            {
                SqlCommand command = new SqlCommand("ObtenerTotalPedido", connection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@PedidoId", pedidoId);

                connection.Open();
                return Convert.ToDecimal(command.ExecuteScalar());
            }
        }
    }
}

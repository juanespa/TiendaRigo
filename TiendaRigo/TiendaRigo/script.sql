USE [master]
GO
/****** Object:  Database [Rigo]    Script Date: 10/09/2024 11:34:34 a. m. ******/
CREATE DATABASE [Rigo]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Rigo', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Rigo.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Rigo_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Rigo_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Rigo] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Rigo].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Rigo] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Rigo] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Rigo] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Rigo] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Rigo] SET ARITHABORT OFF 
GO
ALTER DATABASE [Rigo] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Rigo] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Rigo] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Rigo] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Rigo] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Rigo] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Rigo] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Rigo] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Rigo] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Rigo] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Rigo] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Rigo] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Rigo] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Rigo] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Rigo] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Rigo] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Rigo] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Rigo] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Rigo] SET  MULTI_USER 
GO
ALTER DATABASE [Rigo] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Rigo] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Rigo] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Rigo] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Rigo] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Rigo] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Rigo] SET QUERY_STORE = ON
GO
ALTER DATABASE [Rigo] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Rigo]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 10/09/2024 11:34:34 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetallePedido]    Script Date: 10/09/2024 11:34:34 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetallePedido](
	[DetallePedidoId] [int] IDENTITY(1,1) NOT NULL,
	[PedidoId] [int] NOT NULL,
	[ProductoId] [int] NOT NULL,
	[Cantidad] [int] NOT NULL,
	[SubTotal] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_DetallePedido] PRIMARY KEY CLUSTERED 
(
	[DetallePedidoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pedidos]    Script Date: 10/09/2024 11:34:34 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pedidos](
	[PedidoId] [int] IDENTITY(1,1) NOT NULL,
	[UsuarioId] [int] NOT NULL,
	[ValorTotal] [decimal](20, 2) NOT NULL,
 CONSTRAINT [PK_Pedidos] PRIMARY KEY CLUSTERED 
(
	[PedidoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 10/09/2024 11:34:34 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto](
	[ProductoId] [int] IDENTITY(1,1) NOT NULL,
	[NombreProducto] [nvarchar](max) NOT NULL,
	[precio] [decimal](20, 2) NOT NULL,
	[Cantidad] [int] NOT NULL,
 CONSTRAINT [PK_Producto] PRIMARY KEY CLUSTERED 
(
	[ProductoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 10/09/2024 11:34:34 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[UsuarioId] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](max) NOT NULL,
	[DireccionEntrega] [nvarchar](max) NOT NULL,
	[Cedula] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[UsuarioId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240910104807_Init', N'8.0.8')
GO
SET IDENTITY_INSERT [dbo].[Producto] ON 

INSERT [dbo].[Producto] ([ProductoId], [NombreProducto], [precio], [Cantidad]) VALUES (1, N'Chaqueta', CAST(80000.00 AS Decimal(20, 2)), 15)
INSERT [dbo].[Producto] ([ProductoId], [NombreProducto], [precio], [Cantidad]) VALUES (2, N'Gafas', CAST(50000.00 AS Decimal(20, 2)), 20)
INSERT [dbo].[Producto] ([ProductoId], [NombreProducto], [precio], [Cantidad]) VALUES (3, N'Cascos', CAST(90000.00 AS Decimal(20, 2)), 40)
SET IDENTITY_INSERT [dbo].[Producto] OFF
GO
/****** Object:  Index [IX_DetallePedido_PedidoId]    Script Date: 10/09/2024 11:34:34 a. m. ******/
CREATE NONCLUSTERED INDEX [IX_DetallePedido_PedidoId] ON [dbo].[DetallePedido]
(
	[PedidoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_DetallePedido_ProductoId]    Script Date: 10/09/2024 11:34:34 a. m. ******/
CREATE NONCLUSTERED INDEX [IX_DetallePedido_ProductoId] ON [dbo].[DetallePedido]
(
	[ProductoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Pedidos_UsuarioId]    Script Date: 10/09/2024 11:34:34 a. m. ******/
CREATE NONCLUSTERED INDEX [IX_Pedidos_UsuarioId] ON [dbo].[Pedidos]
(
	[UsuarioId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DetallePedido]  WITH CHECK ADD  CONSTRAINT [FK_DetallePedido_Pedidos_PedidoId] FOREIGN KEY([PedidoId])
REFERENCES [dbo].[Pedidos] ([PedidoId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DetallePedido] CHECK CONSTRAINT [FK_DetallePedido_Pedidos_PedidoId]
GO
ALTER TABLE [dbo].[DetallePedido]  WITH CHECK ADD  CONSTRAINT [FK_DetallePedido_Producto_ProductoId] FOREIGN KEY([ProductoId])
REFERENCES [dbo].[Producto] ([ProductoId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DetallePedido] CHECK CONSTRAINT [FK_DetallePedido_Producto_ProductoId]
GO
ALTER TABLE [dbo].[Pedidos]  WITH CHECK ADD  CONSTRAINT [FK_Pedidos_Usuarios_UsuarioId] FOREIGN KEY([UsuarioId])
REFERENCES [dbo].[Usuarios] ([UsuarioId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Pedidos] CHECK CONSTRAINT [FK_Pedidos_Usuarios_UsuarioId]
GO
/****** Object:  StoredProcedure [dbo].[ActualizarDetallePedido]    Script Date: 10/09/2024 11:34:34 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ActualizarDetallePedido]
    @DetallePedidoId INT,
    @ProductoId INT,
    @Cantidad INT,
    @SubTotal DECIMAL(18, 2)
AS
BEGIN
    SET NOCOUNT ON;
    
    UPDATE [dbo].[DetallePedido]
    SET ProductoId = @ProductoId, Cantidad = @Cantidad, SubTotal = @SubTotal
    WHERE DetallePedidoId = @DetallePedidoId;
END
GO
/****** Object:  StoredProcedure [dbo].[ActualizarUsuario]    Script Date: 10/09/2024 11:34:34 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ActualizarUsuario]
    @UsuarioId INT,
    @Nombre NVARCHAR(MAX),
    @DireccionEntrega NVARCHAR(MAX),
    @Cedula NVARCHAR(MAX)
AS
BEGIN
    SET NOCOUNT ON;
    
    UPDATE [dbo].[Usuarios]
    SET Nombre = @Nombre, DireccionEntrega = @DireccionEntrega, Cedula = @Cedula
    WHERE UsuarioId = @UsuarioId;
END
GO
/****** Object:  StoredProcedure [dbo].[InsertarDetallePedido]    Script Date: 10/09/2024 11:34:34 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertarDetallePedido]
    @PedidoId INT,
    @ProductoId INT,
    @Cantidad INT,
    @SubTotal DECIMAL(18, 2)
AS
BEGIN
    SET NOCOUNT ON;
    
    INSERT INTO [dbo].[DetallePedido] (PedidoId, ProductoId, Cantidad, SubTotal)
    VALUES (@PedidoId, @ProductoId, @Cantidad, @SubTotal);
    
    -- Retornar el ID del nuevo detalle del pedido
    SELECT SCOPE_IDENTITY() AS DetallePedidoId;
END
GO
/****** Object:  StoredProcedure [dbo].[InsertarUsuario]    Script Date: 10/09/2024 11:34:34 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertarUsuario]
    @Nombre NVARCHAR(MAX),
    @DireccionEntrega NVARCHAR(MAX),
    @Cedula NVARCHAR(MAX)
AS
BEGIN
    SET NOCOUNT ON;
    
    INSERT INTO [dbo].[Usuarios] (Nombre, DireccionEntrega, Cedula)
    VALUES (@Nombre, @DireccionEntrega, @Cedula);
    
    -- Retornar el ID del nuevo usuario
    SELECT SCOPE_IDENTITY() AS UsuarioId;
END
GO
/****** Object:  StoredProcedure [dbo].[ObtenerDetallePedidoPorPedidoId]    Script Date: 10/09/2024 11:34:34 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerDetallePedidoPorPedidoId]
    @PedidoId INT
AS
BEGIN
    SET NOCOUNT ON;
    
    SELECT DetallePedidoId, PedidoId, ProductoId, Cantidad, SubTotal
    FROM [dbo].[DetallePedido]
    WHERE PedidoId = @PedidoId;
END
GO
/****** Object:  StoredProcedure [dbo].[ObtenerUsuarioPorId]    Script Date: 10/09/2024 11:34:34 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerUsuarioPorId]
    @UsuarioId INT
AS
BEGIN
    SET NOCOUNT ON;
    
    SELECT UsuarioId, Nombre, DireccionEntrega, Cedula
    FROM [dbo].[Usuarios]
    WHERE UsuarioId = @UsuarioId;
END
GO
USE [master]
GO
ALTER DATABASE [Rigo] SET  READ_WRITE 
GO

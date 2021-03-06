USE [sisventas]
GO
/****** Object:  User [jeyson]    Script Date: 8/6/2019 4:05:34 PM ******/
CREATE USER [jeyson] FOR LOGIN [jeyson] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  UserDefinedFunction [dbo].[Apellido_cliente]    Script Date: 8/6/2019 4:05:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[Apellido_cliente](@id int)
RETURNS varchar(20)
AS
BEGIN
Declare @apellido varchar(20)
Set  @apellido=(select Apellido from Cliente where Id=@id)
Return @apellido
END
GO
/****** Object:  UserDefinedFunction [dbo].[Cantidad_stock]    Script Date: 8/6/2019 4:05:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[Cantidad_stock] (@id int)
RETURNS float
AS
BEGIN
Declare @cantidad float
Set  @cantidad=(select Stock from Producto where Id=@id)
Return @cantidad
END

GO
/****** Object:  UserDefinedFunction [dbo].[Nombre_completo_vendedor]    Script Date: 8/6/2019 4:05:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[Nombre_completo_vendedor](@id int)
RETURNS varchar(50)
AS
BEGIN
Declare @Nombre_completo varchar(50)
Set  @Nombre_completo=(select CONCAT (Nombre,' ',Apellido)  from Cliente where Id=@id)
Return @Nombre_completo
END
GO
/****** Object:  Table [dbo].[categorias]    Script Date: 8/6/2019 4:05:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categorias](
	[id_cat] [int] NULL,
	[descripcion] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ciudades]    Script Date: 8/6/2019 4:05:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ciudades](
	[id_ciudad] [int] NULL,
	[descripcion] [varchar](50) NULL,
	[id_pais] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 8/6/2019 4:05:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[Id] [int] NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Apellido] [varchar](50) NULL,
	[identificacion] [varchar](20) NULL,
	[id_sector] [int] NULL,
	[referencia] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cliente_vs_tel]    Script Date: 8/6/2019 4:05:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cliente_vs_tel](
	[id_cliente] [int] NULL,
	[id_telefono] [int] NULL,
	[status] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Detalle_factura]    Script Date: 8/6/2019 4:05:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Detalle_factura](
	[Id_Factura] [int] NOT NULL,
	[Id_producto] [int] NULL,
	[cantidad] [float] NULL,
	[Importe] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Factura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Factura]    Script Date: 8/6/2019 4:05:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Factura](
	[Id] [int] NOT NULL,
	[Id_cliente] [int] NULL,
	[total] [float] NULL,
	[balance] [float] NULL,
	[tipo_pago] [int] NULL,
	[forma_p] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[forma_pago]    Script Date: 8/6/2019 4:05:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[forma_pago](
	[id_f] [int] NULL,
	[forma_pago] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[municipios]    Script Date: 8/6/2019 4:05:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[municipios](
	[id_municipio] [int] NULL,
	[descripcion] [varchar](50) NULL,
	[id_provincia] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[paises]    Script Date: 8/6/2019 4:05:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[paises](
	[id] [int] NULL,
	[pais] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 8/6/2019 4:05:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto](
	[Id] [int] NOT NULL,
	[Descripcion] [varchar](40) NULL,
	[Stock] [float] NULL,
	[Precio] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[provincias]    Script Date: 8/6/2019 4:05:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[provincias](
	[id_provincias] [int] NULL,
	[descripcion] [varchar](50) NULL,
	[id_ciudad] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[recibo]    Script Date: 8/6/2019 4:05:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[recibo](
	[id] [int] NULL,
	[pago] [float] NULL,
	[id_factura] [int] NULL,
	[balance] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sectores]    Script Date: 8/6/2019 4:05:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sectores](
	[id_sector] [int] NULL,
	[descripcion] [varchar](50) NULL,
	[id_municipio] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[telefonos]    Script Date: 8/6/2019 4:05:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[telefonos](
	[id_telefono] [int] NULL,
	[numero] [varchar](50) NULL,
	[tipo] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipo_pago]    Script Date: 8/6/2019 4:05:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipo_pago](
	[id] [int] NULL,
	[tipo_pag] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipo_telefono]    Script Date: 8/6/2019 4:05:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipo_telefono](
	[id_tipo] [int] NULL,
	[descripcion] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vendedor]    Script Date: 8/6/2019 4:05:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vendedor](
	[Id] [int] NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Apellido] [varchar](50) NULL,
	[identificacion] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[cant_clientes]    Script Date: 8/6/2019 4:05:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[cant_clientes]  
  AS   
Select COUNT(Id) from Cliente;
GO
/****** Object:  StoredProcedure [dbo].[cant_detalles]    Script Date: 8/6/2019 4:05:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[cant_detalles] 
AS   
Select COUNT(Id_factura) from Detalle_factura;
GO
/****** Object:  StoredProcedure [dbo].[cant_facturas]    Script Date: 8/6/2019 4:05:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[cant_facturas] 
  AS   
Select COUNT(Id) from Factura;
GO
/****** Object:  StoredProcedure [dbo].[cant_productos]    Script Date: 8/6/2019 4:05:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[cant_productos]  
  AS   
Select COUNT(Id) from Producto;
GO
/****** Object:  StoredProcedure [dbo].[cant_vendedores]    Script Date: 8/6/2019 4:05:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[cant_vendedores] 
  AS   
Select COUNT(Id) from Vendedor;
GO

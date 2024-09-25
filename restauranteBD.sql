USE [master]
GO
/****** Object:  Database [restauranteBD]    Script Date: 9/24/2024 10:17:39 PM ******/
CREATE DATABASE [restauranteBD]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'restauranteBD', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLSERVER2017V2\MSSQL\DATA\restauranteBD.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'restauranteBD_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLSERVER2017V2\MSSQL\DATA\restauranteBD_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [restauranteBD] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [restauranteBD].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [restauranteBD] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [restauranteBD] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [restauranteBD] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [restauranteBD] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [restauranteBD] SET ARITHABORT OFF 
GO
ALTER DATABASE [restauranteBD] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [restauranteBD] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [restauranteBD] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [restauranteBD] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [restauranteBD] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [restauranteBD] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [restauranteBD] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [restauranteBD] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [restauranteBD] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [restauranteBD] SET  DISABLE_BROKER 
GO
ALTER DATABASE [restauranteBD] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [restauranteBD] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [restauranteBD] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [restauranteBD] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [restauranteBD] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [restauranteBD] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [restauranteBD] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [restauranteBD] SET RECOVERY FULL 
GO
ALTER DATABASE [restauranteBD] SET  MULTI_USER 
GO
ALTER DATABASE [restauranteBD] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [restauranteBD] SET DB_CHAINING OFF 
GO
ALTER DATABASE [restauranteBD] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [restauranteBD] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [restauranteBD] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'restauranteBD', N'ON'
GO
ALTER DATABASE [restauranteBD] SET QUERY_STORE = OFF
GO
USE [restauranteBD]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 9/24/2024 10:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[ClienteID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](100) NOT NULL,
	[Usuario] [nvarchar](50) NOT NULL,
	[Contrasena] [nvarchar](255) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ClienteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetalleRecibo]    Script Date: 9/24/2024 10:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleRecibo](
	[DetalleID] [int] IDENTITY(1,1) NOT NULL,
	[ReciboID] [int] NOT NULL,
	[PlatoID] [int] NOT NULL,
	[Cantidad] [int] NOT NULL,
	[Precio] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DetalleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleados]    Script Date: 9/24/2024 10:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleados](
	[EmpleadoID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](100) NOT NULL,
	[Usuario] [nvarchar](50) NOT NULL,
	[Contrasena] [nvarchar](255) NOT NULL,
	[Puesto] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[EmpleadoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 9/24/2024 10:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[PlatoID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](100) NOT NULL,
	[Descripcion] [nvarchar](255) NULL,
	[Precio] [decimal](10, 2) NOT NULL,
	[Categoria] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PlatoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Recibos]    Script Date: 9/24/2024 10:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Recibos](
	[ReciboID] [int] IDENTITY(1,1) NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[ClienteID] [int] NULL,
	[EmpleadoID] [int] NULL,
	[Total] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ReciboID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Clientes] ON 

INSERT [dbo].[Clientes] ([ClienteID], [Nombre], [Usuario], [Contrasena], [Email]) VALUES (1, N'Camila', N'cami2003', N'123456', N'cami2003@gmail.com')
SET IDENTITY_INSERT [dbo].[Clientes] OFF
GO
SET IDENTITY_INSERT [dbo].[Empleados] ON 

INSERT [dbo].[Empleados] ([EmpleadoID], [Nombre], [Usuario], [Contrasena], [Puesto]) VALUES (1, N'Ale', N'ale2003', N'5432', N'Vendedor')
INSERT [dbo].[Empleados] ([EmpleadoID], [Nombre], [Usuario], [Contrasena], [Puesto]) VALUES (2, N'Alejandro', N'alejandro2003', N'3546', N'Jefe de ventas')
SET IDENTITY_INSERT [dbo].[Empleados] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Clientes__A9D1053430E75990]    Script Date: 9/24/2024 10:17:40 PM ******/
ALTER TABLE [dbo].[Clientes] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Clientes__E3237CF74B929560]    Script Date: 9/24/2024 10:17:40 PM ******/
ALTER TABLE [dbo].[Clientes] ADD UNIQUE NONCLUSTERED 
(
	[Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Empleado__E3237CF71181AE1C]    Script Date: 9/24/2024 10:17:40 PM ******/
ALTER TABLE [dbo].[Empleados] ADD UNIQUE NONCLUSTERED 
(
	[Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Recibos] ADD  DEFAULT (getdate()) FOR [Fecha]
GO
ALTER TABLE [dbo].[DetalleRecibo]  WITH CHECK ADD FOREIGN KEY([PlatoID])
REFERENCES [dbo].[Menu] ([PlatoID])
GO
ALTER TABLE [dbo].[DetalleRecibo]  WITH CHECK ADD FOREIGN KEY([ReciboID])
REFERENCES [dbo].[Recibos] ([ReciboID])
GO
ALTER TABLE [dbo].[Recibos]  WITH CHECK ADD FOREIGN KEY([ClienteID])
REFERENCES [dbo].[Clientes] ([ClienteID])
GO
ALTER TABLE [dbo].[Recibos]  WITH CHECK ADD FOREIGN KEY([EmpleadoID])
REFERENCES [dbo].[Empleados] ([EmpleadoID])
GO
USE [master]
GO
ALTER DATABASE [restauranteBD] SET  READ_WRITE 
GO

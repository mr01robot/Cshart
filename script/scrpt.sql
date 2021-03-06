USE [master]
GO
/****** Object:  Database [Practica]    Script Date: 2/02/2021 20:45:20 ******/
CREATE DATABASE [Practica]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Practica', FILENAME = N'M:\expres\MSSQL15.SQLEXPRESS\MSSQL\DATA\Practica.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Practica_log', FILENAME = N'M:\expres\MSSQL15.SQLEXPRESS\MSSQL\DATA\Practica_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Practica] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Practica].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Practica] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Practica] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Practica] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Practica] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Practica] SET ARITHABORT OFF 
GO
ALTER DATABASE [Practica] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Practica] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Practica] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Practica] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Practica] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Practica] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Practica] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Practica] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Practica] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Practica] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Practica] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Practica] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Practica] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Practica] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Practica] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Practica] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Practica] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Practica] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Practica] SET  MULTI_USER 
GO
ALTER DATABASE [Practica] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Practica] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Practica] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Practica] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Practica] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Practica] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Practica] SET QUERY_STORE = OFF
GO
USE [Practica]
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 2/02/2021 20:45:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](100) NULL,
	[Descripcion] [nvarchar](100) NULL,
	[Marca] [nvarchar](100) NULL,
	[Precio] [float] NULL,
	[Stock] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Productos] ON 

INSERT [dbo].[Productos] ([Id], [Nombre], [Descripcion], [Marca], [Precio], [Stock]) VALUES (1, N'Gaseosa', N'3 litros', N'marcacola', 7.5, 24)
INSERT [dbo].[Productos] ([Id], [Nombre], [Descripcion], [Marca], [Precio], [Stock]) VALUES (2, N'Chocolate', N'Tableta 100 gramos', N'iberica', 12.5, 36)
SET IDENTITY_INSERT [dbo].[Productos] OFF
GO
/****** Object:  StoredProcedure [dbo].[EditarProductos]    Script Date: 2/02/2021 20:45:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------EDITAR
create proc [dbo].[EditarProductos]
@nombre nvarchar (100),
@descrip nvarchar (100),
@marca nvarchar (100),
@precio float,
@stock int,
@id int
as
update Productos set Nombre=@nombre, Descripcion=@descrip, Marca=@marca, Precio=@precio, Stock=@stock where Id=@id
GO
/****** Object:  StoredProcedure [dbo].[EliminarProducto]    Script Date: 2/02/2021 20:45:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------ELIMINAR
create proc [dbo].[EliminarProducto]
@idpro int
as
delete from Productos where Id=@idpro
GO
/****** Object:  StoredProcedure [dbo].[InsetarProductos]    Script Date: 2/02/2021 20:45:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--------------------------INSERTAR 
create proc [dbo].[InsetarProductos]
@nombre nvarchar (100),
@descrip nvarchar (100),
@marca nvarchar (100),
@precio float,
@stock int
as
insert into Productos values (@nombre,@descrip,@marca,@precio,@stock)
GO
/****** Object:  StoredProcedure [dbo].[MostrarProductos]    Script Date: 2/02/2021 20:45:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



create proc [dbo].[MostrarProductos]
as
select *from Productos
GO
USE [master]
GO
ALTER DATABASE [Practica] SET  READ_WRITE 
GO

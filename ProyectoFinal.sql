USE [master]
GO
/****** Object:  Database [Aid Together]    Script Date: 7/11/2023 09:44:22 ******/
CREATE DATABASE [Aid Together]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Aid Together', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Aid Together.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Aid Together_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Aid Together_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Aid Together] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Aid Together].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Aid Together] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Aid Together] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Aid Together] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Aid Together] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Aid Together] SET ARITHABORT OFF 
GO
ALTER DATABASE [Aid Together] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Aid Together] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Aid Together] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Aid Together] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Aid Together] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Aid Together] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Aid Together] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Aid Together] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Aid Together] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Aid Together] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Aid Together] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Aid Together] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Aid Together] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Aid Together] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Aid Together] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Aid Together] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Aid Together] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Aid Together] SET RECOVERY FULL 
GO
ALTER DATABASE [Aid Together] SET  MULTI_USER 
GO
ALTER DATABASE [Aid Together] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Aid Together] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Aid Together] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Aid Together] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Aid Together] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Aid Together', N'ON'
GO
ALTER DATABASE [Aid Together] SET QUERY_STORE = OFF
GO
USE [Aid Together]
GO
/****** Object:  User [alumno]    Script Date: 7/11/2023 09:44:22 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Categorias]    Script Date: 7/11/2023 09:44:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categorias](
	[IdCategoria] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Categorias] PRIMARY KEY CLUSTERED 
(
	[IdCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ComentarioPosteos]    Script Date: 7/11/2023 09:44:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ComentarioPosteos](
	[IdComentario] [int] IDENTITY(1,1) NOT NULL,
	[Cuerpo] [varchar](1000) NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[IdPosteo] [int] NOT NULL,
 CONSTRAINT [PK_ComentarioPosteos] PRIMARY KEY CLUSTERED 
(
	[IdComentario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Foros]    Script Date: 7/11/2023 09:44:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Foros](
	[IdForo] [int] NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[Titulo] [varchar](50) NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
	[IdCategoria] [int] NOT NULL,
 CONSTRAINT [PK_Foros] PRIMARY KEY CLUSTERED 
(
	[IdForo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Perfiles]    Script Date: 7/11/2023 09:44:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Perfiles](
	[IdPerfil] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](300) NULL,
	[ImagenFondo] [image] NULL,
	[IdUsuario] [int] NOT NULL,
 CONSTRAINT [PK_Perfiles] PRIMARY KEY CLUSTERED 
(
	[IdPerfil] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Posteos]    Script Date: 7/11/2023 09:44:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Posteos](
	[IdPosteo] [int] IDENTITY(1,1) NOT NULL,
	[Titulo] [varchar](200) NOT NULL,
	[Subtitulo] [varchar](400) NULL,
	[Descripcion] [varchar](400) NULL,
	[Cuerpo] [varchar](5000) NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[IdForo] [int] NOT NULL,
 CONSTRAINT [PK_Posteos] PRIMARY KEY CLUSTERED 
(
	[IdPosteo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 7/11/2023 09:44:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[Usuario] [varchar](50) NOT NULL,
	[Contraseña] [varchar](50) NOT NULL,
	[Correo] [varchar](50) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Apellido] [varchar](50) NOT NULL,
	[Foto] [image] NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[ComentarioPosteos]  WITH CHECK ADD  CONSTRAINT [FK_ComentarioPosteos_Posteos] FOREIGN KEY([IdPosteo])
REFERENCES [dbo].[Posteos] ([IdPosteo])
GO
ALTER TABLE [dbo].[ComentarioPosteos] CHECK CONSTRAINT [FK_ComentarioPosteos_Posteos]
GO
ALTER TABLE [dbo].[ComentarioPosteos]  WITH CHECK ADD  CONSTRAINT [FK_ComentarioPosteos_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[ComentarioPosteos] CHECK CONSTRAINT [FK_ComentarioPosteos_Usuario]
GO
ALTER TABLE [dbo].[Foros]  WITH CHECK ADD  CONSTRAINT [FK_Foros_Categorias] FOREIGN KEY([IdCategoria])
REFERENCES [dbo].[Categorias] ([IdCategoria])
GO
ALTER TABLE [dbo].[Foros] CHECK CONSTRAINT [FK_Foros_Categorias]
GO
ALTER TABLE [dbo].[Foros]  WITH CHECK ADD  CONSTRAINT [FK_Foros_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[Foros] CHECK CONSTRAINT [FK_Foros_Usuario]
GO
ALTER TABLE [dbo].[Perfiles]  WITH CHECK ADD  CONSTRAINT [FK_Perfiles_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[Perfiles] CHECK CONSTRAINT [FK_Perfiles_Usuario]
GO
ALTER TABLE [dbo].[Posteos]  WITH CHECK ADD  CONSTRAINT [FK_Posteos_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[Posteos] CHECK CONSTRAINT [FK_Posteos_Usuario]
GO
USE [master]
GO
ALTER DATABASE [Aid Together] SET  READ_WRITE 
GO

USE [master]
GO
/****** Object:  Database [Aid Together]    Script Date: 21/11/2023 10:06:54 ******/
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
/****** Object:  User [alumno]    Script Date: 21/11/2023 10:06:54 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Categorias]    Script Date: 21/11/2023 10:06:54 ******/
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
/****** Object:  Table [dbo].[ComentarioPosteos]    Script Date: 21/11/2023 10:06:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ComentarioPosteos](
	[IdComentario] [int] IDENTITY(1,1) NOT NULL,
	[Cuerpo] [varchar](1000) NOT NULL,
	[Fecha] [date] NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[IdPosteo] [int] NOT NULL,
 CONSTRAINT [PK_ComentarioPosteos] PRIMARY KEY CLUSTERED 
(
	[IdComentario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Foros]    Script Date: 21/11/2023 10:06:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Foros](
	[IdForo] [int] IDENTITY(1,1) NOT NULL,
	[Titulo] [varchar](50) NOT NULL,
	[Descripcion] [varchar](400) NOT NULL,
	[IdCategoria] [int] NOT NULL,
	[IdUsuario] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Foro] PRIMARY KEY CLUSTERED 
(
	[IdForo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Perfiles]    Script Date: 21/11/2023 10:06:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Perfiles](
	[IdPerfil] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](300) NULL,
	[ImagenFondo] [varchar](400) NULL,
	[IdUsuario] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Perfiles] PRIMARY KEY CLUSTERED 
(
	[IdPerfil] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Posteos]    Script Date: 21/11/2023 10:06:54 ******/
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
	[IdUsuario] [varchar](50) NOT NULL,
	[IdForo] [int] NOT NULL,
 CONSTRAINT [PK_Posteos] PRIMARY KEY CLUSTERED 
(
	[IdPosteo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 21/11/2023 10:06:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[IdUsuario] [varchar](50) NOT NULL,
	[Contraseña] [varchar](50) NOT NULL,
	[Correo] [varchar](50) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Apellido] [varchar](50) NOT NULL,
	[Foto] [varchar](400) NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categorias] ON 

INSERT [dbo].[Categorias] ([IdCategoria], [Nombre]) VALUES (1, N'Deportes')
INSERT [dbo].[Categorias] ([IdCategoria], [Nombre]) VALUES (2, N'Alimentacion')
INSERT [dbo].[Categorias] ([IdCategoria], [Nombre]) VALUES (3, N'Primeros auxilios')
INSERT [dbo].[Categorias] ([IdCategoria], [Nombre]) VALUES (4, N'Enfermedades')
INSERT [dbo].[Categorias] ([IdCategoria], [Nombre]) VALUES (5, N'Infancia')
SET IDENTITY_INSERT [dbo].[Categorias] OFF
GO
SET IDENTITY_INSERT [dbo].[Foros] ON 

INSERT [dbo].[Foros] ([IdForo], [Titulo], [Descripcion], [IdCategoria], [IdUsuario]) VALUES (1, N'Messi', N'¿El mejor del mundo?', 1, N'admin')
INSERT [dbo].[Foros] ([IdForo], [Titulo], [Descripcion], [IdCategoria], [IdUsuario]) VALUES (2, N'Proteina', N'¿Es necesaria?', 2, N'admin')
INSERT [dbo].[Foros] ([IdForo], [Titulo], [Descripcion], [IdCategoria], [IdUsuario]) VALUES (3, N'Un correcto vendaje salva', N'¿Como aplicarlo?', 3, N'admin')
INSERT [dbo].[Foros] ([IdForo], [Titulo], [Descripcion], [IdCategoria], [IdUsuario]) VALUES (4, N'El cancer', N'¿Se encontro la cura?', 4, N'admin')
INSERT [dbo].[Foros] ([IdForo], [Titulo], [Descripcion], [IdCategoria], [IdUsuario]) VALUES (5, N'Los niños', N'¿Es necesario tener una buena infancia?', 5, N'admin')
SET IDENTITY_INSERT [dbo].[Foros] OFF
GO
SET IDENTITY_INSERT [dbo].[Perfiles] ON 

INSERT [dbo].[Perfiles] ([IdPerfil], [Descripcion], [ImagenFondo], [IdUsuario]) VALUES (3, NULL, NULL, N'admin')
SET IDENTITY_INSERT [dbo].[Perfiles] OFF
GO
SET IDENTITY_INSERT [dbo].[Posteos] ON 

INSERT [dbo].[Posteos] ([IdPosteo], [Titulo], [Subtitulo], [Descripcion], [Cuerpo], [IdUsuario], [IdForo]) VALUES (1, N'El mejor jugador del mundo', N'Messi', N'Lionel Andres Messi Cuccitini', N'¿Es el mejor jugador del mundo? Si hablamos en cuento a estadisticas, si, lo es. Pero cual es el mejor queda a persepcion de cada uno. Hay muchas figuras en muchos paises', N'admin', 1)
INSERT [dbo].[Posteos] ([IdPosteo], [Titulo], [Subtitulo], [Descripcion], [Cuerpo], [IdUsuario], [IdForo]) VALUES (2, N'La proteina es importante', N'El pollo, huevos, y demas', N'La proteina son macromoléculas formadas por cadenas lineales de aminoácidos', N'Las proteínas son moléculas grandes y complejas que desempeñan muchas funciones críticas en el cuerpo. Realizan la mayor parte del trabajo en las células y son necesarias para la estructura, función y regulación de los tejidos y órganos del cuerpo.', N'admin', 1)
INSERT [dbo].[Posteos] ([IdPosteo], [Titulo], [Subtitulo], [Descripcion], [Cuerpo], [IdUsuario], [IdForo]) VALUES (3, N'Los vendajes', N'Es raro que te tengas que aplicar un vendaje por tu cuenta, usualmente te lo ponen en un hospital. Pero aqui te demostramos como ponerlo', N'Un vendaje consiste en envolver una parte del cuerpo que está lesionada por diversos motivos con paños de lino o de lana unidas entre sí y colocadas en un orden racional.?', N'La venda debe desenrollarse siempre de izquierda a derecha (en personas diestras). Iniciar el vendaje desde la zona distal hacia la proximal y de la cara interna hacia la externa. Aplicar el vendaje de forma homogénea, ejerciendo la presión idónea dependiendo del tipo de vendaje. Almohadillar las prominencias óseas.', N'admin', 1)
INSERT [dbo].[Posteos] ([IdPosteo], [Titulo], [Subtitulo], [Descripcion], [Cuerpo], [IdUsuario], [IdForo]) VALUES (4, N'La enfermadad mas terminal del mundo', N'El cancer', N'Enfermedad en la que células anómalas se dividen sin control y destruyen los tejidos corporales.', N'La mayoría de los cánceres son causados por cambios genéticas que suceden a través de la vida de la persona como consecuencia natural del envejecimiento y la exposición a factores ambientales como el humo del tabaco y la radiación', N'admin', 1)
INSERT [dbo].[Posteos] ([IdPosteo], [Titulo], [Subtitulo], [Descripcion], [Cuerpo], [IdUsuario], [IdForo]) VALUES (6, N'La niñez', N'La infancia', N'Es el primer período de la vida de la persona, comprendido entre el nacimiento y el principio de la adolescencia.', N'La infancia o niñez? es un concepto amplio aplicado a los seres humanos que se encuentran en fases de desarrollo comprendidas entre el nacimiento y la adolescencia o pubertad.???? Legalmente, el término puede referirse a cualquier persona menor de edad o a algún otro límite de edad', N'admin', 1)
SET IDENTITY_INSERT [dbo].[Posteos] OFF
GO
INSERT [dbo].[Usuario] ([IdUsuario], [Contraseña], [Correo], [Nombre], [Apellido], [Foto]) VALUES (N'admin', N'AdminCrack', N'administrador@gmail.com', N'Luis', N'Chavez', N'https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500')
GO
ALTER TABLE [dbo].[ComentarioPosteos]  WITH CHECK ADD  CONSTRAINT [FK_ComentarioPosteos_Posteos] FOREIGN KEY([IdPosteo])
REFERENCES [dbo].[Posteos] ([IdPosteo])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ComentarioPosteos] CHECK CONSTRAINT [FK_ComentarioPosteos_Posteos]
GO
ALTER TABLE [dbo].[Foros]  WITH CHECK ADD  CONSTRAINT [FK_Foros_Categorias] FOREIGN KEY([IdCategoria])
REFERENCES [dbo].[Categorias] ([IdCategoria])
GO
ALTER TABLE [dbo].[Foros] CHECK CONSTRAINT [FK_Foros_Categorias]
GO
ALTER TABLE [dbo].[Perfiles]  WITH CHECK ADD  CONSTRAINT [FK_Perfiles_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([IdUsuario])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Perfiles] CHECK CONSTRAINT [FK_Perfiles_Usuario]
GO
ALTER TABLE [dbo].[Posteos]  WITH CHECK ADD  CONSTRAINT [FK_Posteos_Foros] FOREIGN KEY([IdForo])
REFERENCES [dbo].[Foros] ([IdForo])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Posteos] CHECK CONSTRAINT [FK_Posteos_Foros]
GO
ALTER TABLE [dbo].[Posteos]  WITH CHECK ADD  CONSTRAINT [FK_Posteos_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([IdUsuario])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Posteos] CHECK CONSTRAINT [FK_Posteos_Usuario]
GO
/****** Object:  StoredProcedure [dbo].[EliminarComentario]    Script Date: 21/11/2023 10:06:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[EliminarComentario] @IdUsuario varchar(50),@IdComentario int
as
begin
delete from ComentarioPosteos where IdUsuario=@IdUsuario and IdComentario=@IdComentario
end;
GO
/****** Object:  StoredProcedure [dbo].[EliminarForo]    Script Date: 21/11/2023 10:06:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[EliminarForo] @IdUsuario varchar(50),@IdForo int
as
begin
delete from Foros where IdUsuario=@IdUsuario and IdForo=@IdForo
end;
GO
/****** Object:  StoredProcedure [dbo].[EliminarPosteo]    Script Date: 21/11/2023 10:06:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[EliminarPosteo] @IdUsuario varchar(50),@IdPosteo int
as
begin
delete from Posteos where IdUsuario=@IdUsuario and IdPosteo=@IdPosteo
end;
GO
/****** Object:  StoredProcedure [dbo].[EliminarUsuario]    Script Date: 21/11/2023 10:06:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[EliminarUsuario] @IdUsuario varchar(50)
as
begin
delete from Usuario where IdUsuario=@IdUsuario
end;
GO
/****** Object:  StoredProcedure [dbo].[InsertarComentario]    Script Date: 21/11/2023 10:06:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[InsertarComentario] @Cuerpo varchar(1000), @Fecha date, @IdUsuario varchar(50), @IdPosteo int
as
begin
INSERT INTO ComentarioPosteos VALUES (@Cuerpo, @fecha, @IdUsuario, @idposteo)
end;
GO
/****** Object:  StoredProcedure [dbo].[InsertarForo]    Script Date: 21/11/2023 10:06:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[InsertarForo] @idCategoria int,@Titulo varchar(50),@Descripcion varchar(400),@idUsuario varchar(50)
as 
begin
Insert into Foros values(@idCategoria,@Titulo,@Descripcion,@idUsuario)
end;
GO
/****** Object:  StoredProcedure [dbo].[InsertarPosteo]    Script Date: 21/11/2023 10:06:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[InsertarPosteo] @Titulo varchar(200), @Subtitulo varchar(400), @Descripcion varchar(400), @Cuerpo varchar(5000), @IdUsuario varchar(50), @IdForo int
as
begin
INSERT INTO Posteos VALUES (@Titulo, @Subtitulo, @Descripcion, @Cuerpo, @IdUsuario, @IdForo)
end;
GO
/****** Object:  StoredProcedure [dbo].[InsertarUsuario]    Script Date: 21/11/2023 10:06:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsertarUsuario] @IdUsuario varchar(50), @Contraseña varchar(50), @Correo varchar(50), @Nombre varchar(50), @Apellido varchar(50), @Foto varchar(400)
as
begin
INSERT INTO Usuario VALUES (@IdUsuario,@Contraseña,@Correo,@Nombre,@Apellido,@Foto)
INSERT INTO Perfiles VALUES (NULL,NULL,@IdUsuario)
end;
GO
/****** Object:  StoredProcedure [dbo].[MostrarComentariosPosteosASC]    Script Date: 21/11/2023 10:06:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[MostrarComentariosPosteosASC]
@idPosteo int,
@Cantidad int
as
begin
declare @masDiez int = @cantidad + 10
Select * from ComentarioPosteos where IdPosteo = @idPosteo order by Fecha asc
offset @Cantidad rows fetch next @masDiez rows only
end;
GO
/****** Object:  StoredProcedure [dbo].[MostrarComentariosPosteosDESC]    Script Date: 21/11/2023 10:06:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[MostrarComentariosPosteosDESC]
@idPosteo int,
@Cantidad int
as
begin
declare @masDiez int = @cantidad + 10
Select * from ComentarioPosteos where IdPosteo = @idPosteo order by Fecha desc
offset @Cantidad rows fetch next @masDiez rows only
end;
GO
/****** Object:  StoredProcedure [dbo].[MostrarForos]    Script Date: 21/11/2023 10:06:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[MostrarForos] @IdCategoria int, @Cantidad int
as
begin
declare @masDiez int = @cantidad + 10
Select * from Foros where IdCategoria=@IdCategoria order by (select count(IdPosteo) from posteos where posteos.IdForo = Foros.IdForo)
OFFSET @cantidad rows fetch next @masDiez rows only
end
GO
/****** Object:  StoredProcedure [dbo].[MostrarForosPrincipal]    Script Date: 21/11/2023 10:06:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[MostrarForosPrincipal] @Cantidad int as
begin
declare @masDiez int = @cantidad + 10
Select * from Foros  order by (Select Count(IdPosteo) from Posteos)
OFFSET @Cantidad rows fetch next @masDiez rows only
end
GO
/****** Object:  StoredProcedure [dbo].[MostrarPerfil]    Script Date: 21/11/2023 10:06:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[MostrarPerfil] @idPersona varchar(50)
as
begin 
Select * from Perfiles where IdUsuario = @idPersona
end;
GO
/****** Object:  StoredProcedure [dbo].[MostrarPosteos]    Script Date: 21/11/2023 10:06:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[MostrarPosteos] @IdForo int, @Cantidad int
as 
begin
declare @masDiez int = @cantidad + 10
Select * from Posteos where IdForo=@IdForo order by (select count(IdComentario) from ComentarioPosteos where ComentarioPosteos.IdPosteo = Posteos.IdPosteo)
OFFSET @cantidad rows fetch next @masDiez rows only
end
GO
/****** Object:  StoredProcedure [dbo].[MostrarUsuario]    Script Date: 21/11/2023 10:06:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[MostrarUsuario] @idPersona varchar(50)
as
begin 
Select * from Usuario where IdUsuario = @idPersona
end;
GO
/****** Object:  StoredProcedure [dbo].[UpdatearComentario]    Script Date: 21/11/2023 10:06:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[UpdatearComentario] @IdUsuario varchar(50),@cuerpo varchar(1000), @IdComentario int
as
begin
update ComentarioPosteos set Cuerpo=@Cuerpo where IdUsuario=@IdUsuario and IdComentario=@IdComentario
end;
GO
/****** Object:  StoredProcedure [dbo].[UpdatearUsuario]    Script Date: 21/11/2023 10:06:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[UpdatearUsuario] @IdUsuario varchar(50),@Contraseña varchar(50), @Correo varchar(50), @Nombre varchar(50), @Apellido varchar(50), @Foto varchar(400), @Descripcion varchar(300), @ImagenFondo varchar(400)
as
begin
update Usuario set Contraseña=@Contraseña, Correo=@Correo, Nombre=@Nombre,Apellido=@Apellido,Foto=@Foto where IdUsuario=@IdUsuario
update Perfiles set Descripcion=@Descripcion, ImagenFondo=@ImagenFondo where IdUsuario=@IdUsuario
end;
GO
/****** Object:  StoredProcedure [dbo].[UsuarioExists]    Script Date: 21/11/2023 10:06:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Procedure [dbo].[UsuarioExists] @nombre varchar(50) as
begin
declare @bool int = 1
if((select idusuario from usuario where idusuario = @nombre) IS NULL)
begin
set @bool = 0
end
return @bool
end
GO
USE [master]
GO
ALTER DATABASE [Aid Together] SET  READ_WRITE 
GO

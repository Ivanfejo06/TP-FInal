USE [master]
GO
/****** Object:  Database [Aid Together]    Script Date: 28/11/2023 09:35:59 ******/
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
/****** Object:  User [alumno]    Script Date: 28/11/2023 09:35:59 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Categorias]    Script Date: 28/11/2023 09:35:59 ******/
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
/****** Object:  Table [dbo].[ComentarioPosteo]    Script Date: 28/11/2023 09:35:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ComentarioPosteo](
	[IdComentario] [int] IDENTITY(1,1) NOT NULL,
	[Cuerpo] [varchar](50) NOT NULL,
	[Fecha] [date] NOT NULL,
	[IdUsuario] [varchar](50) NOT NULL,
	[IdPosteo] [int] NOT NULL,
 CONSTRAINT [PK_ComentarioPosteo] PRIMARY KEY CLUSTERED 
(
	[IdComentario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Foro]    Script Date: 28/11/2023 09:35:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Foro](
	[IdForo] [int] IDENTITY(1,1) NOT NULL,
	[Titulo] [varchar](50) NOT NULL,
	[Descripcion] [varchar](400) NOT NULL,
	[IdCategoria] [int] NOT NULL,
	[IdUsuario] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Foro_1] PRIMARY KEY CLUSTERED 
(
	[IdForo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Perfiles]    Script Date: 28/11/2023 09:35:59 ******/
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
/****** Object:  Table [dbo].[Posteos]    Script Date: 28/11/2023 09:35:59 ******/
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
/****** Object:  Table [dbo].[Usuario]    Script Date: 28/11/2023 09:35:59 ******/
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

INSERT [dbo].[Categorias] ([IdCategoria], [Nombre]) VALUES (1, N'Deporte')
INSERT [dbo].[Categorias] ([IdCategoria], [Nombre]) VALUES (2, N'Alimentacion')
INSERT [dbo].[Categorias] ([IdCategoria], [Nombre]) VALUES (3, N'Primeros Auxilios')
INSERT [dbo].[Categorias] ([IdCategoria], [Nombre]) VALUES (4, N'Enfermedades')
INSERT [dbo].[Categorias] ([IdCategoria], [Nombre]) VALUES (5, N'Infancia')
SET IDENTITY_INSERT [dbo].[Categorias] OFF
GO
SET IDENTITY_INSERT [dbo].[ComentarioPosteo] ON 

INSERT [dbo].[ComentarioPosteo] ([IdComentario], [Cuerpo], [Fecha], [IdUsuario], [IdPosteo]) VALUES (2, N'Que bien', CAST(N'2023-11-28' AS Date), N'Macaquiri', 1)
INSERT [dbo].[ComentarioPosteo] ([IdComentario], [Cuerpo], [Fecha], [IdUsuario], [IdPosteo]) VALUES (3, N'Recomendable', CAST(N'2022-08-12' AS Date), N'Ivanfejo', 2)
INSERT [dbo].[ComentarioPosteo] ([IdComentario], [Cuerpo], [Fecha], [IdUsuario], [IdPosteo]) VALUES (5, N'Vot a tenerlo en cuenta', CAST(N'2021-07-14' AS Date), N'Pala', 4)
INSERT [dbo].[ComentarioPosteo] ([IdComentario], [Cuerpo], [Fecha], [IdUsuario], [IdPosteo]) VALUES (6, N'Hay que tener cuidado', CAST(N'2023-09-15' AS Date), N'Macaquiri', 5)
INSERT [dbo].[ComentarioPosteo] ([IdComentario], [Cuerpo], [Fecha], [IdUsuario], [IdPosteo]) VALUES (7, N'Hay que tenerlos en cuenta', CAST(N'2022-11-13' AS Date), N'Pala', 8)
SET IDENTITY_INSERT [dbo].[ComentarioPosteo] OFF
GO
SET IDENTITY_INSERT [dbo].[Foro] ON 

INSERT [dbo].[Foro] ([IdForo], [Titulo], [Descripcion], [IdCategoria], [IdUsuario]) VALUES (1, N'Futbol', N'Los beneficios del futbol', 1, N'Macaquiri')
INSERT [dbo].[Foro] ([IdForo], [Titulo], [Descripcion], [IdCategoria], [IdUsuario]) VALUES (3, N'Alimentacion Saludable', N'Es importante comer una gran variedad de alimentos', 2, N'Pala')
INSERT [dbo].[Foro] ([IdForo], [Titulo], [Descripcion], [IdCategoria], [IdUsuario]) VALUES (4, N'Vendajes', N'Son para ocasiones especiales ', 3, N'Ivanfejo')
INSERT [dbo].[Foro] ([IdForo], [Titulo], [Descripcion], [IdCategoria], [IdUsuario]) VALUES (5, N'Cancer ', N'La famosa enfermedad', 4, N'Macaquiri')
INSERT [dbo].[Foro] ([IdForo], [Titulo], [Descripcion], [IdCategoria], [IdUsuario]) VALUES (6, N'Tratos', N'A un niño pequeño ', 5, N'Pala')
SET IDENTITY_INSERT [dbo].[Foro] OFF
GO
SET IDENTITY_INSERT [dbo].[Perfiles] ON 

INSERT [dbo].[Perfiles] ([IdPerfil], [Descripcion], [ImagenFondo], [IdUsuario]) VALUES (1, N'Hola me llamo marcos y soy ingeniero industrial', N'https://humanidades.com/wp-content/uploads/2017/07/clima-calido-2-e1571417682380.jpg', N'Macaquiri')
INSERT [dbo].[Perfiles] ([IdPerfil], [Descripcion], [ImagenFondo], [IdUsuario]) VALUES (3, N'Hola me llamo Ivan Joaquin y soy estudiante de la institucion ORT', N'https://www.elagoradiario.com/wp-content/uploads/2019/06/sequ%C3%ADa-1140x600.jpg', N'Ivanfejo')
INSERT [dbo].[Perfiles] ([IdPerfil], [Descripcion], [ImagenFondo], [IdUsuario]) VALUES (4, N'Hola me llamo Thiago Palachi y soy enfermero del hospital naval', N'https://humanidades.com/wp-content/uploads/2023/11/clima-calido-portada-1.jpg', N'Pala')
SET IDENTITY_INSERT [dbo].[Perfiles] OFF
GO
SET IDENTITY_INSERT [dbo].[Posteos] ON 

INSERT [dbo].[Posteos] ([IdPosteo], [Titulo], [Subtitulo], [Descripcion], [Cuerpo], [IdUsuario], [IdForo]) VALUES (1, N'Messi es el mejor del mundo', N'El deportista que lo gano todo', N'Messi, nacido en Rosario, provincia de Santa Fe, gano este ultimo año el mundial', N'Lionel Andrés Messi Cuccittini, conocido como Leo Messi, es un futbolista argentino que juega como delantero o centrocampista. Desde 2023, integra el plantel del Inter Miami de la MLS estadounidense. Es también internacional con la selección de Argentina, de la que es capitán.', N'Macaquiri', 1)
INSERT [dbo].[Posteos] ([IdPosteo], [Titulo], [Subtitulo], [Descripcion], [Cuerpo], [IdUsuario], [IdForo]) VALUES (2, N'La ensalada', N'Esta es una de las primeras opciones que se vienen a la cabeza cuando hablamos de comida saludable', N'A pesar de esto, no es lo unico que podes comer "sano".  Pero recomendamos un nutrisionista para saber bien que tendrias que comer', N'La comida, a pesar de querer una diate saludable, tambien se necesita tener mas informacion, como el peso, la altura, si hace algun deporte, y ver como venia comiendo de antemano. Es por eso que recomendamos un nutrisionista para quitarse las dudas en cuestiones mas personales', N'Macaquiri', 3)
INSERT [dbo].[Posteos] ([IdPosteo], [Titulo], [Subtitulo], [Descripcion], [Cuerpo], [IdUsuario], [IdForo]) VALUES (4, N'Los vendajes', N'Los vendajes se usan poco, pero es importante para ocasiones de emergencia saber aplicarlos', N'Los vendajes se pueden utilizar para una fractura, esguince, o una torcedura. Tambien para alguna quemadura, pero no es lo mas recomendable.', N'El vendaje se utiliza para: Sujetar apósitos, fijar entablillados y fijar articulaciones. Las vendas son tiras de lienzo, estas varían en tamaño y en calidad del material. Las más utilizadas son las siguientes: venda elástica, venda de crepe, o venda elástica cohesiva.', N'Macaquiri', 4)
INSERT [dbo].[Posteos] ([IdPosteo], [Titulo], [Subtitulo], [Descripcion], [Cuerpo], [IdUsuario], [IdForo]) VALUES (5, N'Esta enfermedad...', N'Otros nombres: Neoplasia', N'El cáncer es una enfermedad por la que algunas células del cuerpo se multiplican sin control y se diseminan a otras partes del cuerpo. Es posible que el cáncer comience en cualquier parte del cuerpo humano, formado por billones de células.', N'Cuando el tumor es pequeño y no ha penetrado la capa mucosa se dice que es un cáncer en etapa I. Los tumores en etapa II se hallan dentro de la pared muscular y la etapa III afecta los ganglios linfáticos cercanos. Los cánceres en etapa IV son raros y se han diseminado (metástasis) a órganos lejanos.', N'Macaquiri', 5)
INSERT [dbo].[Posteos] ([IdPosteo], [Titulo], [Subtitulo], [Descripcion], [Cuerpo], [IdUsuario], [IdForo]) VALUES (8, N'Los niños pequeños', N'Los tratos a estos tienen que ser cautelosos', N'El maltrato infantil, que se define como cualquier forma de abuso o desatención que afecte a un menor de 18 años, abarca todo tipo de maltrato físico o afectivo, abuso sexual, desatención, negligencia y explotación comercial o de otra índole que vaya o pueda ir en perjuicio de la salud, el desarrollo o la dignidad del niño', N'En caso de conocer un caso de maltrato infantil comunícate con el organismo local de ayuda social infantil o con el departamento de policía. las autoridades investigarán la denuncia y, si es necesario, tomarán las medidas adecuadas para garantizar la seguridad del niño. Ayuda al niño a permanecer seguro.', N'Macaquiri', 6)
SET IDENTITY_INSERT [dbo].[Posteos] OFF
GO
INSERT [dbo].[Usuario] ([IdUsuario], [Contraseña], [Correo], [Nombre], [Apellido], [Foto]) VALUES (N'Ivanfejo', N'IvnFejo', N'Ivanfejo@gmail.com', N'Ivan', N'Joaquin', N'https://campus.ort.edu.ar/static/archivos/usuarioperfil/79780')
INSERT [dbo].[Usuario] ([IdUsuario], [Contraseña], [Correo], [Nombre], [Apellido], [Foto]) VALUES (N'Macaquiri', N'adminadmin', N'admin@gmail.com', N'Marcos', N'Martinez', N'https://campus.ort.edu.ar/static/archivos/usuarioperfil/83429')
INSERT [dbo].[Usuario] ([IdUsuario], [Contraseña], [Correo], [Nombre], [Apellido], [Foto]) VALUES (N'Pala', N'TP07', N'TP07@gmail.com', N'Thiago', N'Palachi', N'https://campus.ort.edu.ar/static/archivos/usuarioperfil/83026')
GO
ALTER TABLE [dbo].[ComentarioPosteo]  WITH CHECK ADD  CONSTRAINT [FK_ComentarioPosteo_Posteos] FOREIGN KEY([IdPosteo])
REFERENCES [dbo].[Posteos] ([IdPosteo])
GO
ALTER TABLE [dbo].[ComentarioPosteo] CHECK CONSTRAINT [FK_ComentarioPosteo_Posteos]
GO
ALTER TABLE [dbo].[Foro]  WITH CHECK ADD  CONSTRAINT [FK_Foro_Categorias] FOREIGN KEY([IdCategoria])
REFERENCES [dbo].[Categorias] ([IdCategoria])
GO
ALTER TABLE [dbo].[Foro] CHECK CONSTRAINT [FK_Foro_Categorias]
GO
ALTER TABLE [dbo].[Perfiles]  WITH CHECK ADD  CONSTRAINT [FK_Perfiles_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([IdUsuario])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Perfiles] CHECK CONSTRAINT [FK_Perfiles_Usuario]
GO
ALTER TABLE [dbo].[Posteos]  WITH CHECK ADD  CONSTRAINT [FK_Posteos_Foro] FOREIGN KEY([IdForo])
REFERENCES [dbo].[Foro] ([IdForo])
GO
ALTER TABLE [dbo].[Posteos] CHECK CONSTRAINT [FK_Posteos_Foro]
GO
ALTER TABLE [dbo].[Posteos]  WITH CHECK ADD  CONSTRAINT [FK_Posteos_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([IdUsuario])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Posteos] CHECK CONSTRAINT [FK_Posteos_Usuario]
GO
/****** Object:  StoredProcedure [dbo].[EliminarComentario]    Script Date: 28/11/2023 09:35:59 ******/
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
/****** Object:  StoredProcedure [dbo].[EliminarForo]    Script Date: 28/11/2023 09:35:59 ******/
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
/****** Object:  StoredProcedure [dbo].[EliminarPosteo]    Script Date: 28/11/2023 09:35:59 ******/
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
/****** Object:  StoredProcedure [dbo].[EliminarUsuario]    Script Date: 28/11/2023 09:35:59 ******/
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
/****** Object:  StoredProcedure [dbo].[InsertarComentario]    Script Date: 28/11/2023 09:35:59 ******/
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
/****** Object:  StoredProcedure [dbo].[InsertarForo]    Script Date: 28/11/2023 09:35:59 ******/
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
/****** Object:  StoredProcedure [dbo].[InsertarPosteo]    Script Date: 28/11/2023 09:35:59 ******/
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
/****** Object:  StoredProcedure [dbo].[InsertarUsuario]    Script Date: 28/11/2023 09:35:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[InsertarUsuario] @IdUsuario varchar(50), @Contraseña varchar(50), @Correo varchar(50), @Nombre varchar(50), @Apellido varchar(50), @Foto varchar(400)
as
begin
INSERT INTO Usuario VALUES (@IdUsuario,@Contraseña,@Correo,@Nombre,@Apellido,@Foto)
INSERT INTO Perfiles VALUES ('','',SCOPE_IDENTITY())
end;
GO
/****** Object:  StoredProcedure [dbo].[MostrarComentariosPosteosASC]    Script Date: 28/11/2023 09:35:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[MostrarComentariosPosteosASC]
@idPosteo int,
@Cantidad int
as
begin
declare @masDiez int = @Cantidad + 10
Select * from ComentarioPosteos where IdPosteo = @idPosteo order by Fecha asc
end;
GO
/****** Object:  StoredProcedure [dbo].[MostrarComentariosPosteosDESC]    Script Date: 28/11/2023 09:35:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[MostrarComentariosPosteosDESC]
@idPosteo int,
@Cantidad int
as
begin
declare @masDiez int = @Cantidad + 10
Select * from ComentarioPosteos where IdPosteo = @idPosteo order by Fecha desc
end;
GO
/****** Object:  StoredProcedure [dbo].[MostrarForos]    Script Date: 28/11/2023 09:35:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[MostrarForos] @IdCategoria int, @Cantidad int
as
begin
declare @masDiez int = @Cantidad + 10
Select * from Foro where IdCategoria=@IdCategoria 
end
GO
/****** Object:  StoredProcedure [dbo].[MostrarForosPrincipal]    Script Date: 28/11/2023 09:35:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[MostrarForosPrincipal] @Cantidad int as
begin
declare @masDiez int = @Cantidad + 10
Select * from Foro  order by (Select Count(IdPosteo) from Posteos)
end
GO
/****** Object:  StoredProcedure [dbo].[MostrarPerfil]    Script Date: 28/11/2023 09:35:59 ******/
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
/****** Object:  StoredProcedure [dbo].[MostrarPosteos]    Script Date: 28/11/2023 09:35:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[MostrarPosteos] @IdForo int, @Cantidad int
as 
begin
declare @masDiez int = @Cantidad + 10
Select * from Posteos where IdForo=@IdForo 
end
GO
/****** Object:  StoredProcedure [dbo].[MostrarUsuario]    Script Date: 28/11/2023 09:35:59 ******/
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
/****** Object:  StoredProcedure [dbo].[UpdatearComentario]    Script Date: 28/11/2023 09:35:59 ******/
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
/****** Object:  StoredProcedure [dbo].[UpdatearUsuario]    Script Date: 28/11/2023 09:35:59 ******/
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
/****** Object:  StoredProcedure [dbo].[UsuarioExists]    Script Date: 28/11/2023 09:35:59 ******/
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

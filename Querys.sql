/*Traer informacion*/

Create Procedure TraerForo @idForo int as
begin
select * from Foro where IdForo = @idForo
end;

Create Procedure TraerPosteo @idPosteo int as
begin
select * from Posteos where IdPosteo = @idPosteo
end;

Create Procedure IniciarSesion @IdUsuario varchar(50), @Contraseña varchar(50)
as
begin
select * from Usuario where IdUsuario = @Idusuario and Contraseña = @Contraseña
end;

Create Procedure TraerTitulo @IdCategoria int
as
begin
select Nombre from Categorias where IdCategoria = @IdCategoria
end;

Alter Procedure MostrarUsuario @idPersona varchar(50)
as
begin 
Select * from Usuario where IdUsuario = @idPersona
end;

Alter Procedure MostrarPerfil @idPersona varchar(50)
as
begin 
Select * from Perfiles where IdUsuario = @idPersona
end;

Alter Procedure UsuarioExists @nombre varchar(50) as
begin
select idusuario from usuario where idusuario = @nombre
end

Alter Procedure MostrarForosPrincipal @Cantidad int as
begin
declare @masDiez int = @Cantidad + 10
Select * from Foro  order by (Select Count(IdPosteo) from Posteos)
end

Alter procedure MostrarForos @IdCategoria int, @Cantidad int
as
begin
declare @masDiez int = @Cantidad + 10
Select * from Foro where IdCategoria=@IdCategoria 
end

Alter procedure MostrarPosteos @IdForo int, @Cantidad int
as 
begin
declare @masDiez int = @Cantidad + 10
Select * from Posteos where IdForo=@IdForo 
end

Alter procedure MostrarComentariosPosteosASC
@idPosteo int,
@Cantidad int
as
begin
declare @masDiez int = @Cantidad + 10
Select * from ComentarioPosteos where IdPosteo = @idPosteo order by Fecha asc
end;

Alter procedure MostrarComentariosPosteosDESC
@idPosteo int,
@Cantidad int
as
begin
declare @masDiez int = @Cantidad + 10
Select * from ComentarioPosteos where IdPosteo = @idPosteo order by Fecha desc
end;

/*Insertar informacion*/

Alter procedure InsertarForo @idCategoria int,@Titulo varchar(50),@Descripcion varchar(400),@idUsuario varchar(50)
as 
begin
Insert into Foros values(@idCategoria,@Titulo,@Descripcion,@idUsuario)
end;

Alter procedure InsertarPosteo @Titulo varchar(200), @Subtitulo varchar(400), @Descripcion varchar(400), @Cuerpo varchar(5000), @IdUsuario varchar(50), @IdForo int
as
begin
INSERT INTO Posteos VALUES (@Titulo, @Subtitulo, @Descripcion, @Cuerpo, @IdUsuario, @IdForo)
end;

Alter procedure InsertarComentario @Cuerpo varchar(1000), @Fecha date, @IdUsuario varchar(50), @IdPosteo int
as
begin
INSERT INTO ComentarioPosteos VALUES (@Cuerpo, @fecha, @IdUsuario, @idposteo)
end;

Alter procedure InsertarUsuario @IdUsuario varchar(50), @Contraseña varchar(50), @Correo varchar(50), @Nombre varchar(50), @Apellido varchar(50), @Foto varchar(400)
as
begin
INSERT INTO Usuario VALUES (@IdUsuario,@Contraseña,@Correo,@Nombre,@Apellido,@Foto)
INSERT INTO Perfiles VALUES (NULL,NULL,@IdUsuario)
end;

/*Updatear informacion*/

Alter procedure UpdatearUsuario @IdUsuario varchar(50),@Contraseña varchar(50), @Correo varchar(50), @Nombre varchar(50), @Apellido varchar(50), @Foto varchar(400), @Descripcion varchar(300), @ImagenFondo varchar(400)
as
begin
update Usuario set Contraseña=@Contraseña, Correo=@Correo, Nombre=@Nombre,Apellido=@Apellido,Foto=@Foto where IdUsuario=@IdUsuario
update Perfiles set Descripcion=@Descripcion, ImagenFondo=@ImagenFondo where IdUsuario=@IdUsuario
end;

Alter procedure UpdatearComentario @IdUsuario varchar(50),@cuerpo varchar(1000), @IdComentario int
as
begin
update ComentarioPosteos set Cuerpo=@Cuerpo where IdUsuario=@IdUsuario and IdComentario=@IdComentario
end;

/*Eliminar informacion*/

Alter procedure EliminarForo @IdUsuario varchar(50),@IdForo int
as
begin
delete from Foros where IdUsuario=@IdUsuario and IdForo=@IdForo
end;

Alter procedure EliminarPosteo @IdUsuario varchar(50),@IdPosteo int
as
begin
delete from Posteos where IdUsuario=@IdUsuario and IdPosteo=@IdPosteo
end;

Alter procedure EliminarComentario @IdUsuario varchar(50),@IdComentario int
as
begin
delete from ComentarioPosteos where IdUsuario=@IdUsuario and IdComentario=@IdComentario
end;

Alter procedure EliminarUsuario @IdUsuario varchar(50)
as
begin
delete from Usuario where IdUsuario=@IdUsuario
end;
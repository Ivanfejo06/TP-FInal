/*Traer informacion*/

Create Procedure MostrarUsuario @idPersona varchar(50)
as
begin 
Select * from Usuario where IdUsuario = @idPersona
end;

Create Procedure MostrarPerfil @idPersona varchar(50)
as
begin 
Select * from Perfiles where IdUsuario = @idPersona
end;

Create procedure MostrarForos as 
begin 
Select top(10)* from Foros order by (select count(IdPosteo) from posteos where posteos.IdForo = Foros.IdForo)
end

Create procedure MostrarPosteos as 
begin 
Select top(10)* from Posteos order by (select count(IdComentario) from ComentarioPosteos where ComentarioPosteos.IdPosteo = Posteos.IdPosteo)
end

Create procedure MostrarComentariosPosteosASC
@idPosteo int
as
begin 
Select top(10)* from ComentarioPosteos where IdPosteo = @idPosteo order by Fecha asc
end;

Create procedure MostrarComentariosPosteosDESC
@idPosteo int
as
begin 
Select top(10)* from ComentarioPosteos where IdPosteo = @idPosteo order by Fecha desc
end;

/*Insertar informacion*/

Create procedure InsertarForo @idCategoria int,@Titulo varchar(50),@Descripcion varchar(400),@idUsuario varchar(50)
as 
begin
Insert into Foros values(@idCategoria,@Titulo,@Descripcion,@idUsuario)
end;

Create procedure InsertarPosteo @Titulo varchar(200), @Subtitulo varchar(400), @Descripcion varchar(400), @Cuerpo varchar(5000), @IdUsuario varchar(50), @IdForo int
as
begin
INSERT INTO Posteos VALUES (@Titulo, @Subtitulo, @Descripcion, @Cuerpo, @IdUsuario, @IdForo)
end;

Create procedure InsertarComentario @Cuerpo varchar(1000), @Fecha date, @IdUsuario varchar(50), @IdPosteo int
as
begin
INSERT INTO ComentarioPosteos VALUES (@Cuerpo, @fecha, @IdUsuario, @idposteo)
end;

Create procedure InsertarUsuario @IdUsuario varchar(50), @Contraseña varchar(50), @Correo varchar(50), @Nombre varchar(50), @Apellido varchar(50), @Foto varchar(400)
as
begin
INSERT INTO Usuario VALUES (@IdUsuario,@Contraseña,@Correo,@Nombre,@Apellido,@Foto)
INSERT INTO Perfiles VALUES ('','',SCOPE_IDENTITY())
end;

/*Updatear informacion*/

Create procedure UpdatearUsuario @IdUsuario varchar(50),@Contraseña varchar(50), @Correo varchar(50), @Nombre varchar(50), @Apellido varchar(50), @Foto varchar(400)
as
begin
update Usuario set Contraseña=@Contraseña, Correo=@Correo, Nombre=@Nombre,Apellido=@Apellido,Foto=@Foto where IdUsuario=@IdUsuario
end;

Create procedure UpdatearPerfil @IdUsuario varchar(50),@Descripcion varchar(300), @ImagenFondo varchar(400)
as
begin
update Perfiles set Descripcion=@Descripcion, ImagenFondo=@ImagenFondo where IdUsuario=@IdUsuario
end;

Create procedure UpdatearComentario @IdUsuario varchar(50),@cuerpo varchar(1000)
as
begin
update ComentarioPosteos set Cuerpo=@Cuerpo where IdUsuario=@IdUsuario
end;

/*Eliminar informacion*/

Create procedure EliminarForo @IdUsuario varchar(50),@IdForo int
as
begin
delete from Foros where IdUsuario=@IdUsuario and IdForo=@IdForo
end;

Create procedure EliminarPosteo @IdUsuario varchar(50),@IdPosteo int
as
begin
delete from Posteos where IdUsuario=@IdUsuario and IdPosteo=@IdPosteo
end;

Create procedure EliminarComentario @IdUsuario varchar(50),@IdComentario int
as
begin
delete from ComentarioPosteos where IdUsuario=@IdUsuario and IdComentario=@IdComentario
end;

Create procedure EliminarUsuario @IdUsuario varchar(50)
as
begin
delete from Usuario where IdUsuario=@IdUsuario
end;


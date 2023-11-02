Create Procedure TraerUsuario 
@idPersona int 
as
begin 
Select * from Usuario where IdUsuario = @idPersona
end;

Create Procedure TraerInfoPeril
@idPersona int 
as 
begin 
Select * from Perfiles where IdUsuario = @idPersona
end;


Create procedure MostrarPosteos as 
begin 
Select 
top(10) * from Posteos
end; 

/*
Create procedure MostrarForos as 
begin
Select  * from Foros Fetch First 10 rows only
end;
*/

Create procedure MostrarComentariosPosteos 
@idPosteo int
as
begin 
Select * from ComentarioPosteos where IdPosteo = @idPosteo
end;

Create procedure MostrarForos as 
begin 
Select  top(10)* from Foros
end


Create procedure InsertarForo 
@idCategoria int,
@Titulo varchar(50),
@Descripcion varchar(400)
as 
begin
Insert into Foros values(@idCategoria,@Titulo,@Descripcion)
end;

Create procedure InsertarPosteo as 
begin 

end;
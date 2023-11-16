using Dapper;
using System.Data.SqlClient;

public class BD
{
    private static string _connectionString{get;set;} = @"Server=localhost;DataBase=Aid Together;Trusted_Connection=True;";
    static public Usuario MostrarUsuario(string IdUsuario){
        string sql = "exec MostrarUsuario @idPersona";
        Usuario usuario;
        using(SqlConnection db = new SqlConnection(_connectionString)){
            usuario = db.QueryFirstOrDefault<Usuario>(sql, new{idPersona = IdUsuario});
        } 
        return usuario;
    }
    static public Perfiles MostrarPerfil(string IdUsuario){
        string sql = "exec MostrarPerfil @idPersona";
        Perfiles perfil;
        using(SqlConnection db = new SqlConnection(_connectionString)){
            perfil = db.QueryFirstOrDefault<Perfiles>(sql, new{idPersona = IdUsuario});
        } 
        return perfil;
    }

    static public Usuario UsuarioExists(string Nombre){
        string sql = "exec UsuarioExists @nombre";
        Usuario Usuario;
        using(SqlConnection db = new SqlConnection(_connectionString)){
            Usuario = db.QueryFirstOrDefault<Usuario>(sql, new{nombre = Nombre});
        }
        return Usuario;
    }

    static public List<Foros> MostrarForosPrincipal(int cantidad)
    {
        string sql = "Exec MostrarForosPrincipal @Cantidad";
        List<Foros> foros;
        using(SqlConnection db = new SqlConnection(_connectionString)){
           foros = db.Query<Foros>(sql, new {Cantidad = cantidad}).ToList();
        } 
        return foros;
    }


    static public List<Foros> MostrarForos(int IdCategoria, int cantidad){
        string sql = "exec MostrarForos @idCategoria @Cantidad";
        List<Foros> foros ;
        using(SqlConnection db = new SqlConnection(_connectionString)){
            foros = db.Query<Foros>(sql, new{idCategoria = IdCategoria, Cantidad=cantidad}).ToList();
        }
        return foros;
    }
    
    static public List<Posteos> MostrarPosteos(int IdForo, int cantidad){
        string sql = "exec MostrarPosteos @idForo @Cantidad";
        List<Posteos> posteos;
        using(SqlConnection db = new SqlConnection(_connectionString)){
            posteos = db.Query<Posteos>(sql, new{idForo = IdForo, Cantidad = cantidad}).ToList();
        }
        return posteos;
    }
    static public List<ComentarioPosteos> MostrarComentariosASC(int IdPosteo, int cantidad){
        string sql = "exec MostrarComentariosASC @idPosteo @Cantidad";
        List<ComentarioPosteos> comentarios;
        using(SqlConnection db = new SqlConnection(_connectionString)){
            comentarios = db.Query<ComentarioPosteos>(sql, new{idPosteo = IdPosteo, Cantidad = cantidad}).ToList();
        }
        return comentarios;
    }
    static public List<ComentarioPosteos> MostrarComentariosDESC(int IdPosteo, int cantidad){
        string sql = "exec MostrarComentariosDESC @idPosteo @Cantidad";
        List<ComentarioPosteos> comentarios;
        using(SqlConnection db = new SqlConnection(_connectionString)){
            comentarios = db.Query<ComentarioPosteos>(sql, new{idPosteo = IdPosteo, Cantidad = cantidad}).ToList();
        }
        return comentarios;
    }

    //Insertar Informacion
    
    static public void InsertarForo(int IdCategoria, string Titulo, string Descripcion, string IdUsuario){
        string sql = "exec InsertarForo @idCategoria, @titulo, @descripcion, @idUsuario";
        using(SqlConnection db = new SqlConnection(_connectionString)){
            db.Execute(sql, new {idCategoria = IdCategoria, titulo=Titulo, descripcion=Descripcion, idUsuario=IdUsuario});
        }
    }

    static public void InsertarPosteo(string Titulo, string Subtitulo, string Descripcion, string Cuerpo, string IdUsuario, int IdForo){
        string sql = "exec InsertarPosteo @titulo, @subtitulo, @descripcion, @cuerpo, @idUsuario, @idForo";
        using(SqlConnection db = new SqlConnection(_connectionString)){
            db.Execute(sql, new {titulo=Titulo, subtitulo=Subtitulo, descripcion=Descripcion, cuerpo=Cuerpo, idUsuario=IdUsuario, idForo=IdForo});
        }
    }

    static public void InsertarComentario(string Comentario, DateTime Fecha, string IdUsuario, int IdPosteo){
        string sql = "exec InsertarComentario @comentario, @fecha, @idUsuario, @idPosteo";
        using(SqlConnection db = new SqlConnection(_connectionString)){
            db.Execute(sql, new {comentario=Comentario, fecha=Fecha, idUsuario=IdUsuario, idPosteo=IdPosteo});
        }
    }

    static public void InsertarUsuario(string IdUsuario, string Contraseña, string Correo, string Nombre, string Apellido, string Foto){
        string sql = "exec InsertarUsuario @idUsuario, @contraseña, @correo, @nombre, @apellido, @foto";
        using(SqlConnection db = new SqlConnection(_connectionString)){
            db.Execute(sql, new {idUsuario=IdUsuario,contraseña=Contraseña,correo=Correo,nombre=Nombre,apellido=Apellido,foto=Foto});
        }
    }

    //Updatear Informacion

    static public void UpdatearUsuario(string IdUsuario, string Contraseña, string Correo, string Nombre, string Apellido, string Foto, string Descripcion, string ImagenFondo){
        string sql = "exec UpdatearUsuario @idUsuario, @contraseña, @correo, @nombre, @apellido, @foto, @descripcion, @imagenFondo";
        using(SqlConnection db = new SqlConnection(_connectionString)){
            db.Execute(sql, new{idUsuario=IdUsuario, contraseña=Contraseña, correo=Correo, nombre=Nombre, apellido=Apellido, foto=Foto, descripcion=Descripcion, imagenFondo=ImagenFondo});
        }
    }

    static public void UpdatearComentario(string IdUsuario, string Cuerpo, int IdComentario){
        string sql = "exec UpdatearComentario @idUsuario, @cuerpo, @idComentario";
        using(SqlConnection db = new SqlConnection(_connectionString)){
            db.Execute(sql, new{idUsuario=IdUsuario, cuerpo=Cuerpo,idComentario=IdComentario});
        }
    }

    //Delete Informacion

    static public void EliminarForo(string IdUsuario, int IdForo){
        string sql = "exec EliminarForo @idUsuario, @idForo";
        using(SqlConnection db = new SqlConnection(_connectionString)){
            db.Execute(sql, new{idUsuario=IdUsuario, idForo=IdForo});
        }
    }

    static public void EliminarPosteo(string IdUsuario, int IdPosteo){
        string sql = "exec EliminarPosteo @idUsuario, @idPosteo";
        using(SqlConnection db = new SqlConnection(_connectionString)){
            db.Execute(sql, new{idUsuario=IdUsuario, idPosteo=IdPosteo});
        }
    }

    static public void EliminarComentario(string IdUsuario, int IdComentario){
        string sql = "exec EliminarComentario @idUsuario, @idComentario";
        using(SqlConnection db = new SqlConnection(_connectionString)){
            db.Execute(sql, new{idUsuario=IdUsuario, idComentario=IdComentario});
        }
    }

    static public void EliminarUsuario(string IdUsuario){
        string sql = "exec EliminarUsuario @idUsuario";
        using(SqlConnection db = new SqlConnection(_connectionString)){
            db.Execute(sql, new{idUsuario=IdUsuario});
        }
    }
}
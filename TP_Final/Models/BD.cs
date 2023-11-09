public class BD
{
    private static string ConnectionString{get;set;}  = @"Server=localhost;DataBase=Aid Together;Trusted_Connection=True;";
    static public Usuarios MostrarUsuario(string IdUsuario){
        string sql = "exec MostrarUsuario @idPersona";
        Usuarios usuario;
        using(SqlConnection db = new SqlConnection(_connectionString)){
            usuario = db.QueryFirstOrDefault<Usuarios>(sql, new{idPersona = IdUsuario});
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
    static public list<Foros> MostrarForos(int IdCategoria){
        string sql = "exec MostrarForos @idCategoria";
        lsit<Foros> foros;
        using(SqlConnection db = new SqlConnection(_connectionString)){
            foros = db.Query<Foros>(sql, new{idCategoria = IdCategoria});
        }
        return foros;
    }
    static public list<Posteos> MostrarPosteos(int IdForo){
        string sql = "exec MostrarPosteos @idForo";
        lsit<Posteos> posteos;
        using(SqlConnection db = new SqlConnection(_connectionString)){
            posteos = db.Query<Posteos>(sql, new{idForo = IdForo});
        }
        return posteos;
    }
    static public list<ComentarioPosteos> MostrarComentariosASC(int IdPosteo){
        string sql = "exec MostrarComentariosASC @idPosteo";
        lsit<ComentarioPosteo> comentarios;
        using(SqlConnection db = new SqlConnection(_connectionString)){
            comentarios = db.Query<ComentarioPosteos>(sql, new{idPosteo = IdPosteo});
        }
        return comentarios;
    }
    static public list<ComentarioPosteos> MostrarComentariosDESC(int IdPosteo){
        string sql = "exec MostrarComentariosDESC @idPosteo";
        lsit<ComentarioPosteo> comentarios;
        using(SqlConnection db = new SqlConnection(_connectionString)){
            comentarios = db.Query<ComentarioPosteos>(sql, new{idPosteo = IdPosteo});
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

    static public void InsertarPosteo(string titulo, string Subtitulo, string Descripcion, string Cuerpo, string IdUsuario, int IdForo){
        string sql = "exec InsertarPosteo @titulo, @subtitulo, @descripcion, @cuerpo, @idUsuario, @idForo";
        using(SqlConnection db = new SqlConnection(_connectionString)){
            db.Execute(sql, new {titulo=Titulo, subtitulo=Subtitulo, descripcion=Descripcion, cuerpo=Cuerpo, idUsuario=IdUsuario, idForo=IdForo});
        }
    }

    static public void InsertarComentario(string Comentario, date Fecha, string IdUsuario, int IdPosteo){
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

    static public void UpdatearUsuario(string IdUsuario, string Contraseña, string Correo, string Nombre, string Apellido, string Foto){
        string sql = "exec UpdatearUsuario @idUsuario, @contraseña, @correo, @nombre, @apellido, @foto";
        using(SqlConnection db = new SqlConnection(_connectionString)){
            db.Execute(sql, new{idUsuario=IdUsuario, contraseña=Contraseña, correo=Correo, nombre=Nombre, apellido=Apellido, foto=Foto});
        }
    }

    static public void UpdatearPerfil(string IdUsuario, string Descripcion, string ImagenFondo){
        string sql = "exec UpdatearPerfil @idUsuario, @descripcion, @imagenFondo";
        using(SqlConnection db = new SqlConnection(_connectionString)){
            db.Execute(sql, new{idUsuario=IdUsuario, descripcion=Descripcion, imagenFondo=ImagenFondo});
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
            db.Execute(sql, new{idUsuario=IdUsuario, foro=Foro});
        }
    }

    static public void EliminarPosteo(string IdUsuario, int IdPosteo){
        string sql = "exec EliminarPosteo @idUsuario, @idPosteo";
        using(SqlConnection db = new SqlConnection(_connectionString)){
            db.Execute(sql, new{idUsuario=IdUsuario, idPosteo=IdPosteo});
        }
    }

    static public void EliminarComentario(string IdUsuario, int IdComentario){
        string sql = "exec EliminarComentario @idUsuario, @cuerpo, @idComentario";
        using(SqlConnection db = new SqlConnection(_connectionString)){
            db.Execute(sql, new{idUsuario=IdUsuario, cuerpo=Cuerpo,idComentario=IdComentario});
        }
    }

    static public void EliminarUsuario(string IdUsuario){
        string sql = "exec EliminarUsuario @idUsuario";
        using(SqlConnection db = new SqlConnection(_connectionString)){
            db.Execute(sql, new{idUsuario=IdUsuario});
        }
    }
}

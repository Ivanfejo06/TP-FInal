public class BD
{
    //Traer Informacion

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

    //NOT FINISHED
    static public void InsertarPosteo(string titulo, string Subtitulo, string descripcion, string Cuerpo, string IdUsuario){
        string sql = "exec InsertarPosteo @idCategoria, @titulo, @descripcion, @idUsuario";
        using(SqlConnection db = new SqlConnection(_connectionString)){
            db.Execute(sql, new {idCategoria = IdCategoria, titulo=Titulo, descripcion=Descripcion, idUsuario=IdUsuario});
        }
    }
}
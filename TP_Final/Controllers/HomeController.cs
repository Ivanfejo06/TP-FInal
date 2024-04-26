using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using TP_Final.Models;
using System.Globalization;

namespace TP_Final.Controllers;

public class HomeController : Controller
{
    public static Usuario Logged;
    private readonly ILogger<HomeController> _logger;

    public HomeController(ILogger<HomeController> logger)
    {
        _logger = logger;
    }


    //Mostrar informacion
    public IActionResult Index()
    {        
        ViewBag.Posteo = BD.TraerPosteo(2);
        ViewBag.Comentario = BD.TraerComentario(8);
        ViewBag.Usuario = Logged;
        return View();  
    }

    public IActionResult Home()
    {        
        ViewBag.Usuario = Logged;
        ViewBag.ListarForos = BD.MostrarForosPrincipal(9);
        return View();  
    }

    public IActionResult InicioSesion()
    {
        ViewBag.Error = "";
        return View("InicioSesion");
    }

     public IActionResult VerificarLogin(string IdUsuario, string Contraseña)
    {
        if (BD.IniciarSesion(IdUsuario,Contraseña) != null)
        {
            Usuario user = BD.IniciarSesion(IdUsuario,Contraseña);
            Logged = user;
            return RedirectToAction("Home");
        }
        else
        {
            ViewBag.Error = "Datos de inicio de sesion incorrectos.";
            return View("InicioSesion");
        }
    }

    public IActionResult Foro(int idForo)
    {
        int Cantidad = 9;
        ViewBag.Foro = BD.TraerForo(idForo);
        ViewBag.Usuario = Logged;
        ViewBag.ListPosteos = BD.MostrarPosteos(idForo, Cantidad);
        return View ("Foro");
    }

    public IActionResult Creditos(){
        ViewBag.Pala = BD.UserUsuario("Ivanfejo");
        ViewBag.Ivo = BD.UserUsuario("Pala");
        ViewBag.Marcos = BD.UserUsuario("Macaquiri");
        return View ("Creditos");
    }

    public IActionResult Posteo(int idPosteo)
    {
        int Cantidad = 9;
        ViewBag.Usuario = Logged;
        ViewBag.Posteo = BD.TraerPosteo(idPosteo);
        ViewBag.ListComentarios = BD.MostrarComentariosASC(idPosteo, Cantidad);
        return View ("Posteo");
    }
    

    public IActionResult Categoria (int idCategoria)
    {
        int Cantidad = 10;
        ViewBag.Usuario = Logged;
        ViewBag.Titulo = BD.TraerTitulo(idCategoria);
        ViewBag.Categoria = idCategoria;
        ViewBag.ListForosXcategoria = BD.MostrarForos(idCategoria, Cantidad);
        return View("Categoria"); 
    }

    public IActionResult Registrarse()
    {
        ViewBag.Error = "";
        return View("Registro");
    }

    public IActionResult CrearPosteo(int Id)
    {
        ViewBag.Foro = BD.TraerForo(Id);
        ViewBag.Usuario = Logged;
        return View("CrearPosteo");
    }

    public IActionResult CrearForo(int Id)
    {
        ViewBag.IdCategoria = BD.TraerTitulo(Id);
        ViewBag.Usuario = Logged;
        return View("CrearForo");
    }

    public IActionResult MostrarPerfil(string IdUsuario)
    {
        ViewBag.InfoPerfil = BD.MostrarPerfil(IdUsuario);
        ViewBag.Perfil = BD.UserUsuario(IdUsuario);
        ViewBag.Usuario = Logged;
        return View("Perfil");
    }

    public IActionResult MostrarConfiguracion (string IdUsuario)
    {
        ViewBag.Usuario = BD.MostrarPerfil(IdUsuario);
        ViewBag.Usuario = Logged;
        return View("Configuracion");
    }

    public IActionResult UpdateDataUsuario(Usuario Us)
    {
        ViewBag.Usuario = Us;
        return View("UpdatearDatos");
    }

    //inserts

    public IActionResult CargarUsuario(string IdUsuario,string Contraseña,string Correo,string Nombre,string Apellido,string Foto)
    {
        if (IdUsuario.Length <= 50 && Contraseña.Length <= 50 && Correo.Length <= 50 && Nombre.Length <= 50 && Apellido.Length <= 50)
        {
            BD.InsertarUsuario(IdUsuario,Contraseña,Correo,Nombre,Apellido,Foto);
            Usuario user = BD.IniciarSesion(IdUsuario,Contraseña);
            Logged = user;
            return RedirectToAction("Home");
        }
        else
        {
            ViewBag.Error = "Datos de registro incorrectos";
            return View("Registro");
        }
    }

    public IActionResult InsertComentario (string Comentario,string IdUsuario,int IdPosteo)
    {
        DateTime fecha = DateTime.Now;
        BD.InsertarComentario(Comentario,fecha,IdUsuario,IdPosteo);
        return RedirectToAction("Posteo",new{idPosteo=IdPosteo});
    }

    public IActionResult InsertPosteo(string Titulo,string Subtitulo,string Descripcion,string Cuerpo, string IdUsuario, int IdForo)
    {
        BD.InsertarPosteo(Titulo,Subtitulo,Descripcion,Cuerpo,IdUsuario,IdForo);
        return RedirectToAction ("Foro", new{idForo = IdForo});
    }

    public IActionResult InsertForo (int IdCategoria, string Titulo, string Descripcion, string IdUsuario)
    {
        BD.InsertarForo(IdCategoria,Titulo,Descripcion,IdUsuario);
        return RedirectToAction ("Categoria",new{idCategoria = IdCategoria});
    }

    //Update

        public IActionResult UpdatearUsuario(string IdUsuario,string Contraseña,string Correo,string Nombre,string Apellido,string Foto,string Descripcion,string ImagenFondo)
        {
            BD.UpdatearUsuario(IdUsuario,Contraseña,Correo,Nombre,Apellido,Foto,Descripcion,ImagenFondo);
            return RedirectToAction ("MostrarConfiguracion");
        }

        public IActionResult UpdatearComentario(string IdUsuario,string Cuerpo,int IdComentario)
        {
            BD.UpdatearComentario(IdUsuario,Cuerpo,IdComentario);
            return RedirectToAction ("Posteos");
        }

    //deletes

        public IActionResult EliminarForo(string IdUsuario, int IdForo, int IdCategoria)
        {
            BD.EliminarForo(IdUsuario,IdForo);
            return RedirectToAction ("Categoria",new{idCategoria = IdCategoria});
        }

        public IActionResult EliminarComentario (string IdUsuario, int IdComentario, int IdPosteo)
        {
            BD.EliminarComentario(IdUsuario,IdComentario);
            return RedirectToAction ("Posteo",new{idPosteo = IdPosteo});
        }

        public IActionResult EliminarUsuario (string IdUsuario)
        {
            BD.EliminarUsuario(IdUsuario);
            return RedirectToAction ("Home");
        }

        public IActionResult EliminarPosteo (string IdUsuario, int IdPosteo, int IdForo)
        {
            BD.EliminarPosteo(IdUsuario,IdPosteo);
            return RedirectToAction("Foro",new{idForo = IdForo});
        }


    public string UsuarioExists(string IdUsuario)
    {
        return BD.UsuarioExists(IdUsuario);
    }

    public IActionResult Logout()
    {
        Logged = null;
        return RedirectToAction("Hom");
    }


    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
}

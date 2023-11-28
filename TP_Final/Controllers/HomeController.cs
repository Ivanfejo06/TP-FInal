using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using TP_Final.Models;

namespace TP_Final.Controllers;

public class HomeController : Controller
{
    private readonly ILogger<HomeController> _logger;

    public HomeController(ILogger<HomeController> logger)
    {
        _logger = logger;
    }


//Mostrar informacion

    public IActionResult Index(int cantidad,Usuario S)
    {        
        ViewBag.User = S;
        ViewBag.Validation = false;
        if(ViewBag.User.Nombre != null)
        {
            ViewBag.Validation = true; 
        }
        ViewBag.ListarForos = BD.MostrarForosPrincipal(cantidad);
        return View();  
    }

    public IActionResult TraerUsuario(string IdUsuario, string Contraseña)
    {
        ViewBag.Usuario = BD.IniciarSesion(IdUsuario,Contraseña);
        return View("index");
    }

    public IActionResult Posteos(int idForo)
    {
        int Cantidad = 9;
        ViewBag.Foro = BD.TraerForo(idForo);
        ViewBag.ListPosteos = BD.MostrarPosteos(idForo, Cantidad);
        return View ("Posteo");
    }
    

    public IActionResult Categorias (int idCategoria)
    {
        int Cantidad = 10;
        ViewBag.Titulo = BD.TraerTitulo(idCategoria);
        ViewBag.ListForosXcategoria = BD.MostrarForos(idCategoria, Cantidad);
        return View("Categorias"); 
    }
      
    public IActionResult InicioSesion ()
    {
        return View("InicioSesion");
    }

    public IActionResult Registrarse()
    {
        return View("Registro");
    }

    public IActionResult CrearPosteo(int Id, string IdU)
    {
        ViewBag.IdForo = Id;
        ViewBag.IdUsuario = IdU;
        return View("CrearPosteo");
    }

    public IActionResult CrearForo(int Id, string IdU)
    {
        ViewBag.IdCategoria = Id;
        ViewBag.IdUsuario = IdU;
        return View("CrearForo");
    }

    public IActionResult MostrarPerfil(string IdUsuario)
    {
        ViewBag.InfoPerfil = BD.MostrarPerfil(IdUsuario);
        return View("Perfil");
    }

    public IActionResult MostrarConfiguracion (string IdUsuario)
    {
        ViewBag.Usuario = BD.MostrarPerfil(IdUsuario);
        return View("Configuracion");
    }

    public IActionResult UpdateDataUsuario(Usuario Us)
    {
        ViewBag.Usuario = Us;
        return View("UpdatearDatos");
    }

    public IActionResult IniciarSesion ( string IdUsuario, string Contraseña)
    {
        ViewBag.Usuario= BD.IniciarSesion(IdUsuario,Contraseña);
        return View("Index");
    }

    //inserts
  public IActionResult CargarUsuario(string IdUsuario,string Contraseña,string Correo,string Nombre,string Apellido,string Foto)
    {
        BD.InsertarUsuario(IdUsuario,Contraseña,Correo,Nombre,Apellido,Foto);
        return RedirectToAction ("InicioSesion");
    }

    public IActionResult InsertComentario (string Comentario,DateTime fecha,string IdUsuario,int IdPosteo)
    {
            BD.InsertarComentario(Comentario,fecha,IdUsuario,IdPosteo);
            return RedirectToAction("Posteos");
    }

    public IActionResult InsertPosteo(string Titulo,string Subtitulo,string Descripcion,string Cuerpo, string IdUsuario, int IdForo)
    {
        BD.InsertarPosteo(Titulo,Subtitulo,Descripcion,Cuerpo,IdUsuario,IdForo);
       return RedirectToAction ("Posteos");
    }

    public IActionResult InsertForo (int idCategoria,string Titulo,string Descripcion,string IdUsuario)
    {
            BD.InsertarForo(idCategoria,Titulo,Descripcion,IdUsuario);
            return RedirectToAction ("Categorias");
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

        public IActionResult EliminarForo(string IdUsuario,int IdForo)
        {
            BD.EliminarForo(IdUsuario,IdForo);
            return RedirectToAction ("Foros");
        }

        public IActionResult EliminarComentario (string IdUsuario,int IdComentario)
        {
            BD.EliminarComentario(IdUsuario,IdComentario);
            return RedirectToAction ("Posteos");
        }

        public IActionResult EliminarUsuario (string IdUsuario)
        {
            BD.EliminarUsuario(IdUsuario);
            return RedirectToAction ("Index");
        }


    public string UsuarioExists(string IdUsuario)
    {
        return BD.UsuarioExists(IdUsuario);
    }


    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
}

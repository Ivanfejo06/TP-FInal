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
    public IActionResult Index()
    {
    
        ViewBag.ListarForos = BD.MostrarForosPrincipal();

        return View();
    }

    public IActionResult Posteos(int idForo)
    {
        ViewBag.ListPosteos = BD.MostrarPosteos(idForo);
        return View ("Posteos");
    }

    public IActionResult Categorias (int idForo)
    {
        ViewBag.ListForosXcategoria = BD.MostrarForos(idForo);
        return View("Categoria");
    }

    public IActionResult InicioSesion ()
    {
        return View("InicioSesion");
    }

    public IActionResult MostrarPerfil(string IdUsuario)
    {
        ViewBag.InfoPerfil = BD.MostrarPerfil(IdUsuario);
        return ("Perfil");
    }

    public IActionResult MostrarConfiguracion (string IdUsuario)
    {
        ViewBag.Usuario = BD.MostrarPerfil(IdUsuario);
        return View("Configuracion");
    }

    //inserts

  public IActionResult CargarUsuario(string IdUsuario,string Contraseña,string Correo,string Nombre,string Apellido,string Foto,string Descripcion,string ImagenFondo)
    {
        BD.InsertarUsuario(IdUsuario,Contraseña,Correo,Nombre,Apellido,Foto,Descripcion,ImagenFondo);
        return RedirectToAction ("InicioSesion");
    }

    public IActionResult InsertComentario (string Comentario,date fecha,string IdUsuario,int IdPosteo)
    {
            BD.InsertarComentario(Comentario,fecha,IdUsuario,IdPosteo);
            return RedirectToAction("Posteos");
    }

    public IActionResult InsertPosteo(string Titulo,string Subtitulo,string Descripcion,string Cuerpo,int IdForo)
    {
        BD.InsertarPosteo(Titulo,Subtitulo,Descripcion,Cuerpo,IdForo);
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

        public IActionResult EliminarComentario (string IdUsuario,int idComentario)
        {
            BD.EliminarComentario(IdUsuario,IdComentario);
            return RedirectToAction ("Posteos");
        }

        public IActionResult EliminarUsuario (string IdUsuario)
        {
            BD. EliminarUsuario(IdUsuario);
            return RedirectToAction ("Index");
        }




    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
}

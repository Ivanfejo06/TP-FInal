using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using TP_Final.Models;
using System.Globalization;

namespace TP_Final.Controllers;

public class HomeController : Controller
{
    private readonly ILogger<HomeController> _logger;

    public HomeController(ILogger<HomeController> logger)
    {
        _logger = logger;
    }


//Mostrar informacion

    public IActionResult Index(Usuario S)
    {        
        ViewBag.User = BD.UserUsuario("adm");
        ViewBag.Validation = false;
        if(ViewBag.User.Nombre != null)
        {
            ViewBag.Validation = true; 
            ViewBag.ErrorMessage = "";
        }
        else{
            ViewBag.ErrorMessage = "No se pudo inciar sesion";
        }
        ViewBag.ListarForos = BD.MostrarForosPrincipal(9);
        return View();  
    }

    public IActionResult TraerUsuario(string IdUsuario, string Contraseña)
    {
        ViewBag.Usuario = BD.IniciarSesion(IdUsuario,Contraseña);
        ViewBag.User = BD.UserUsuario("adm");
        return View ("index");
    }

    public IActionResult Foro(int idForo)
    {
        ViewBag.User = BD.UserUsuario("adm");
        int Cantidad = 9;
        ViewBag.Usuario = User;
        ViewBag.Foro = BD.TraerForo(idForo);
        ViewBag.ListPosteos = BD.MostrarPosteos(idForo, Cantidad);
        return View ("Foro");
    }

    public IActionResult Posteo(int idPosteo)
    {
        ViewBag.User = BD.UserUsuario("adm");
        int Cantidad = 9;
        ViewBag.Usuario = User;
        ViewBag.Posteo = BD.TraerPosteo(idPosteo);
        ViewBag.ListComentarios = BD.MostrarComentariosASC(idPosteo, Cantidad);
        return View ("Posteo");
    }
    

    public IActionResult Categoria (int idCategoria, Usuario User)
    {
        ViewBag.User = BD.UserUsuario("adm");
        int Cantidad = 10;
        ViewBag.Usuario = User;
        ViewBag.Titulo = BD.TraerTitulo(idCategoria);
        ViewBag.ListForosXcategoria = BD.MostrarForos(idCategoria, Cantidad);
        return View("Categoria"); 
    }
      
    public IActionResult InicioSesion ()
    {
        return View("InicioSesion");
    }

    public IActionResult Registrarse()
    {
        return View("Registro");
    }

    public IActionResult CrearPosteo(int Id)
    {
        ViewBag.IdForo = Id;
        ViewBag.User = BD.UserUsuario("adm");
        return View("CrearPosteo");
    }

    public IActionResult CrearForo(int Id)
    {
        //ViewBag.Usuario.IdUsuario name="IdUsuario";
        ViewBag.User = BD.UserUsuario("adm");
        ViewBag.IdCategoria = BD.TraerTitulo(Id);
        return View("CrearForo");
    }

    public IActionResult MostrarPerfil(string IdUsuario)
    {
        ViewBag.User = BD.UserUsuario("adm");
        ViewBag.InfoPerfil = BD.MostrarPerfil(IdUsuario);
        return View("Perfil");
    }

    public IActionResult MostrarConfiguracion (string IdUsuario)
    {
        ViewBag.User = BD.UserUsuario("adm");
        ViewBag.Usuario = BD.MostrarPerfil(IdUsuario);
        return View("Configuracion");
    }

    public IActionResult UpdateDataUsuario(Usuario Us)
    {
        ViewBag.User = BD.UserUsuario("adm");
        ViewBag.Usuario = Us;
        return View("UpdatearDatos");
    }

    public IActionResult IniciarSesion ( string IdUsuario, string Contraseña)
    {
        ViewBag.User = BD.UserUsuario("adm");
        ViewBag.Usuario= BD.IniciarSesion(IdUsuario,Contraseña);
        return View("Index");
    }

    //inserts
  public IActionResult CargarUsuario(string IdUsuario,string Contraseña,string Correo,string Nombre,string Apellido,string Foto)
    {
        BD.InsertarUsuario(IdUsuario,Contraseña,Correo,Nombre,Apellido,Foto);
        return RedirectToAction ("InicioSesion");
    }

    public IActionResult InsertComentario (string Comentario,string IdUsuario,int IdPosteo)
    {
        ViewBag.User = BD.UserUsuario("adm");
        DateTime fecha = DateTime.Now;
        BD.InsertarComentario(Comentario,fecha,IdUsuario,IdPosteo);
        return RedirectToAction("Posteo",new{idPosteo=IdPosteo});
    }

    public IActionResult InsertPosteo(string Titulo,string Subtitulo,string Descripcion,string Cuerpo, string IdUsuario, int IdForo)
    {
        ViewBag.User = BD.UserUsuario("adm");
        BD.InsertarPosteo(Titulo,Subtitulo,Descripcion,Cuerpo,IdUsuario,IdForo);
        return RedirectToAction ("Foro", new{idForo = IdForo});
    }

    public IActionResult InsertForo (int IdCategoria, string Titulo, string Descripcion, string IdUsuario)
    {
        ViewBag.User = BD.UserUsuario("adm");
        BD.InsertarForo(IdCategoria,Titulo,Descripcion,IdUsuario);
        return RedirectToAction ("Categoria",new{idCategoria = IdCategoria});
    }

    //Update

        public IActionResult UpdatearUsuario(string IdUsuario,string Contraseña,string Correo,string Nombre,string Apellido,string Foto,string Descripcion,string ImagenFondo)
        {
            ViewBag.User = BD.UserUsuario("adm");
            BD.UpdatearUsuario(IdUsuario,Contraseña,Correo,Nombre,Apellido,Foto,Descripcion,ImagenFondo);
            return RedirectToAction ("MostrarConfiguracion");
        }

        public IActionResult UpdatearComentario(string IdUsuario,string Cuerpo,int IdComentario)
        {
            ViewBag.User = BD.UserUsuario("adm");
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
        ViewBag.User = BD.UserUsuario("adm");
        return BD.UsuarioExists(IdUsuario);
    }


    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
}

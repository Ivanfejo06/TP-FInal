using System.Diagnostics;
using System.Text;
using Microsoft.AspNetCore.Mvc;

namespace test_session.Controllers;

public class AuthController : Controller
{
    private readonly ILogger<AuthController> _logger;

    public AuthController(ILogger<AuthController> logger)
    {
        _logger = logger;
    }

    public IActionResult InicioSesion()
    {
        if (HttpContext.Session.GetString("user") != null)
        {
            return RedirectToAction("Index", "Home");
        }
        return View("InicioSesion");
    }

    [HttpPost]
    public IActionResult VerificarLogin(string IdUsuario, string Contraseña, string Correo, string Nombre, string Apellido, string Foto)
    {
        if (IniciarSesion(IdUsuario,Contraseña) != null)
        {
            HttpContext.Session.SetString("user", new Usuario(email, password).ToString());
            return RedirectToAction("Index", "Home");
        }
        else
        {
            ViewBag.Error = "Datos de inicio de sesion incorrectos.";
            return View("InicioSesion");
        }
    }

    public IActionResult Logout()
    {
        HttpContext.Session.Remove("user");
        return RedirectToAction("Login");
    }

}

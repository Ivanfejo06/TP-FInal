using System.Text.Json;

[Serializable]
public class Usuario
{
    public string IdUsuario { get; set; } 
    public string Contraseña { get; set; }
    public string Correo { get; set; }
    public string Nombre { get; set; }
    public string Apellido { get; set; }
    public string Foto { get; set; }

    public override string ToString()
    {
        return JsonSerializer.Serialize(this);
    }

    public static Usuario FromString(string json)
    {
        if (json is null)
        {
            return null;
        }

        return JsonSerializer.Deserialize<Usuario>(json);
    }
}

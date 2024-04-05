using System.Text.Json;

[Serializable]
public class Usuario(string idUsuario, string contraseña, string correo, string nombre, string apellido, string foto)
{
    public string? IdUsuario { get; set; } = idUsuario;
    public string? Contraseña { get; set; } = contraseña;
    public string? Correo { get; set; } = correo;
    public string? Nombre { get; set; } = nombre;
    public string? Apellido { get; set; } = apellido;
    public string? Foto { get; set; } = foto;

    public override string ToString()
    {
        return JsonSerializer.Serialize(this);
    }

    public static Usuario? FromString(string? json)
    {
        if (json is null)
        {
            return null;
        }

        return JsonSerializer.Deserialize<Usuario>(json);
    }
}

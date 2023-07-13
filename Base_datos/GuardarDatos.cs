using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Base_datos
{
    public class GuardarDatos
    {
        public void SaveToBaseDatos(string nombre, string apellido, string sexo, string email, string direc, string ciudad, string req)
        {
            string conexion = "Data Source=(localdb)\\ProjectModels;Initial Catalog=BDWebAplication1;Integrated Security=True;";
            string consulta = "INSERT INTO dbo.DataAlumnos (Nombre, Apellidos, Email, Sexo, Direccion, Ciudad, Requerimiento)" + "VALUES (@Nombre, @Apellidos, @Email, @Sexo, @Direccion, @Ciudad, @Requerimiento)";
            using (SqlConnection connection = new SqlConnection(conexion))
            {
                SqlCommand command = new SqlCommand(consulta, connection);
                command.Parameters.AddWithValue("@Nombre", nombre);
                command.Parameters.AddWithValue("@Apellidos", apellido);
                command.Parameters.AddWithValue("@Email", email);
                command.Parameters.AddWithValue("@Sexo", sexo);
                command.Parameters.AddWithValue("@Direccion", direc);
                command.Parameters.AddWithValue("@Ciudad", ciudad);
                command.Parameters.AddWithValue("@Requerimiento", req);
                connection.Open();
                command.ExecuteNonQuery();
            }
        }
    }
}

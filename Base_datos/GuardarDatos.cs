using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Windows.Input;
using System.Runtime.Remoting.Messaging;



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

        public bool VerificarRegistro(string nombre, string apellido)
        {
            bool noexiste = false;
            string conexion = "Data Source=(localdb)\\ProjectModels;Initial Catalog=BDWebAplication1;Integrated Security=True;";
            using (SqlConnection connection = new SqlConnection(conexion))
            {
                try
                {
                    connection.Open();
                    string consulta = "SELECT COUNT(*) FROM dbo.DataAlumnos WHERE Nombre = @Nombre AND Apellidos = @Apellidos";
                    using (SqlCommand command = new SqlCommand(consulta, connection))
                    {
                        command.Parameters.AddWithValue("@Nombre", nombre);
                        command.Parameters.AddWithValue("@Apellidos", apellido);
                        int count = Convert.ToInt32(command.ExecuteScalar());
                        if (count > 0)
                        {
                            noexiste = true;
                            return noexiste;
                        }
                    }
                    return noexiste;
                }
                catch (Exception ex)
                {
                    Console.WriteLine("Error en la consulta: " + ex.Message);
                    return false;
                }
            }
        }
    }
}


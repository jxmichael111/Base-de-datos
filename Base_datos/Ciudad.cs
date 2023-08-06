using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Collections;

namespace Base_datos
{
    public class Ciudad
    {
        public IList<String> getCiudades()
        {
            List<String> ciudades = new List<String>();
            string conexion = "Data Source=(localdb)\\ProjectModels;Initial Catalog=BDWebAplication1;Integrated Security=True;";
            string consulta = "SELECT Ciudad FROM DataCiudad";

            using (SqlConnection connection = new SqlConnection(conexion))
            {
                SqlCommand comando = new SqlCommand(consulta, connection);
                connection.Open();

                SqlDataReader reader = comando.ExecuteReader();

                while (reader.Read())
                {
                    ciudades.Add(reader.GetString(0));
                }

                reader.Close();
            }
            return ciudades;
        }
    }
}
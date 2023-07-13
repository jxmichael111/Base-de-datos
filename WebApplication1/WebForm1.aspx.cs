using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication1.ServiceReference1;
using WebApplication1.ServiceReference2;

namespace WebApplication1
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            AddDropDownCiudadesItems();
        }
        private string[] readFile()
        {
            string[] lines = File.ReadAllLines("D:\\solo michael\\semestre 3\\DBP\\DBP LAB\\DBP LAB\\regiones.txt");

            return lines;

        }
        private string[] serviceCall()
        {
            Service1Client client = new Service1Client();
            String[] ciudades = client.getCiudades();

            return ciudades;
        }
        protected void AddDropDownCiudadesItems()
        {
            //String[] ciudades = readFile();
            String[] ciudades = serviceCall();
            DropDownListCiudad.Items.Add("Seleccion una opcion");

            for (int i = 0; i < ciudades.Length; i++)
            {
                string s = ciudades[i];
                DropDownListCiudad.Items.Add(s);
            }
        }

        protected void ButtonEnviar_Click(object sender, EventArgs e)
        {
            string nombres = nombre.Text;
            string apellidos = apellido.Text;
            string sexo = radioButtonM.Checked ? "Masculino" : "Femenino"; ;
            string email = correo.Text;
            string address = direccion.Text;
            string ciudad = DropDownListCiudad.SelectedValue;
            string requerimientos = descripcion.Text;


            StringBuilder datosRegistrados = new StringBuilder();
            datosRegistrados.AppendLine($"{nombres}");
            datosRegistrados.AppendLine($"{apellidos}");
            datosRegistrados.AppendLine($"{sexo}");
            datosRegistrados.AppendLine($"{email}");
            datosRegistrados.AppendLine($"{address}");
            datosRegistrados.AppendLine($"{ciudad}");
            datosRegistrados.AppendLine($"{requerimientos}");


            Service2Client client = new Service2Client();
            client.SaveTextToFile(nombres, apellidos, sexo, email, address, ciudad, requerimientos);

            DatosRegistrados.Text = datosRegistrados.ToString();
            server.Visible = true;
            DatosRegistrados.Visible = true;

            nombre.Text = string.Empty;
            apellido.Text = string.Empty;
            radioButtonM.Checked = false;
            radioButtonF.Checked = false;
            correo.Text = string.Empty;
            direccion.Text = string.Empty;
            DropDownListCiudad.Text = "Seleccion una opcion";
            descripcion.Text = string.Empty;
        }
    }
}
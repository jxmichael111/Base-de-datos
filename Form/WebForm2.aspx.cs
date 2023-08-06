using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.IO;
using System.Web.Services;
using System.Web.UI;
using Form.ServiceReference1;
using Form.ServiceReference2;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace Form
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            AddDropDownCiudadesItems();
        }
        /*
        private string[] readFile()
        {
            string[] lines = File.ReadAllLines("D:\\solo michael\\semestre 3\\DBP\\DBP LAB\\DBP LAB\\regiones.txt");

            return lines;

        }
        */
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
        private void AddSesion(string nombre, string apellido, string sexo, string email, string dir, string ciudad, string reque)
        {
            Session["Nombre"] = nombre;
            Session["Apellido"] = apellido;
            Session["Sexo"] = sexo;
            Session["Email"] = email;
            Session["Direccion"] = dir;
            Session["Ciudad"] = ciudad;
            Session["Requerimientos"] = reque;
        }
        private void AddCookie(string nombre, string apellido, string sexo, string email, string dir, string ciudad, string reque)
        {
            HttpCookie cookie1 = new HttpCookie("Nombres", nombre);
            Response.Cookies.Add(cookie1);
            HttpCookie cookie2 = new HttpCookie("Apellidos", apellido);
            Response.Cookies.Add(cookie2);
            HttpCookie cookie3 = new HttpCookie("Sexo", sexo);
            Response.Cookies.Add(cookie3);
            HttpCookie cookie4 = new HttpCookie("Correo", email);
            Response.Cookies.Add(cookie4);
            HttpCookie cookie5 = new HttpCookie("Sexo", sexo);
            Response.Cookies.Add(cookie5);
            HttpCookie cookie6 = new HttpCookie("Direccion", dir);
            Response.Cookies.Add(cookie6);
            HttpCookie cookie7 = new HttpCookie("Requerimiento", reque);
            Response.Cookies.Add(cookie7);
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

            AddSesion(nombres, apellidos, sexo, email, address, ciudad, requerimientos);
            AddCookie(nombres, apellidos, sexo, email, address, ciudad, requerimientos);
            Response.Redirect("https://localhost:44370/Auxiliar.aspx");
            

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

        [WebMethod]
        public static bool Verificar_Datos(String nombre, String apellidos)
        {
            Service2Client client = new Service2Client();
            return client.Verificar_registro(nombre, apellidos);
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Form
{
    public partial class Auxiliar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            loadSession();
            deleteSessions();
        }

        private void loadSession()
        {
            String nombre = (String)(Session["Nombre"]);
            String apellido = (String)(Session["Apellido"]);
            String sexo = (String)(Session["Sexo"]);
            String email = (String)(Session["Email"]);
            String direccion = (String)(Session["Direccion"]);
            String ciudad = (String)(Session["Ciudad"]);
            String requerimientos = (String)(Session["Requerimientos"]);

            SesionUsuario.Text = "Enviado por Sesion: ";
            SesionNombre.Text = "Nombre: " + nombre;
            SesionApellido.Text = " Apellido: " + apellido;
            SesionSexo.Text = " Sexo: " + sexo;
            SesionEmail.Text = " Email: " + email;
            SesionDireccion.Text = " Direccion: " + direccion;
            SesionCiudad.Text = " Ciudad: " + ciudad;
            SesionRequerimientos.Text = " Requerimientos: " + requerimientos;
        }
        private void deleteSessions()
        {
            Session.RemoveAll();
            Session.Abandon();
        }
        
        [WebMethod]
        public static String getInformacion(String valor)
        {
            return "Desde el servidor se recibio :" + valor;
        }
    }
}
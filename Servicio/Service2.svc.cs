using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using Base_datos;

    namespace Servicio
    {
        // NOTA: puede usar el comando "Rename" del menú "Refactorizar" para cambiar el nombre de clase "Service2" en el código, en svc y en el archivo de configuración a la vez.
        // NOTA: para iniciar el Cliente de prueba WCF para probar este servicio, seleccione Service2.svc o Service2.svc.cs en el Explorador de soluciones e inicie la depuración.
        public class Service2 : IService2
        {
            public void SaveTextToFile(string nombre, string apellido, string sexo, string email, string direc, string ciudad, string req)
            {
            
            GuardarDatos datos = new GuardarDatos();
            datos.SaveToBaseDatos(nombre,apellido,sexo,email,direc,ciudad,req);
            }
        public bool Verificar_registro(string nombre, string apellidos)
        {
            GuardarDatos dataAlumnos = new GuardarDatos();
            return dataAlumnos.VerificarRegistro(nombre, apellidos);
        }
    }
    }

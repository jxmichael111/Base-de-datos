using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;


namespace Servicio
{
    // NOTA: puede usar el comando "Rename" del menú "Refactorizar" para cambiar el nombre de interfaz "IService2" en el código y en el archivo de configuración a la vez.
    [ServiceContract]
    public interface IService2
    {
        [OperationContract]
        void SaveTextToFile(string nombre, string apellido, string sexo, string email, string direc, string ciudad, string req);
        [OperationContract]
        bool Verificar_registro(string nombre, string apellidos);
    }
}

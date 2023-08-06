<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="Form.WebForm2" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Segundo Laboratorio</title>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        body {  
            background-image: url("https://wallpapercave.com/wp/wp5334284.jpg");
            background-position: center;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }
        #form1 {
            background-image: url("https://wallpapercave.com/wp/wp5334284.jpg");
            background-position: center;
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            max-width: 600px;
            width: 100%;
        }

        h1 {
           
            text-align: center;
            font-family: Cooper;
            font-size: 55px;
            -webkit-text-fill-color: white;
            -webkit-text-stroke: 2px black;
        }

        label {
            font-family: Comic Sans MS;
            font-size: 20px;
            color: white;
        }

         


    </style>
    <script type="text/javascript">
        function limpiarCampos() {
            document.getElementById("nombre").value = "";
            document.getElementById("apellido").value = "";
            document.getElementById("radioButtonM").checked = false;
            document.getElementById("radioButtonF").checked = false;
            document.getElementById("correo").value = "";
            document.getElementById("direccion").value = "";
            document.getElementById("DropDownListCiudad").value = 0;
            document.getElementById("descripcion").value = "";
        }

        function validarFormulario() {
            var nombre = document.getElementById("nombre").value;
            var apellidos = document.getElementById("apellido").value;
            var generoM = document.getElementById("radioButtonM").checked;
            var generoF = document.getElementById("radioButtonF").checked;
            var correo = document.getElementById("correo").value;
            var ciudad = document.getElementById("DropDownListCiudad").value;

            // Verifica si el nombre no tienen letras
            var nombreP = /^[a-zA-Z\s]+$/;
            if (!nombre.match(nombreP)) {
                alert("Solo debe contener caracteres de la a-z, mayúsculas o minúsculas.");
                return false;
            }

            // Verifica si el apellido no tienen letras
            var apellidosP = /^[a-zA-Z\s]+$/;
            if (!apellidos.match(apellidosP)) {
                alert("Solo debe contener caracteres de la a-z, mayúsculas o minúsculas.");
                return false;
            }

            // Validar si selecciono un genero
            if (generoM === false && generoF === false) {
                alert("Debe seleccionar el género del alumno.");
                return false;
            }

            // Valida si el correo lleba @unsa.edu.pe
            var correoP = /^[a-zA-Z0-9._%+-]+@unsa\.edu\.pe$/;
            if (!correo.match(correoP)) {
                alert("El correo ingresado no es válido. Debe ser un correo institucional de la UNSA");
                return false;
            }

            // Validar si selecciono una ciudad
            if (ciudad === "0") {
                alert("Debe seleccionar una ciudad.");
                return false;
            }

            var fechaRegistro = new Date().toLocaleDateString();
            alert("Fecha de registro: " + fechaRegistro);

            return true;
        }
        
        function ValidarDatos() {
            console.log("EmpaquetarContenido() fue llamada.");
            let nombre = $('#nombre').val();
            let apellido = $('#apellido').val();
            if (nombre && apellido) {
                console.log("Se esta verificando contenido " + nombre + ", " + apellido);
            
            $.ajax({
                url: 'WebForm2.aspx/Verificar_Datos',
                type: 'POST',
                async: true,
                data: '{ "nombre" : "' + nombre + '", "apellidos" : "' + apellido + '"}',
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: exito
            });
                return false;
            }
        }
        function exito(data) {
            console.log("Retornando respuesta");
            var returnS = data.d;
            if (returnS) {
                Swal.fire({
                    title: 'Error!',
                    text: "El Nombre y Apellidos ya están registados",
                    icon: 'error',
                    confirmButtonText: 'Aceptar'
                });
                limpiarCampos();
            }
            else {
                Swal.fire({
                    title: 'Exito!',
                    text: "Correcto",
                    icon: 'success',
                    confirmButtonText: 'Aceptar'
                });
            }
            return false;
        }
    </script>
</head>
<body>
    <form  onsubmit="return validarFormulario()" id="form1" runat="server">
        <div class="container">
            <h1>REGISTRO DE ALUMNOS</h1>

            <div class="row g-3 align-items-center">
                <div class="col-auto">
                    <label for="nombre" class="col-form-label">Nombre</label>
                </div>
                <div class="col-xl-6">
                    <asp:TextBox ID="nombre" runat="server" class="form-control form-control-sm" required="true"></asp:TextBox>
                </div>
            </div>

            <div class="row g-3 align-items-center">
                <div class="col-auto">
                    <label for="apellido" class="col-form-label">Apellido</label>
                </div>
                <div class="col-xl-6">
                    <asp:TextBox ID="apellido" runat="server" class="form-control form-control-sm" required="true"  onblur="ValidarDatos();"></asp:TextBox>
                </div>
            </div>
            <div class="row g-3 align-items-center">

                <div class="col-auto">
                    <label for="sexo" class="col-form-label">Sexo</label>
                </div>
                <div class="col-auto">
                    <div class="form-check form-check-inline">
                        <asp:RadioButton ID="radioButtonM" runat="server" type="radio" />
                        <label for="Masculino" class="form-check-label">Masculino</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <asp:RadioButton ID="radioButtonF" runat="server" type="radio" />
                        <label for="Masculino" class="form-check-label">Femenino</label>
                    </div>
                </div>
            </div>

            <div class="row g-3 align-items-center">
                <div class="col-auto">
                    <label for="correo" class="col-form-label">Correo:</label>
                </div>
                <div class="col-xl-6">
                    <div class="input-group mb-3">
                        <span class="input-group-text" id="basic-addon1">@</span>
                        <asp:TextBox ID="correo" runat="server" type="email" class="form-control" required="true" aria-describedby="basic-addon1"></asp:TextBox>
                    </div>
                </div>
            </div>

            <div class="row g-3 align-items-center">
                <div class="col-auto">
                    <label for="direccion" class="col-form-label">Direccion:</label>
                </div>
                <div class="col-xl-4">
                    <asp:TextBox ID="direccion" class="form-control form-control-sm" runat="server" required="true"></asp:TextBox>
                </div>
                <div class="col-auto">
                    <label for="ciudad" class="col-form-label">Ciudad:</label>
                </div>
                <div class="col-auto">
                    <asp:DropDownList ID="DropDownListCiudad" runat="server" class="form-select form-select-sm" aria-label=".form-select-sm example"></asp:DropDownList>
                </div>
            </div>
            <br />

            <div class="col-xl-6">
                <div class="form-floating">
                    <asp:TextBox ID="descripcion" runat="server" class="form-control" placeholder="Leave a comment here" Style="height: 100px"></asp:TextBox>
                    <label for="requerimiento">Requerimiento</label>
                </div>
            </div>
            <br />

            <div class="row g-3 align-items-center">
                <div class="col-auto">
                    <asp:Button ID="Button1" runat="server" class="btn btn-primary" Text="Limpiar" OnClientClick="return limpiarCampos()" />
                </div>
                <div class="col-auto">
                    <asp:Button ID="ButtonEnviar" runat="server" class="btn btn-primary" Text="Enviar" OnClick="ButtonEnviar_Click" />
                </div>
            </div>

            <div class="col-auto">
                <div class="col-auto">
                    <asp:Label runat="server" ID="server" for="direccion" class="col-form-label" Visible="false">Datos Registrados:</asp:Label>
                </div>
                <div class="form-floating">
                    <asp:TextBox ID="DatosRegistrados" runat="server" class="form-control" TextMode="MultiLine" Style="height: 200px" Visible="false"></asp:TextBox>
                </div>
            </div>
        </div>
    </form>
</body>
</html>

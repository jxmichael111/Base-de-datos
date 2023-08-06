<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Auxiliar.aspx.cs" Inherits="Form.Auxiliar" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous"/>
    <title></title>
    <script type="text/javascript">
        function LoadCookies() {
            var info = document.cookie;
            info = info.replace(/; /g, "\n");
            document.getElementById("datosCookies").value = "Informacion del usuario: \n" + info;
            return false;
        }
    </script>
    <script src="./Scripts/jquery-3.4.1.js"></script>
    <script>
        function callAjax() {
            let send = $('#datosCookies').val();
            $.ajax({
                url: 'Auxiliar.aspx/getInformacion',
                type: 'POST',
                async: true,
                data: '{ valor:"' + send + '"}',
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: exito
            });
            return false;
        }

        function exito(data) {
            var returnS = data.d;
            $('#TextBoxAjax').val(data.d);
            $('#TextBoxAjax').css("visibility", "visible");
            return false;
        }
    </script> 
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="row g-3 align-items-center">
                <div class="col-auto">
                    <asp:Label ID="SesionUsuario" class="col-form-label" runat="server" Text="Enviado por Sesión:"></asp:Label><br />
                </div>
            </div>
            <div class="row g-3 align-items-center">
                <div class="col-auto">
                    <asp:Label ID="SesionNombre" class="col-form-label" runat="server" Text=""></asp:Label>
                </div>
            </div>
            <div class="row g-3 align-items-center">
                <div class="col-auto">
                    <asp:Label ID="SesionApellido" class="col-form-label" runat="server" Text=""></asp:Label>
                </div>
            </div>
            <div class="row g-3 align-items-center">
                <div class="col-auto">
                    <asp:Label ID="SesionSexo" class="col-form-label" runat="server" Text=""></asp:Label>
                </div>
            </div>
            <div class="row g-3 align-items-center">
                <div class="col-auto">
                    <asp:Label ID="SesionEmail" class="col-form-label" runat="server" Text=""></asp:Label>
                </div>
            </div>
            <div class="row g-3 align-items-center">
                <div class="col-auto">
                    <asp:Label ID="SesionDireccion" class="col-form-label" runat="server" Text=""></asp:Label>
                </div>
            </div>
            <div class="row g-3 align-items-center">
                <div class="col-auto">
                    <asp:Label ID="SesionCiudad" class="col-form-label" runat="server" Text=""></asp:Label>
                </div>
            </div>
            <div class="row g-3 align-items-center">
                <div class="col-auto">
                    <asp:Label ID="SesionRequerimientos" class="col-form-label" runat="server" Text=""></asp:Label>
                </div>
            </div>
            <div class="row g-3 align-items-center">
                <div class="col-auto">
                    <asp:Button ID="Button1" class="btn btn-primary" runat="server" Text="Mostrar cookie" OnClientClick="return LoadCookies();" />

                </div>
            </div>
            <div class="form-floating">
                <div class="col-auto">
                    <asp:TextBox ID="datosCookies" runat="server" class="form-control" Cols="12" Rows="8" TextMode="MultiLine" ReadOnly="true" placeholder="Cookie Content"></asp:TextBox>
                </div>
            </div>

            <div class="form-group">
                <asp:Button ID="ButtonAjax" runat="server" Text="Ajax" OnClientClick="return callAjax();" class="btn btn-success btn-lg" />
            </div>
            <div class="form_group">
                <asp:TextBox ID="TextBoxAjax" runat="server" class="form-control" Style="visibility: hidden" cols="10" Rows="4" TextMode="MultiLine"></asp:TextBox>
            </div>

        </div>
    </form>
</body>
</html>
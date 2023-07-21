<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Sesion.aspx.cs" Inherits="WebApplication1.Sesion" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous"/>
    <title></title>
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
                    <asp:Button ID="MostrarCookies" class="btn btn-primary" runat="server" Text="Mostrar cookie" OnClick="loadCookies" />
                </div>
            </div>
            <div class="row g-3 align-items-center">
                <div class="col-auto">
                    <asp:TextBox ID="datosCookies" runat="server" TextMode="MultiLine" Rows="8" Columns="72" Wrap="true" Text=""></asp:TextBox>
                </div>
            </div>
        </div>
    </form>
</body>
</html>

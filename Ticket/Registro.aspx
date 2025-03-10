<%@ Page Title="" Language="C#" MasterPageFile="~/MiMaster.Master" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="Ticket.Registro" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row">
        <div class="col-md-12">
            <h1>Crea tu Perfil</h1>
        </div>
        <div class="row mb-3">
            <div class="col">
                <label for="txtNombre">Nombre</label>
                <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" placeholder="Ingresa tu nombre:"></asp:TextBox>
            </div>
            <div class="col">
                <label for="txtApellido">Apellido</label>
                <asp:TextBox ID="txtApellido" runat="server" CssClass="form-control" placeholder="Ingresa tu apellido:"></asp:TextBox>
            </div>
        </div>
        <div class="mb-3">
            <label for="txtDNI">DNI</label>
            <asp:TextBox ID="txtDNI" runat="server" CssClass="form-control" placeholder="Ingresa tu DNI:"></asp:TextBox>
        </div>
        <div class="mb-3">
            <label for="txtTelefono">Telefono</label>
            <asp:TextBox ID="txtTelefono" runat="server" CssClass="form-control" placeholder="Ingresa tu teléfono:"></asp:TextBox>
        </div>

        <div class="row g-3 mb-3">
            <div class="col-sm-7">
                <label for="txtDireccion">Direccion</label>

                <asp:TextBox ID="txtDireccion" runat="server" CssClass="form-control" placeholder="Ingresa tu dirección:"></asp:TextBox>
            </div>
            <div class="col-sm">
                <label for="txtCodPostal">Código Postal</label>
                <asp:TextBox ID="txtCodPostal" runat="server" CssClass="form-control" placeholder="Ingresa tu código postal:"></asp:TextBox>
            </div>
        </div>

        <div class="mb-3">
            <label for="txtFechaNacimiento">Fecha de Nacimiento</label>
            <asp:TextBox ID="txtFechaNacimiento" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
        </div>
        <div class="form-check mb-3">
            <asp:CheckBox Text="" ID="cbTerminos" type="checkbox" runat="server" />
            <asp:Label runat="server" Text="Acepto los términos y condiciones" CssClass="form-check-label"></asp:Label>
        </div>

        <div class="col-md-6">
            <div class="mb-3">
                <label for="txtEmail" class="form-label">Email</label>
                <asp:TextBox class="form-control" ID="txtEmail" runat="server" type="email" placeholder="name@example.com"></asp:TextBox>
            </div>
            <div class="mb-3">
                <label for="txtPassPassword">Contraseña</label>
                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" aria-describedby="passwordHelpBlock"></asp:TextBox>
                <div id="passwordHelpBlock" class="form-text">
                    Su contraseña debe tener entre 8 y 20 caracteres, contener letras y números, y no debe contener espacios, caracteres especiales ni emoji.
                </div>
            </div>

            <div class="mb-3">
                <asp:Button ID="btnRegistrar" runat="server" Text="Registrar" CssClass="btn btn-primary" OnClick="BtnRegistrar_Click" />
                <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" CssClass="btn btn-danger" OnClick="BtnCancelar_Click" />
            </div>

        </div>
    </div>
</asp:Content>

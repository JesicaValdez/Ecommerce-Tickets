<%@ Page Title="" Language="C#" MasterPageFile="~/MiMaster.Master" AutoEventWireup="true" CodeBehind="Confirmacion.aspx.cs" Inherits="Ticket.Confirmacion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row">
        <div class="col-md-12">
            <h1>Confirmacion de Registro</h1>
        </div>
        <div class="col-md-6">
            <div class="form-group">
                <label for="txtNombre">Nombre</label>
                <asp:Label ID="txtNombre" runat="server" CssClass="form-control"></asp:Label>
                <label for="txtApellido">Apellido</label>
                <asp:Label ID="txtApellido" runat="server" CssClass="form-control"></asp:Label>
                <label for="txtEmail">Email</label>
                <asp:Label ID="txtEmail" runat="server" CssClass="form-control"></asp:Label>
                <label for="txtDNI">DNI</label>
                <asp:Label ID="txtDNI" runat="server" CssClass="form-control"></asp:Label>
                <label for="txtTelefono">Telefono</label>
                <asp:Label ID="txtTelefono" runat="server" CssClass="form-control"></asp:Label>
                <label for="txtDireccion">Direccion</label>
                <asp:Label ID="txtDireccion" runat="server" CssClass="form-control"></asp:Label>
                <label for="txtLocalidad">Localidad</label>
                <asp:Label ID="txtLocalidad" runat="server" CssClass="form-control"></asp:Label>
                <label for="txtProvincia">Provincia</label>
                <asp:Label ID="txtProvincia" runat="server" CssClass="form-control"></asp:Label>
                <label for="txtPais">Pais</label>
                <asp:Label ID="txtPais" runat="server" CssClass="form-control"></asp:Label>
                <label for="txtCodigoPostal">Codigo Postal</label>
                <asp:Label ID="txtCodigoPostal" runat="server" CssClass="form-control"></asp:Label>
                <label for="txtFechaNacimiento">Fecha de Nacimiento</label>
                <asp:Label ID="txtFechaNacimiento" runat="server" CssClass="form-control"></asp:Label>
            </div>
        </div>
    </div>

</asp:Content>

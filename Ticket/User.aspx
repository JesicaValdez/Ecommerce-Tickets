<%@ Page Title="" Language="C#" MasterPageFile="~/MiMaster.Master" AutoEventWireup="true" CodeBehind="User.aspx.cs" Inherits="Ticket.User" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row">
        <div class="col-md-12">

            <h2>Mi Perfil</h2>
        </div>


    <div class="col-4">
        <div class="mb-3">
            <label for="txtNombre" class="form-label">Nombre</label>
            <asp:TextBox class="form-control" ID="txtNombre" runat="server" TextMode="SingleLine"></asp:TextBox>
        </div>
        <div class="mb-3">
            <label for="txtApellido" class="form-label">Apellido</label>
            <asp:TextBox class="form-control" ID="txtApellido" runat="server" TextMode="SingleLine"></asp:TextBox>
        </div>
        <div class="mb-3">
            <label for="txtEmail" class="form-label">Email</label>
            <asp:TextBox class="form-control" ID="txtEmail" runat="server" TextMode="Email"></asp:TextBox>
        </div>
        <div class="mb-3">
            <label class="form-label">Fecha de Nacimiento</label>
            <asp:TextBox class="form-control" ID="txtFechaNacimiento" runat="server" TextMode="Date"></asp:TextBox>
        </div>
    </div>

    <div class="col-4">
        <div class="mb-3">
            <label class="form-label">Imagen Perfil</label>
            <input type="file" id="txtPerfil" runat="server" class="form-control" />
        </div>
        <asp:Image ID="imgNuevoPerfil" ImageUrl="https://as1.ftcdn.net/jpg/02/68/55/60/1000_F_268556012_c1WBaKFN5rjRxR2eyV33znK4qnYeKZjm.jpg"
            runat="server" CssClass="img-fluid mb-3" />
    </div>

    </div>
    <div class="row">
        <div class="col-4">
            <asp:Button Text="Guardar Cambios" class="btn btn-primary" ID="btnGuardarCambios" runat="server" OnClick="BtnGuardarCambios_Click" />
            <asp:Button Text="Cancelar" class="btn btn-danger" ID="btnCancelar" runat="server" OnClick="BtnCancelar_Click" />
        </div>
    </div>



</asp:Content>

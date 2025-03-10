<%@ Page Title="" Language="C#" MasterPageFile="~/MiMaster.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Ticket.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row">
        <div class="col-md-12">
            <h1>Login</h1>
        </div>
        <div class="col-4">
            <div class="mb-3">
                <label for="txtEmail" class="form-label">Email</label>
                <asp:TextBox class="form-control" ID="txtEmail" runat="server" type="email" placeholder="example@example.com"></asp:TextBox>
            </div>
            <div class="mb-3">
                <label for="txtPassword" class="form-label">Password</label>
                <asp:TextBox class="form-control" ID="txtPassword" runat="server" type="password"></asp:TextBox>
                <div id="passwordHelpBlock" class="form-text">
    Su contraseña debe tener entre 8 y 20 caracteres, contener letras y números, y no debe contener espacios, caracteres especiales ni emoji.
</div>
            </div>
            <div class="mb-3">
                <asp:Button Text="Ingresar" class="btn btn-primary" ID="btnIngresar" runat="server" OnClick="BtnIngresar_Click" />
            </div>
        </div>
    <div class="col-12 mt-5">
        <p>
            ¿No tienes cuenta?
                <a href="Registro.aspx">Registrate</a>
        </p>
    </div>
    </div>
</asp:Content>

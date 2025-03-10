<%@ Page Title="" Language="C#" MasterPageFile="~/MiMaster.Master" AutoEventWireup="true" CodeBehind="Error.aspx.cs" Inherits="Ticket.Error" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-12">
            <h1>Hubo un problema!</h1>
        </div>
        <div class="col-md-6">
            <div class="alert alert-danger" role="alert">
                <h4 class="alert-heading">Error</h4>
                <hr>
                <asp:Label ID="lblMensaje" runat="server" Text="text"></asp:Label>
                <p class="mb-0">Por favor, intente nuevamente.</p>
            </div>
        </div>
    </div>
</asp:Content>

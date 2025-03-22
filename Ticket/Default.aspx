<%@ Page Title="" Language="C#" MasterPageFile="~/MiMaster.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Ticket.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="container">
        <!--pricipio buscar-->
        <section class="row mb-5">
            <article class="col-12">
                <input class="form-control form-control-lg me-2 rounded-pill" type="search" placeholder="Buscar" aria-label="Search">
            </article>
        </section>
        <!--fin buscar-->

        <!--principio tiltulo-->
        <section class="row">
            <article class="col-12">
                <h2>Todos los eventos en <b>Tu Marca</b></h2>
                <hr />
            </article>
        </section>
        <!--fin titulo-->

        <!--pricipio card-->
        <section class="row align-items-lg-center min-vh-100">
            <asp:Repeater ID="rpt_Eventos" runat="server">
                <ItemTemplate>
                    <article class="col-12 col-md-6 col-lg-3 d-flex">
                        <div class="card mx-auto mb-3" style="width: 18rem;">
                            <img src='<%# ResolveUrl("~/Images/ImagesEvento/" + Eval("image")) %>' class="card-img-top" alt="...">
                            <div class="card-body bg-color">
                                <span>show</span>
                                <h4 class="card-title"><b><%# Eval("nombre") %></b></h4>
                                <!--principio boton-->
                                <div class="d-grid gap-2">
                                    <asp:Button ID="btn_Comprar" runat="server" class="btn btn-primary" Text="Ver info" CommandArgument='<%# Eval("id") %>' CommandName="EventoId" OnClick="verInfoClick" />
                                </div>
                                <!--fin boton-->
                            </div>
                        </div>
                    </article>
                </ItemTemplate>
            </asp:Repeater>
        </section>
        <!--fin card-->
    </div>


</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/MiMaster.Master" AutoEventWireup="true" CodeBehind="Compra.aspx.cs" Inherits="Ticket.Compra" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2 class="text-center">COMPRA</h2>
    <div class="container">
        <div class="row">
            <asp:Repeater ID="rptDetalle" runat="server">
                <ItemTemplate>
                    <div class="card mb-3">
                        <div class="row g-0">
                            <!-- Imagen del evento -->
                            <div id="carousel" class="col-md-4">
                                <img class="card-img-top" src='<%# ResolveUrl("~/Images/ImagesEvento/" + Eval("image")) %>'>
                            </div>
                            <!-- Información del evento -->
                            <div class="col-md-8">
                                <div class="card-body">
                                    <h5 class="card-title"></h5>
                                    <p class="card-text"><i class="bi bi-ticket-perforated-fill"></i><%# Eval("nombre") %></p>
                                    <p class="card-text"><small class="text-body-secondary"><i class="bi bi-file-plus"></i><%# Eval("descripcion") %></small></p>
                                    <p class="card-text"><small class="text-body-secondary"><i class="bi bi-map"></i><%# Eval("lugar") %>, <%# Eval("direccion") %></small></p>
                                    <p class="card-text"><small class="text-body-secondary"><i class="bi bi-bag-check"></i>Asegura tu lugar en este evento comprando tu entrada</small></p>

                                </div>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>

        <section class="row mb-3">
            <asp:Repeater ID="rptFecha" runat="server">
                <ItemTemplate>
                    <div>
                        <asp:Label ID="lblFechaHora" runat="server" CssClass="fecha-hora-evento"> <i class="bi bi-clock"></i><%# Eval("fecha", "{0:dddd, dd 'de' MMMM 'de' yyyy hh:mm}") %></asp:Label>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </section>

        <section class="row">
            <asp:ScriptManager runat="server" />
            <asp:UpdatePanel runat="server">
                <ContentTemplate>
                    <div class="container d-flex flex-lg-row flex-md-row flex-column">
                        <!--inicio columna izq-->
                        <div class="col-12 col-md-6 col-lg-6 bg-color p-2 m-1 border">
                            <p class="fs-5">Entrada General</p>
                            <hr />
                            <div>
                                <asp:Button ID="decremento" runat="server" Text="-" />
                                <asp:Label ID="lbl_Contar" runat="server" Text="0"></asp:Label>
                                <asp:Button ID="incremento" runat="server" Text="+" />
                            </div>
                            <div>
                                <asp:Repeater ID="rptPrecio" runat="server">
                                    <ItemTemplate>
                                        <br />
                                        <p>
                                            PRECIO ENTRADA:
                                         <br />
                                            <asp:Label ID="pricieEvento" runat="server" CssClass="pricieEvento fs-3 bold" Text=''></asp:Label>
                                        </p>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                        </div>
                        <!--fin columna izq-->

                        <!--principio columna derecha-->

                        <div class="col-12 col-md-6 col-lg-6 bg-color p-2 m-1 border">
                            <p class="fs-5">Resumen de compra</p>
                            <hr />
                            <p>
                                Precio ticket:
                             <asp:Label ID="lbl_TicketPrecio" runat="server" Text="$0.00"></asp:Label>
                            </p>
                            <p>
                                Cantidad de tickets:
                             <asp:Label ID="lbl_Cantidad" runat="server" Text="0"></asp:Label>
                            </p>
                            <hr />
                            <p>
                                TOTAL:
                             <asp:Label ID="lbl_Total" runat="server" Text="$0.00"></asp:Label>
                            </p>
                        </div>
                        <!--fin columna derecha-->
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>

            <!--principio btn compra-->
            <div class="container d-flex flex-lg-colum flex-md-colum flex-column">
                <div class="form-check mt-3">
                    <asp:CheckBox ID="checkCondiciones" class="form-check-label" runat="server" />
                    <label for="check_TC" class="form-check-label">Acepto los <a class="color-tyc" href="#">términos y condiciones</a>.</label>
                </div>
                <asp:Label runat="server" ID="lbl_Chek" Text="" CssClass="ms-4 p-1" Visible="false" ForeColor="Red" />
                <br />

                <div class="d-grid m-3">
                    <asp:Button ID="btn_Comprar" runat="server" Text="PAGAR" CssClass="btn btn-mercado btn-primary col-12 col-md-4 col-lg-4 " OnClick="PagarClick" />
                </div>

            </div>
         </section>
    </div>
</asp:Content>

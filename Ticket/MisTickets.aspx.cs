using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ticket
{
    public partial class MisTickets : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Usuario usuario = (Usuario)Session["SessionActiva"];
            if (usuario != null)
            {
                lblUsuario.Text = "Bienvenido " + usuario.Nombre + " " + usuario.Apellido;
            }
            else
            {
                Session.Add("error", "debes loguearte para ingresar");
                Response.Redirect("Error.aspx");
            }
        }
    }
}
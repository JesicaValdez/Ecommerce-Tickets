using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using Negocio;

namespace Ticket
{
    public partial class AdminForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!(Session["usuario"] != null && ((Dominio.Usuario)Session["usuario"]).TipoUsuario == Dominio.UserType.ADMIN))
            if (!Seguridad.esAdmin(Session["sessionActiva"]))
            {
                Session.Add("error", "Debes loguearte como administrador para ingresar. No tienes permisos para entrar a esta pantalla. Necesitas un nivel admin.");
                Response.Redirect("Error.aspx", false);
            }
        }
    }
}
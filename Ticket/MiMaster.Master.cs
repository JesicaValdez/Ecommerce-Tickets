using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ticket
{
    public partial class MiMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!(Page is Login || Page is Registro || Page is Default))
            {
                if (!Seguridad.sesionActiva(Session["sessionActiva"]))
                    Response.Redirect("Login.aspx", false);
            }

            if (Seguridad.sesionActiva(Session["sessionActiva"]))
            {
                Usuario usuario = (Usuario)Session["sessionActiva"];
                imgAvatar.ImageUrl = "~/Images/" + usuario.ImagenPerfil + "?t=" + DateTime.Now.Ticks;
                //Se agrega "?t=" + DateTime.Now.Ticks a la URL de la imagen para evitar el almacenamiento en caché del navegador.
            }
            else
            {
                imgAvatar.ImageUrl = "https://img.freepik.com/vector-gratis/circulo-azul-usuario-blanco_78370-4707.jpg";
            }
        }


        protected void BtnCerrarSesion_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Login.aspx", false);
        }



    }
}
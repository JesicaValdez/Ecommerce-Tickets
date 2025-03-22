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
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            EventoNegocio negocio = new EventoNegocio();

            if (!IsPostBack)
            {
                List<Evento> evento = negocio.listar();
                rpt_Eventos.DataSource = evento;
                rpt_Eventos.DataBind();
            }
        }

        protected void verInfoClick(object sender, EventArgs e)
        {
            Response.Redirect("Compra.aspx");
        }
    }
}
using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ticket
{
    public partial class Compra : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) 
            {
                
            }

            if (Request.QueryString["id"] != null)
            {
                EventoNegocio negocio = new EventoNegocio();
                int id = int.Parse(Request.QueryString["id"]);
                List<Evento> evento = new List<Evento>();

                evento.Add(negocio.buscarEvento(id));

                rptDetalle.DataSource = evento;
                rptDetalle.DataBind();

                rptFecha.DataSource = evento;
                rptFecha.DataBind();

                rptPrecio.DataSource = evento;
                rptPrecio.DataBind();
            }

        }

        protected void PagarClick(object sender, EventArgs e)
        {
            
        }
    }
}
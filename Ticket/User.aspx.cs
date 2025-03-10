using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Remoting.Contexts;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ticket
{
    public partial class User : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    if (Seguridad.sesionActiva(Session["sessionActiva"]))
                    {
                        Usuario usuario = (Usuario)Session["sessionActiva"];
                        txtEmail.Text = usuario.Email;
                        txtEmail.ReadOnly = true;
                        txtNombre.Text = usuario.Nombre;
                        txtApellido.Text = usuario.Apellido;
                        txtFechaNacimiento.Text = usuario.FechaNacimiento.ToString("yyyy-MM-dd");
                        imgNuevoPerfil.ImageUrl = "~/Images/" + usuario.ImagenPerfil;
                        
                    }
                }
                else
                {
                    // Si es un postback, mantener la imagen actualizada
                    Usuario usuario = (Usuario)Session["sessionActiva"];
                    if (usuario != null)
                    {
                        imgNuevoPerfil.ImageUrl = "~/Images/" + usuario.ImagenPerfil;
                    }
                }
            }
            catch (Exception ex)
            {
                Session.Add("Error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }

        }

        protected void BtnGuardarCambios_Click(object sender, EventArgs e)
        {
            try
            {
                UsuarioNegocio negocio = new UsuarioNegocio();

                // Obtener la ruta del servidor para guardar la imagen
                string ruta = Server.MapPath("./Images/");
                Usuario user = (Usuario)Session["sessionActiva"];

                // Guardar la nueva imagen
                string nuevaImagen = "perfil-" + user.IdUsuario + ".jpg";
                txtPerfil.PostedFile.SaveAs(ruta + nuevaImagen);

                // Actualizar los datos del usuario
                user.ImagenPerfil = nuevaImagen;
                user.Nombre = txtNombre.Text;
                user.Apellido = txtApellido.Text;
                user.FechaNacimiento = DateTime.Parse(txtFechaNacimiento.Text);
                negocio.Actualizar(user);

                // **Actualizar la sesión con la nueva imagen**
                Session["sessionActiva"] = user;

                // **Actualizar la imagen en la MasterPage**
                if (Master != null)
                {
                    Image imgMaster = (Image)Master.FindControl("imgAvatar");
                    if (imgMaster != null)
                    {
                        imgMaster.ImageUrl = "~/Images/" + nuevaImagen;
                    }
                }

                // **Redirigir o actualizar la página para reflejar el cambio**
                Response.Redirect(Request.RawUrl, false);
            }
            catch (Exception ex)
            {
                Session.Add("Error", ex.ToString());
            }
        }


        protected void BtnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx", false);
        }
    }
}
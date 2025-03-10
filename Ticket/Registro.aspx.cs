using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;

namespace Ticket
{
    public partial class Registro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void BtnRegistrar_Click(object sender, EventArgs e)
        {
            try
            {
                Usuario user = new Usuario();
                UsuarioNegocio negocio = new UsuarioNegocio();
                EmailService emailService = new EmailService();

                user.Email = txtEmail.Text;
                user.Pass = txtPassword.Text;
                user.Nombre = txtNombre.Text;
                user.Apellido = txtApellido.Text;
                user.DNI = txtDNI.Text;
                user.FechaNacimiento = DateTime.Parse(txtFechaNacimiento.Text);
                user.Direccion = txtDireccion.Text;
                user.CodPostal = txtCodPostal.Text;
                user.Telefono = txtTelefono.Text;
                user.ImagenPerfil = "default.png";
                user.Estado = true;
                //user.TipoUsuario = UserType.CLIENTE;
                
                user.IdUsuario = negocio.InsertarNuevo(user);
                Session.Add("sessionActiva", user);

                emailService.armarCorreo(user.Email, "Registro exitoso", "Bienvenido a Ticket, su registro ha sido exitoso.");
                emailService.enviarEmail();
                
                Response.Redirect("Default.aspx", false);
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }
        }

        public void BtnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }
    }
}
using System;
using System.Collections.Generic;
using System.Diagnostics.Eventing.Reader;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;


namespace Negocio
{
    public class UsuarioNegocio
    {

        public int InsertarNuevo(Usuario nuevo)
        {
            AccesoDB datos = new AccesoDB();

            try
            {
                datos.setearProcedimiento("SP_LOGIN_USER");
                datos.setearParametro("@Email", nuevo.Email);
                datos.setearParametro("@Pass", nuevo.Pass);
                datos.setearParametro("@Nombre", nuevo.Nombre);
                datos.setearParametro("@Apellido", nuevo.Apellido);
                datos.setearParametro("@DNI", nuevo.DNI);
                datos.setearParametro("@fechaNacimiento", nuevo.FechaNacimiento);
                datos.setearParametro("@Direccion", nuevo.Direccion);
                datos.setearParametro("@CodPostal", nuevo.CodPostal);
                datos.setearParametro("@Telefono", nuevo.Telefono);
                datos.setearParametro("@ImagenPerfil", nuevo.ImagenPerfil);
                datos.setearParametro("@Estado", nuevo.Estado);
                //datos.setearParametro("@TipoUsuario", (int)nuevo.TipoUsuario);

                return datos.ejecutarScalar();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.cerrarConexion();

            }
               
        }

        public bool Loguear(Usuario user)
        {
            AccesoDB datos = new AccesoDB();
            try
            {
                datos.setearConsulta("SELECT IDUsuario, Email, Pass, TipoUsuario, ImagenPerfil, Nombre, Apellido, fechaNacimiento FROM USUARIOS WHERE EMAIL = @EMAIL AND PASS = @PASS");
                datos.setearParametro("@EMAIL", user.Email);
                datos.setearParametro("@PASS", user.Pass);
                datos.ejecutarLectura();

                while(datos.Lector.Read())
                {
                    user.IdUsuario = (int)datos.Lector["IDUsuario"];
                    user.TipoUsuario = (int)(datos.Lector["TipoUsuario"]) == 1 ? UserType.ADMIN : UserType.CLIENTE;

                    //si el campo de la imagen es null, se asigna un string vacio
                    if (!(datos.Lector["ImagenPerfil"] is DBNull))
                        user.ImagenPerfil = (string)datos.Lector["ImagenPerfil"];
                    if(!(datos.Lector["Nombre"] is DBNull))
                        user.Nombre = (string)datos.Lector["Nombre"];
                    if (!(datos.Lector["Apellido"] is DBNull))
                        user.Apellido = (string)datos.Lector["Apellido"];
                    if (!(datos.Lector["fechaNacimiento"] is DBNull))
                        // al ser un campo de tipo datetime, se castea a datetime el valor obtenido
                        user.FechaNacimiento = DateTime.Parse(datos.Lector["fechaNacimiento"].ToString());

                    return true;
                }
      
                return false;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }

        }

        public void Actualizar(Usuario user)
        {
            AccesoDB datos = new AccesoDB();
            try
            {

                datos.setearConsulta("UPDATE USUARIOS SET Nombre = @Nombre, Apellido = @Apellido, fechaNacimiento = @FechaNacimiento, ImagenPerfil = @ImagenPerfil WHERE IDUsuario = @IDUsuario");
                //datos.setearParametro("@ImagenPerfil", (object)DBNull.Value);
                datos.setearParametro("@ImagenPerfil", user.ImagenPerfil);
                datos.setearParametro("@Nombre", user.Nombre);
                datos.setearParametro("@Apellido", user.Apellido);
                datos.setearParametro("@FechaNacimiento", user.FechaNacimiento);
                datos.setearParametro("@IDUsuario", user.IdUsuario);
                datos.ejecutarAccion();

            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }
    }
}

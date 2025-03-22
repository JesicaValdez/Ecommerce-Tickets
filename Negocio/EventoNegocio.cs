using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class EventoNegocio
    {
        private AccesoDB datos = new AccesoDB();

        public List<Evento> listar()
        {
            List<Evento> lista = new List<Evento>();

            try
            {
                datos.setearConsulta("SELECT Id, Nombre, Descripcion, Fecha, Lugar, Direccion, Capacidad, Imagen FROM Eventos");
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Evento aux = new Evento();

                    aux.id = (int)datos.Lector["Id"];
                    aux.nombre = (string)datos.Lector["Nombre"];
                    aux.descripcion = (string)datos.Lector["Descripcion"];
                    aux.fecha = (DateTime)datos.Lector["Fecha"];
                    aux.lugar = (string)datos.Lector["Lugar"];
                    aux.direccion = (string)datos.Lector["Direccion"];
                    aux.capacidad = (int)datos.Lector["Capacidad"];                    
                    aux.image = (string)datos.Lector["Imagen"];

                    lista.Add(aux);
                }

                return lista;
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

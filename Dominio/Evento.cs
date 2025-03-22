using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Evento
    {
        public int id {  get; set; }
        public string nombre { get; set; }
        public string descripcion { get; set; }
        public DateTime fecha { get; set; }
        public string lugar {  get; set; }
        public string direccion { get; set; }
        public int capacidad { get; set; }
        public string image {  get; set; }

        public Evento()
        {
            id = 0;
            nombre = string.Empty;
            descripcion = string.Empty;
            fecha = DateTime.MinValue;
            lugar = string.Empty;
            direccion = string.Empty;
            capacidad = 0;
            image = string.Empty;
        }
    }
}

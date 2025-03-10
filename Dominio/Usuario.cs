using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public enum UserType
    {
        ADMIN = 1,
        CLIENTE = 2
    }
    public class Usuario
    {
        public int IdUsuario { get; set; }
        public string Email { get; set; }
        public string Pass { get; set; }
        public UserType TipoUsuario { get; set; }
        public string DNI { get; set; }
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public DateTime FechaNacimiento { get; set; }
        public string Direccion { get; set; }
        public string CodPostal { get; set; }
        public string Telefono { get; set; }
        public string ImagenPerfil { get; set; }
        public bool Estado { get; set; }
    
        public Usuario(string user, string pass, string dni, string name, string surname, DateTime birthdate, string address, string postalCode, string phone, bool state, bool admin, string imagenPerfil)
        {
            Email = user;
            Pass = pass;
            TipoUsuario = admin ? UserType.ADMIN : UserType.CLIENTE;
            DNI = dni;
            Nombre = name;
            Apellido = surname;
            FechaNacimiento = birthdate;
            Direccion = address;
            CodPostal = postalCode;
            Telefono = phone;
            Estado = state;
            ImagenPerfil = imagenPerfil;
        }

        public Usuario()
        {

        }
    }

}



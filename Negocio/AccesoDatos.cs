﻿using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
    {
        internal class AccesoDB
        {
            private SqlConnection conexion;
            public SqlCommand comando;
            private SqlDataReader lector;
            public SqlDataReader Lector
            {
                get { return lector; }
            }

            public AccesoDB()
            {
                conexion = new SqlConnection("Server=localhost; Database=DB_TICKETS2; User Id=sa; Password=Qqmelo#13");
                comando = new SqlCommand();
            }

            public void setearConsulta(string consulta)
            {
                comando.CommandType = System.Data.CommandType.Text;
                comando.CommandText = consulta;
            }

            public void setearProcedimiento(string sp)
            {
                comando.CommandType = System.Data.CommandType.StoredProcedure;
                comando.CommandText = sp;
            }

            public void ejecutarLectura()
            {
                comando.Connection = conexion;
                try
                {
                    conexion.Open();
                    if (conexion.State != System.Data.ConnectionState.Open)
                    {
                        throw new Exception("La conexión no se pudo abrir.");
                    }
                    lector = comando.ExecuteReader();
                }
                catch (Exception ex)
                {
                    throw new Exception("Error al ejecutar la lectura: " + ex.Message);
                }
            }

            public void ejecutarAccion()
            {
                comando.Connection = conexion;
                try
                {
                    conexion.Open();
                    comando.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    throw ex;
                }
                finally { conexion.Close(); }
            }

            public int ejecutarScalar()
            {
                comando.Connection = conexion;
                try
                {
                    conexion.Open();
                    return int.Parse(comando.ExecuteScalar().ToString());
                }
                catch (Exception ex)
                {
                    throw ex;
                }
                finally { conexion.Close(); }
            }

            public void setearParametro(string nombre, object valor)
            {
                comando.Parameters.AddWithValue(nombre, valor);
            }


            public void cerrarConexion()
            {
                if (lector != null)
                    lector.Close();
                conexion.Close();
            }
        }
    }



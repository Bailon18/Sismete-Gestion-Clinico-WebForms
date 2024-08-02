using SistemaGestionHistorialClinico.Entidad;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace SistemaGestionHistorialClinico.Data
{
    public class SIGUTCPersonalData
    {
        private string cadenaConexion;

        public SIGUTCPersonalData()
        {
            cadenaConexion = ConfigurationManager.ConnectionStrings["ConexionSQLServer"].ConnectionString;
        }

        private List<SIGUTCPERSONAL> ConvertirDataReaderALista(SqlDataReader reader)
        {
            List<SIGUTCPERSONAL> listaPersonas = new List<SIGUTCPERSONAL>();

            while (reader.Read())
            {
                SIGUTCPERSONAL persona = new SIGUTCPERSONAL
                {
                    strCod_alu = reader["strCod_alu"].ToString(),
                    VALCED_ALU = reader["VALCED_ALU"].ToString(),
                    CODIGO_CIU = reader["CODIGO_CIU"].ToString(),
                    APELLIDO_ALU = reader["APELLIDO_ALU"].ToString(),
                    APELLIDOM_ALU = reader["APELLIDOM_ALU"].ToString(),
                    NOMBRE_ALU = reader["NOMBRE_ALU"].ToString(),
                    SEXO_ALU = reader["SEXO_ALU"].ToString(),
                    ESTCIV_ALU = reader["ESTCIV_ALU"].ToString(),
                    FNAC_ALU = reader["FNAC_ALU"].ToString(),
                    LNAC_ALU = reader["LNAC_ALU"].ToString(),
                    NACIONALIDAD_ALU = reader["NACIONALIDAD_ALU"].ToString(),
                    DIRECCION_ALU = reader["DIRECCION_ALU"].ToString(),
                    DIRCOMPLETA_ALU = reader["DIRCOMPLETA_ALU"].ToString(),
                    FONFIJ_ALU = reader["FONFIJ_ALU"].ToString(),
                    FONCEL_ALU = reader["FONCEL_ALU"].ToString(),
                    OPERADORAMOVIL_ALU = reader["OPERADORAMOVIL_ALU"].ToString(),
                    FOTO_ALU = reader["FOTO_ALU"].ToString(),
                    OBS1_ALU = reader["OBS1_ALU"].ToString(),
                    OBS2_ALU = reader["OBS2_ALU"].ToString(),
                    OBS3_ALU = reader["OBS3_ALU"].ToString(),
                    DISCAPACIDAD_ALU = reader["DISCAPACIDAD_ALU"].ToString(),
                    NUMCONADIS_ALU = reader["NUMCONADIS_ALU"].ToString(),
                    FLOG_ALU = reader["FLOG_ALU"].ToString(),
                    OBS4_ALU = reader["OBS4_ALU"].ToString(),
                    OBS5_ALU = reader["OBS5_ALU"].ToString(),
                    OBS6_ALU = reader["OBS6_ALU"].ToString(),
                    LIBRETAMILITAR_ALU = reader["LIBRETAMILITAR_ALU"].ToString(),
                    ANIOSRESIDENCIA_ALU = reader["ANIOSRESIDENCIA_ALU"].ToString(),
                    TIPOSANGRE_ALU = reader["TIPOSANGRE_ALU"].ToString(),
                    FONTRAB_ALU = reader["FONTRAB_ALU"].ToString(),
                    NACIONALIDADINDIG_ALU = reader["NACIONALIDADINDIG_ALU"].ToString(),
                    strUsername = reader["strUsername"].ToString(),
                    strContrasena = reader["strContrasena"].ToString(),
                    strRol = reader["strRol"].ToString()
                };

                listaPersonas.Add(persona);
            }

            return listaPersonas;
        }


        private SIGUTCPERSONAL ConvertirDataReaderASIGUTCPERSONAL(SqlDataReader reader)
        {
            SIGUTCPERSONAL persona = null;

            if (reader.Read())
            {
                persona = new SIGUTCPERSONAL
                {
                    strCod_alu = reader["strCod_alu"].ToString(),
                    VALCED_ALU = reader["VALCED_ALU"].ToString(),
                    CODIGO_CIU = reader["CODIGO_CIU"].ToString(),
                    APELLIDO_ALU = reader["APELLIDO_ALU"].ToString(),
                    APELLIDOM_ALU = reader["APELLIDOM_ALU"].ToString(),
                    NOMBRE_ALU = reader["NOMBRE_ALU"].ToString(),
                    SEXO_ALU = reader["SEXO_ALU"].ToString(),
                    ESTCIV_ALU = reader["ESTCIV_ALU"].ToString(),
                    FNAC_ALU = reader["FNAC_ALU"].ToString(),
                    LNAC_ALU = reader["LNAC_ALU"].ToString(),
                    NACIONALIDAD_ALU = reader["NACIONALIDAD_ALU"].ToString(),
                    DIRECCION_ALU = reader["DIRECCION_ALU"].ToString(),
                    DIRCOMPLETA_ALU = reader["DIRCOMPLETA_ALU"].ToString(),
                    FONFIJ_ALU = reader["FONFIJ_ALU"].ToString(),
                    FONCEL_ALU = reader["FONCEL_ALU"].ToString(),
                    OPERADORAMOVIL_ALU = reader["OPERADORAMOVIL_ALU"].ToString(),
                    FOTO_ALU = reader["FOTO_ALU"].ToString(),
                    OBS1_ALU = reader["OBS1_ALU"].ToString(),
                    OBS2_ALU = reader["OBS2_ALU"].ToString(),
                    OBS3_ALU = reader["OBS3_ALU"].ToString(),
                    DISCAPACIDAD_ALU = reader["DISCAPACIDAD_ALU"].ToString(),
                    NUMCONADIS_ALU = reader["NUMCONADIS_ALU"].ToString(),
                    FLOG_ALU = reader["FLOG_ALU"].ToString(),
                    OBS4_ALU = reader["OBS4_ALU"].ToString(),
                    OBS5_ALU = reader["OBS5_ALU"].ToString(),
                    OBS6_ALU = reader["OBS6_ALU"].ToString(),
                    LIBRETAMILITAR_ALU = reader["LIBRETAMILITAR_ALU"].ToString(),
                    ANIOSRESIDENCIA_ALU = reader["ANIOSRESIDENCIA_ALU"].ToString(),
                    TIPOSANGRE_ALU = reader["TIPOSANGRE_ALU"].ToString(),
                    FONTRAB_ALU = reader["FONTRAB_ALU"].ToString(),
                    NACIONALIDADINDIG_ALU = reader["NACIONALIDADINDIG_ALU"].ToString(),
                    strUsername = reader["strUsername"].ToString(),
                    strContrasena = reader["strContrasena"].ToString(),
                    strRol = reader["strRol"].ToString()
                };
            }

            return persona;
        }


        public List<SIGUTCPERSONAL> ListarPersonasPorRol(string rol)
        {
            List<SIGUTCPERSONAL> listaPersonas = new List<SIGUTCPERSONAL>();

            using (SqlConnection conexion = new SqlConnection(cadenaConexion))
            {
                SqlCommand comando = new SqlCommand("ListarPorRol", conexion);
                comando.CommandType = CommandType.StoredProcedure;
                comando.Parameters.Add(new SqlParameter("@Rol", rol));

                try
                {
                    conexion.Open();
                    using (SqlDataReader reader = comando.ExecuteReader())
                    {
                        listaPersonas = ConvertirDataReaderALista(reader);
                    }
                }
                catch (Exception ex)
                {
                    throw new Exception("Error al ejecutar el procedimiento almacenado", ex);
                }
            }

            return listaPersonas;
        }

        public List<SIGUTCPERSONAL> ListarTodosMenosEstudiante()
        {
            List<SIGUTCPERSONAL> listaPersonas = new List<SIGUTCPERSONAL>();

            using (SqlConnection conexion = new SqlConnection(cadenaConexion))
            {
                SqlCommand comando = new SqlCommand("ListarTodosMenosEstudiante", conexion);
                comando.CommandType = CommandType.StoredProcedure;

                try
                {
                    conexion.Open();
                    using (SqlDataReader reader = comando.ExecuteReader())
                    {
                        listaPersonas = ConvertirDataReaderALista(reader);
                    }
                }
                catch (Exception ex)
                {
                    throw new Exception("Error al ejecutar el procedimiento almacenado", ex);
                }
            }

            return listaPersonas;
        }


        public SIGUTCPERSONAL ObtenerPersonalPorCredenciales(string username, string password)
        {
            SIGUTCPERSONAL persona = null;

            using (SqlConnection conexion = new SqlConnection(cadenaConexion))
            {
                SqlCommand comando = new SqlCommand("GetPersonalByCredentials", conexion);
                comando.CommandType = CommandType.StoredProcedure;
                comando.Parameters.Add(new SqlParameter("@strUsername", username));
                comando.Parameters.Add(new SqlParameter("@strContrasena", password));

                try
                {
                    conexion.Open();
                    using (SqlDataReader reader = comando.ExecuteReader())
                    {
                        persona = ConvertirDataReaderASIGUTCPERSONAL(reader);
                    }
                }
                catch (Exception ex)
                {
                    throw new Exception("Error al ejecutar el procedimiento almacenado", ex);
                }
            }

            return persona;
        }



    }
}

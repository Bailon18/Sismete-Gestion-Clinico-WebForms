using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using SistemaGestionHistorialClinico.Entidad;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using SistemaGestionHistorialClinico.Entidad.dto;

namespace SistemaGestionHistorialClinico.Data
{
    public class BU_HISTORIALData
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["ConexionSQLServer"].ConnectionString;

        public bool InsertBU_HISTORIAL(BU_HISTORIAL historial)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("InsertBU_HISTORIAL", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@strCod_histo", historial.strCod_histo);
                    cmd.Parameters.AddWithValue("@strCod_alu", historial.strCod_alu);
                    cmd.Parameters.AddWithValue("@strCod_medico", historial.strCod_medico);
                    cmd.Parameters.AddWithValue("@strCod_ser", historial.strCod_ser);
                    cmd.Parameters.AddWithValue("@dtFecha_histo", historial.dtFecha_histo);
                    cmd.Parameters.AddWithValue("@bitEstado_histo", historial.bitEstado_histo);
                    cmd.Parameters.AddWithValue("@strUserLog", historial.strUserLog);
                    cmd.Parameters.AddWithValue("@dtFechaLog", historial.dtFechaLog);

                    try
                    {
                        con.Open();
                        int rowsAffected = cmd.ExecuteNonQuery();
                        return rowsAffected > 0;
                    }
                    catch (Exception ex)
                    {
                        // Manejo de excepciones
                        throw new Exception("Error al insertar en BU_HISTORIAL: " + ex.Message);
                    }
                }
            }
        }

        public List<AtencionDiaDTO> GetAtencionesDelDia(string strCod_medico, DateTime fecha)
        {
            List<AtencionDiaDTO> atenciones = new List<AtencionDiaDTO>();

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("GetAtencionesDelDia", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@strCod_medico", strCod_medico);
                    cmd.Parameters.AddWithValue("@fecha", fecha);

                    try
                    {
                        con.Open();
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                AtencionDiaDTO atencion = new AtencionDiaDTO
                                {
                                    strCod_histo = reader["strCod_histo"].ToString(),
                                    strCod_alu = reader["strCod_alu"].ToString(),
                                    NombreCompleto = reader["NombreCompleto"].ToString(),
                                    strNombre_ser = reader["strNombre_ser"].ToString(),
                                    dtFecha_histo = Convert.ToDateTime(reader["dtFecha_histo"]),
                                    bitEstado_histo = Convert.ToBoolean(reader["bitEstado_histo"])
                                };
                                atenciones.Add(atencion);
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        // Manejo de excepciones
                        throw new Exception("Error al obtener atenciones del día: " + ex.Message);
                    }
                }
            }

            return atenciones;
        }

        public bool VerificarCitaExistente(string codigoEstudiante, string codigoProfesional, string codigoServicio, DateTime fecha)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("VerificarCitaExistente", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@codigoEstudiante", codigoEstudiante);
                    cmd.Parameters.AddWithValue("@codigoProfesional", codigoProfesional);
                    cmd.Parameters.AddWithValue("@codigoServicio", codigoServicio);
                    cmd.Parameters.AddWithValue("@fecha", fecha);

                    try
                    {
                        con.Open();
                        bool citaExistente = Convert.ToBoolean(cmd.ExecuteScalar());
                        return citaExistente;
                    }
                    catch (Exception ex)
                    {
                        // Manejo de excepciones
                        throw new Exception("Error al verificar cita existente: " + ex.Message);
                    }
                }
            }
        }

        public bool ExisteHistorialParaEstudiante(string codigoEstudiante)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT COUNT(*) FROM BU_HISTORIAL WHERE strCod_alu = @codigoEstudiante";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@codigoEstudiante", codigoEstudiante);

                    try
                    {
                        con.Open();
                        int count = (int)cmd.ExecuteScalar();
                        return count > 0;
                    }
                    catch (Exception ex)
                    {
                        throw new Exception("Error al verificar la existencia del historial: " + ex.Message);
                    }
                }
            }
        }

    }
}

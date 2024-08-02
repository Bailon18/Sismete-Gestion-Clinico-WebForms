using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using SistemaGestionHistorialClinico.Entidad;
using SistemaGestionHistorialClinico.Entidad.dto;

namespace SistemaGestionHistorialClinico.Data
{
    public class BU_CITASData
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["ConexionSQLServer"].ConnectionString;

        public bool InsertarCita(BU_CITA cita)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("InsertarCita", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@strCod_cita", cita.strCod_cita);
                    cmd.Parameters.AddWithValue("@strCod_alu", cita.strCod_alu);
                    cmd.Parameters.AddWithValue("@strCod_ser", cita.strCod_ser);
                    cmd.Parameters.AddWithValue("@dtFecha_cita", cita.dtFecha_cita);
                    cmd.Parameters.AddWithValue("@strEstado_cita", cita.strEstado_cita);
                    cmd.Parameters.AddWithValue("@strUserLog", cita.strUserLog);
                    cmd.Parameters.AddWithValue("@dtFechaLog", cita.dtFechaLog);

                    try
                    {
                        con.Open();
                        int rowsAffected = cmd.ExecuteNonQuery();
                        return rowsAffected > 0;
                    }
                    catch (Exception ex)
                    {
 
                        throw new Exception("Error al insertar cita: " + ex.Message);
                    }
                }
            }
        }

        public bool VerificarCitaPorFecha(string codigoEstudiante, DateTime fecha)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT COUNT(*) FROM BU_CITA WHERE strCod_alu = @codigoEstudiante AND CAST(dtFecha_cita AS DATE) = @fecha";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@codigoEstudiante", codigoEstudiante);
                    cmd.Parameters.AddWithValue("@fecha", fecha.Date);

                    try
                    {
                        con.Open();
                        int count = Convert.ToInt32(cmd.ExecuteScalar());
                        return count > 0;
                    }
                    catch (Exception ex)
                    {
                        throw new Exception("Error al verificar la cita: " + ex.Message);
                    }
                }
            }
        }

        public List<CitaDTO> ObtenerCitasPorMedicoYFecha(string codigoMedico, DateTime fecha)
        {
            List<CitaDTO> citas = new List<CitaDTO>();

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("ObtenerCitasPorMedicoYFecha", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@codigoMedico", codigoMedico);
                    cmd.Parameters.AddWithValue("@fecha", fecha);

                    try
                    {
                        con.Open();
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                CitaDTO cita = new CitaDTO
                                {
                                    CodigoCita = reader["CodigoCita"].ToString(),
                                    CodigoPaciente = reader["CodigoPaciente"].ToString(),
                                    NombreCompletoPaciente = reader["NombreCompletoPaciente"].ToString(),
                                    NombreServicio = reader["NombreServicio"].ToString(),
                                    FechaCita = Convert.ToDateTime(reader["FechaCita"]),
                                    Estado = reader["Estado"].ToString()
                                };
                                citas.Add(cita);
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        throw new Exception("Error al obtener citas por médico y fecha: " + ex.Message);
                    }
                }
            }

            return citas;
        }

        public bool InsertarDetalleCita(BU_DETALLE_CITA detalleCita)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("spInsertarDetalleCita", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    // Agregar los parámetros de entrada
                    cmd.Parameters.AddWithValue("@strCod_detacita", detalleCita.strCod_detacita);
                    cmd.Parameters.AddWithValue("@strCod_cita", detalleCita.strCod_cita);
                    cmd.Parameters.AddWithValue("@strDescripcion", detalleCita.strDescripcion);
                    cmd.Parameters.AddWithValue("@strObservaciones", detalleCita.strObservaciones);
                    cmd.Parameters.AddWithValue("@strUserLog", detalleCita.strUserLog);
                    cmd.Parameters.AddWithValue("@dtFechaLog", detalleCita.dtFechaLog);

                    // Agregar el parámetro de salida
                    SqlParameter successParam = new SqlParameter("@success", SqlDbType.Bit);
                    successParam.Direction = ParameterDirection.Output;
                    cmd.Parameters.Add(successParam);

                    try
                    {
                        con.Open();
                        cmd.ExecuteNonQuery();

                        // Obtener el valor del parámetro de salida
                        bool success = (bool)successParam.Value;

                        return success;
                    }
                    catch (Exception ex)
                    {
                        throw new Exception("Error al insertar detalle de la cita: " + ex.Message);
                    }
                }
            }
        }


        public bool ActualizarDetalleCita(BU_DETALLE_CITA detalleCita)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("spActualizarDetalleCita", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@strCod_detacita", detalleCita.strCod_detacita);
                    cmd.Parameters.AddWithValue("@strCod_cita", detalleCita.strCod_cita);
                    cmd.Parameters.AddWithValue("@strDescripcion", detalleCita.strDescripcion);
                    cmd.Parameters.AddWithValue("@strObservaciones", detalleCita.strObservaciones);
                    cmd.Parameters.AddWithValue("@strUserLog", detalleCita.strUserLog);
                    cmd.Parameters.AddWithValue("@dtFechaLog", detalleCita.dtFechaLog);

                    // Definir el parámetro de salida
                    SqlParameter rowsAffectedParam = new SqlParameter("@RowsAffected", SqlDbType.Int)
                    {
                        Direction = ParameterDirection.Output
                    };
                    cmd.Parameters.Add(rowsAffectedParam);

                    try
                    {
                        con.Open();
                        cmd.ExecuteNonQuery();

                        int rowsAffected = (int)rowsAffectedParam.Value;
                        return rowsAffected > 0;
                    }
                    catch (Exception ex)
                    {
                        throw new Exception("Error al actualizar el detalle de la cita: " + ex.Message);
                    }
                }
            }
        }


        public BU_DETALLE_CITA ObtenerDetalleCita(string codigoCita)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT * FROM BU_DETALLE_CITA WHERE strCod_cita = @codigoCita", con))
                {
                    cmd.Parameters.AddWithValue("@codigoCita", codigoCita);

                    try
                    {
                        con.Open();
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                return new BU_DETALLE_CITA
                                {
                                    strCod_detacita = reader["strCod_detacita"].ToString(),
                                    strCod_cita = reader["strCod_cita"].ToString(),
                                    strDescripcion = reader["strDescripcion"].ToString(),
                                    strObservaciones = reader["strObservaciones"].ToString(),
                                    strUserLog = reader["strUserLog"].ToString(),
                                    dtFechaLog = Convert.ToDateTime(reader["dtFechaLog"])
                                };
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        throw new Exception("Error al obtener el detalle de la cita: " + ex.Message);
                    }
                }
            }
            return null;
        }

        public bool CambiarEstadoCita(string codigoCita)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "UPDATE BU_CITA SET strEstado_cita = CASE WHEN strEstado_cita = 'Pendiente' THEN 'Atendido' ELSE 'Pendiente' END WHERE strCod_cita = @codigoCita";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@codigoCita", codigoCita);

                    try
                    {
                        con.Open();
                        int rowsAffected = cmd.ExecuteNonQuery();
                        return rowsAffected > 0;
                    }
                    catch (Exception ex)
                    {
                        throw new Exception("Error al cambiar el estado de la cita: " + ex.Message);
                    }
                }
            }
        }

        public bool EliminarDetalleCita(string codigoCita)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "DELETE FROM BU_DETALLE_CITA WHERE strCod_cita = @codigoCita";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@codigoCita", codigoCita);

                    try
                    {
                        con.Open();
                        int rowsAffected = cmd.ExecuteNonQuery();
                        return rowsAffected > 0;
                    }
                    catch (Exception ex)
                    {
                        throw new Exception("Error al eliminar el detalle de la cita: " + ex.Message);
                    }
                }
            }
        }


    }
}

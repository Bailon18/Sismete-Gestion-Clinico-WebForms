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


        public BU_HISTORIAL GetHistorialByAlumno(string strCodAlu)
        {
            BU_HISTORIAL historial = null;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("spGetHistorialByAlumno", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@strCod_alu", strCodAlu);

                    try
                    {
                        con.Open();
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            if (reader.Read()) 
                            {
                                historial = new BU_HISTORIAL
                                {
                                    strCod_histo = reader["strCod_histo"].ToString(),
                                    strCod_alu = reader["strCod_alu"].ToString(),
                                    strCod_ser = reader["strCod_ser"].ToString(),
                                    strCod_Car = reader["strCod_Car"].ToString(),
                                    strCod_matric = reader["strCod_matric"].ToString(),
                                    dtFecha_histo = reader.IsDBNull(reader.GetOrdinal("dtFecha_histo")) ? (DateTime?)null : reader.GetDateTime(reader.GetOrdinal("dtFecha_histo")),
                                    strCod_Sede = reader["strCod_Sede"].ToString(),
                                    strCod_Fac = reader["strCod_Fac"].ToString(),
                                    bitEstado_histo = reader.IsDBNull(reader.GetOrdinal("bitEstado_histo")) ? (bool?)null : reader.GetBoolean(reader.GetOrdinal("bitEstado_histo")),
                                    strUserLog = reader["strUserLog"].ToString(),
                                    dtFechaLog = reader.IsDBNull(reader.GetOrdinal("dtFechaLog")) ? (DateTime?)null : reader.GetDateTime(reader.GetOrdinal("dtFechaLog")),
                                    strObs1_histo = reader["strObs1_histo"].ToString(),
                                    strObs2_histo = reader["strObs2_histo"].ToString(),
                                    decObs1_histo = reader.IsDBNull(reader.GetOrdinal("decObs1_histo")) ? (decimal?)null : reader.GetDecimal(reader.GetOrdinal("decObs1_histo")),
                                    decObs2_histo = reader.IsDBNull(reader.GetOrdinal("decObs2_histo")) ? (decimal?)null : reader.GetDecimal(reader.GetOrdinal("decObs2_histo")),
                                    bitObs1_histo = reader.IsDBNull(reader.GetOrdinal("bitObs1_histo")) ? (bool?)null : reader.GetBoolean(reader.GetOrdinal("bitObs1_histo")),
                                    bitObs2_histo = reader.IsDBNull(reader.GetOrdinal("bitObs2_histo")) ? (bool?)null : reader.GetBoolean(reader.GetOrdinal("bitObs2_histo")),
                                    dtObs1_histo = reader.IsDBNull(reader.GetOrdinal("dtObs1_histo")) ? (DateTime?)null : reader.GetDateTime(reader.GetOrdinal("dtObs1_histo")),
                                    dtObs2_histo = reader.IsDBNull(reader.GetOrdinal("dtObs2_histo")) ? (DateTime?)null : reader.GetDateTime(reader.GetOrdinal("dtObs2_histo")),
                                    strCod_medico = reader["strCod_medico"].ToString()
                                };
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        throw new Exception("Error al obtener historial por alumno: " + ex.Message);
                    }
                }
            }

            return historial;
        }

        public BU_DetalleHisto GetDetalleHistoByAlumno(string strCodAlu)
        {
            BU_DetalleHisto detalle = null;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("spGetDetalleHistoByAlumno", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@strCod_alu", strCodAlu);

                    try
                    {
                        con.Open();
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            if (reader.Read()) // Cambiado de `while` a `if` para obtener solo un registro
                            {
                                detalle = new BU_DetalleHisto
                                {
                                    StrCodDeta = reader["strCod_deta"].ToString(),
                                    StrCodHisto = reader["strCod_histo"].ToString(),
                                    StrCodAlu = reader["strCod_alu"].ToString(),
                                    StrCodSer = reader["strCod_ser"].ToString(),
                                    StrCodSede = reader["strCod_Sede"].ToString(),
                                    StrCodFac = reader["strCod_Fac"].ToString(),
                                    StrCodCar = reader["strCod_Car"].ToString(),
                                    StrCodMatric = reader["strCod_matric"].ToString(),
                                    StrCodSig = reader["strCod_sig"].ToString(),
                                    DtFechaDeta = reader.IsDBNull(reader.GetOrdinal("dtFecha_deta")) ? (DateTime?)null : reader.GetDateTime(reader.GetOrdinal("dtFecha_deta")),
                                    StrTipoAtenDeta = reader["strTipoAten_deta"].ToString(),
                                    StrMotConsDeta = reader["strMotCons_deta"].ToString(),
                                    StrEnfeActuDeta = reader["strEnfeActu_deta"].ToString(),
                                    StrDiasEnferDeta = reader["strDiasEnfer_deta"].ToString(),
                                    StrPatoloDeta = reader["strPatolo_deta"].ToString(),
                                    StrDiagnosticoDeta = reader["strDiagnostico_deta"].ToString(),
                                    StrTatamientoDeta = reader["strTatamiento_deta"].ToString(),
                                    StrEstadoDeta = reader["strEstado_deta"].ToString(),
                                    StrMedicamentoDeta = reader["strMedicamento_deta"].ToString(),
                                    StrCantidadDeta = reader["strCantidad_deta"].ToString(),
                                    StrDosisDeta = reader["strDosis_deta"].ToString(),
                                    StrCodEnferDeta = reader["strCodEnfer_deta"].ToString(),
                                    StrCuracionDeta = reader["strCuracion_deta"].ToString(),
                                    StrInyeccionDeta = reader["strInyeccion_deta"].ToString(),
                                    IntHijosDeta = reader.IsDBNull(reader.GetOrdinal("intHijos_deta")) ? (int?)null : reader.GetInt32(reader.GetOrdinal("intHijos_deta")),
                                    Str0a3Deta = reader["str0a3_deta"].ToString(),
                                    Str3a5Deta = reader["str3a5_deta"].ToString(),
                                    StrMayor7Deta = reader["strMayor7_deta"].ToString(),
                                    StrRnmascDeta = reader["strRnmasc_deta"].ToString(),
                                    StrRnfemeDeta = reader["strRnfeme_deta"].ToString(),
                                    StrPartoNorDeta = reader["strPartoNor_deta"].ToString(),
                                    StrPartoCesariDeta = reader["strPartoCesari_deta"].ToString(),
                                    StrUserLog = reader["strUserLog"].ToString(),
                                    DtFechaLog = reader.IsDBNull(reader.GetOrdinal("dtFechaLog")) ? (DateTime?)null : reader.GetDateTime(reader.GetOrdinal("dtFechaLog")),
                                    StrObs1Deta = reader["strObs1_deta"].ToString(),
                                    StrObs2Deta = reader["strObs2_deta"].ToString(),
                                    DecObs1Deta = reader.IsDBNull(reader.GetOrdinal("decObs1_deta")) ? (decimal?)null : reader.GetDecimal(reader.GetOrdinal("decObs1_deta")),
                                    DecObs2Deta = reader.IsDBNull(reader.GetOrdinal("decObs2_deta")) ? (decimal?)null : reader.GetDecimal(reader.GetOrdinal("decObs2_deta")),
                                    BitObs1Deta = reader.IsDBNull(reader.GetOrdinal("bitObs1_deta")) ? (bool?)null : reader.GetBoolean(reader.GetOrdinal("bitObs1_deta")),
                                    BitObs2Deta = reader.IsDBNull(reader.GetOrdinal("bitObs2_deta")) ? (bool?)null : reader.GetBoolean(reader.GetOrdinal("bitObs2_deta")),
                                    DtObs1Deta = reader.IsDBNull(reader.GetOrdinal("dtObs1_deta")) ? (DateTime?)null : reader.GetDateTime(reader.GetOrdinal("dtObs1_deta")),
                                    DtObs2Deta = reader.IsDBNull(reader.GetOrdinal("dtObs2_deta")) ? (DateTime?)null : reader.GetDateTime(reader.GetOrdinal("dtObs2_deta"))
                                };
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        throw new Exception("Error al obtener detalle de historial por alumno: " + ex.Message);
                    }
                }
            }

            return detalle; // Devuelve el detalle encontrado o null si no se encontró ninguno
        }

        public bool InsertarDetalleHisto(BU_DetalleHisto detalle)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("InsertarDetalleHisto", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@strCod_deta", detalle.StrCodDeta);
                    cmd.Parameters.AddWithValue("@strCod_histo", detalle.StrCodHisto);
                    cmd.Parameters.AddWithValue("@strCod_alu", detalle.StrCodAlu);
                    cmd.Parameters.AddWithValue("@strCod_ser", detalle.StrCodSer);
                    cmd.Parameters.AddWithValue("@strCod_Sede", detalle.StrCodSede ?? (object)DBNull.Value);
                    cmd.Parameters.AddWithValue("@strCod_Fac", detalle.StrCodFac ?? (object)DBNull.Value);
                    cmd.Parameters.AddWithValue("@strCod_Car", detalle.StrCodCar ?? (object)DBNull.Value);
                    cmd.Parameters.AddWithValue("@strCod_matric", detalle.StrCodMatric ?? (object)DBNull.Value);
                    cmd.Parameters.AddWithValue("@strCod_sig", detalle.StrCodSig ?? (object)DBNull.Value);
                    cmd.Parameters.AddWithValue("@dtFecha_deta", detalle.DtFechaDeta ?? (object)DBNull.Value);
                    cmd.Parameters.AddWithValue("@strTipoAten_deta", detalle.StrTipoAtenDeta ?? (object)DBNull.Value);
                    cmd.Parameters.AddWithValue("@strMotCons_deta", detalle.StrMotConsDeta ?? (object)DBNull.Value);
                    cmd.Parameters.AddWithValue("@strEnfeActu_deta", detalle.StrEnfeActuDeta ?? (object)DBNull.Value);
                    cmd.Parameters.AddWithValue("@strDiasEnfer_deta", detalle.StrDiasEnferDeta ?? (object)DBNull.Value);
                    cmd.Parameters.AddWithValue("@strPatolo_deta", detalle.StrPatoloDeta ?? (object)DBNull.Value);
                    cmd.Parameters.AddWithValue("@strDiagnostico_deta", detalle.StrDiagnosticoDeta ?? (object)DBNull.Value);
                    cmd.Parameters.AddWithValue("@strTatamiento_deta", detalle.StrTatamientoDeta ?? (object)DBNull.Value);
                    cmd.Parameters.AddWithValue("@strEstado_deta", detalle.StrEstadoDeta ?? (object)DBNull.Value);
                    cmd.Parameters.AddWithValue("@strMedicamento_deta", detalle.StrMedicamentoDeta ?? (object)DBNull.Value);
                    cmd.Parameters.AddWithValue("@strCantidad_deta", detalle.StrCantidadDeta ?? (object)DBNull.Value);
                    cmd.Parameters.AddWithValue("@strDosis_deta", detalle.StrDosisDeta ?? (object)DBNull.Value);
                    cmd.Parameters.AddWithValue("@strCodEnfer_deta", detalle.StrCodEnferDeta ?? (object)DBNull.Value);
                    cmd.Parameters.AddWithValue("@strCuracion_deta", detalle.StrCuracionDeta ?? (object)DBNull.Value);
                    cmd.Parameters.AddWithValue("@strInyeccion_deta", detalle.StrInyeccionDeta ?? (object)DBNull.Value);
                    cmd.Parameters.AddWithValue("@intHijos_deta", detalle.IntHijosDeta ?? (object)DBNull.Value);
                    cmd.Parameters.AddWithValue("@str0a3_deta", detalle.Str0a3Deta ?? (object)DBNull.Value);
                    cmd.Parameters.AddWithValue("@str3a5_deta", detalle.Str3a5Deta ?? (object)DBNull.Value);
                    cmd.Parameters.AddWithValue("@strMayor7_deta", detalle.StrMayor7Deta ?? (object)DBNull.Value);
                    cmd.Parameters.AddWithValue("@strRnmasc_deta", detalle.StrRnmascDeta ?? (object)DBNull.Value);
                    cmd.Parameters.AddWithValue("@strRnfeme_deta", detalle.StrRnfemeDeta ?? (object)DBNull.Value);
                    cmd.Parameters.AddWithValue("@strPartoNor_deta", detalle.StrPartoNorDeta ?? (object)DBNull.Value);
                    cmd.Parameters.AddWithValue("@strPartoCesari_deta", detalle.StrPartoCesariDeta ?? (object)DBNull.Value);
                    cmd.Parameters.AddWithValue("@strUserLog", detalle.StrUserLog ?? (object)DBNull.Value);
                    cmd.Parameters.AddWithValue("@dtFechaLog", detalle.DtFechaLog ?? (object)DBNull.Value);

                    SqlParameter resultadoParam = new SqlParameter("@Resultado", SqlDbType.Int)
                    {
                        Direction = ParameterDirection.Output
                    };
                    cmd.Parameters.Add(resultadoParam);

                    try
                    {
                        con.Open();
                        cmd.ExecuteNonQuery();

                        int resultado = (int)cmd.Parameters["@Resultado"].Value;
                        return resultado == 0;
                    }
                    catch (Exception ex)
                    {
                        throw new Exception("Error al insertar detalle del historial: " + ex.Message);
                    }
                }
            }
        }

        public bool ActualizarDetalleHisto(BU_DetalleHisto detalle)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("ActualizarDetalleHisto", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@strCod_deta", detalle.StrCodDeta);
                    cmd.Parameters.AddWithValue("@strCod_histo", detalle.StrCodHisto);
                    cmd.Parameters.AddWithValue("@strCod_alu", detalle.StrCodAlu);
                    cmd.Parameters.AddWithValue("@strCod_ser", detalle.StrCodSer);
                    cmd.Parameters.AddWithValue("@strCod_Sede", detalle.StrCodSede ?? (object)DBNull.Value);
                    cmd.Parameters.AddWithValue("@strCod_Fac", detalle.StrCodFac ?? (object)DBNull.Value);
                    cmd.Parameters.AddWithValue("@strCod_Car", detalle.StrCodCar ?? (object)DBNull.Value);
                    cmd.Parameters.AddWithValue("@strCod_matric", detalle.StrCodMatric ?? (object)DBNull.Value);
                    cmd.Parameters.AddWithValue("@strCod_sig", detalle.StrCodSig ?? (object)DBNull.Value);
                    cmd.Parameters.AddWithValue("@dtFecha_deta", detalle.DtFechaDeta ?? (object)DBNull.Value);
                    cmd.Parameters.AddWithValue("@strTipoAten_deta", detalle.StrTipoAtenDeta ?? (object)DBNull.Value);
                    cmd.Parameters.AddWithValue("@strMotCons_deta", detalle.StrMotConsDeta ?? (object)DBNull.Value);
                    cmd.Parameters.AddWithValue("@strEnfeActu_deta", detalle.StrEnfeActuDeta ?? (object)DBNull.Value);
                    cmd.Parameters.AddWithValue("@strDiasEnfer_deta", detalle.StrDiasEnferDeta ?? (object)DBNull.Value);
                    cmd.Parameters.AddWithValue("@strPatolo_deta", detalle.StrPatoloDeta ?? (object)DBNull.Value);
                    cmd.Parameters.AddWithValue("@strDiagnostico_deta", detalle.StrDiagnosticoDeta ?? (object)DBNull.Value);
                    cmd.Parameters.AddWithValue("@strTatamiento_deta", detalle.StrTatamientoDeta ?? (object)DBNull.Value);
                    cmd.Parameters.AddWithValue("@strEstado_deta", detalle.StrEstadoDeta ?? (object)DBNull.Value);
                    cmd.Parameters.AddWithValue("@strMedicamento_deta", detalle.StrMedicamentoDeta ?? (object)DBNull.Value);
                    cmd.Parameters.AddWithValue("@strCantidad_deta", detalle.StrCantidadDeta ?? (object)DBNull.Value);
                    cmd.Parameters.AddWithValue("@strDosis_deta", detalle.StrDosisDeta ?? (object)DBNull.Value);
                    cmd.Parameters.AddWithValue("@strCodEnfer_deta", detalle.StrCodEnferDeta ?? (object)DBNull.Value);
                    cmd.Parameters.AddWithValue("@strCuracion_deta", detalle.StrCuracionDeta ?? (object)DBNull.Value);
                    cmd.Parameters.AddWithValue("@strInyeccion_deta", detalle.StrInyeccionDeta ?? (object)DBNull.Value);
                    cmd.Parameters.AddWithValue("@intHijos_deta", detalle.IntHijosDeta ?? (object)DBNull.Value);
                    cmd.Parameters.AddWithValue("@str0a3_deta", detalle.Str0a3Deta ?? (object)DBNull.Value);
                    cmd.Parameters.AddWithValue("@str3a5_deta", detalle.Str3a5Deta ?? (object)DBNull.Value);
                    cmd.Parameters.AddWithValue("@strMayor7_deta", detalle.StrMayor7Deta ?? (object)DBNull.Value);
                    cmd.Parameters.AddWithValue("@strRnmasc_deta", detalle.StrRnmascDeta ?? (object)DBNull.Value);
                    cmd.Parameters.AddWithValue("@strRnfeme_deta", detalle.StrRnfemeDeta ?? (object)DBNull.Value);
                    cmd.Parameters.AddWithValue("@strPartoNor_deta", detalle.StrPartoNorDeta ?? (object)DBNull.Value);
                    cmd.Parameters.AddWithValue("@strPartoCesari_deta", detalle.StrPartoCesariDeta ?? (object)DBNull.Value);
                    cmd.Parameters.AddWithValue("@strUserLog", detalle.StrUserLog ?? (object)DBNull.Value);
                    cmd.Parameters.AddWithValue("@dtFechaLog", detalle.DtFechaLog ?? (object)DBNull.Value);

                    SqlParameter resultadoParam = new SqlParameter("@Resultado", SqlDbType.Int)
                    {
                        Direction = ParameterDirection.Output
                    };
                    cmd.Parameters.Add(resultadoParam);

                    try
                    {
                        con.Open();
                        cmd.ExecuteNonQuery();

                        int resultado = (int)cmd.Parameters["@Resultado"].Value;
                        return resultado == 0;
                    }
                    catch (Exception ex)
                    {
                        throw new Exception("Error al actualizar detalle del historial: " + ex.Message);
                    }
                }
            }
        }

    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using SistemaGestionHistorialClinico.Entidad;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace SistemaGestionHistorialClinico.Data
{
    public class BU_SIGNOVData
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["ConexionSQLServer"].ConnectionString;

        public bool InsertBU_SIGNOV(BU_SIGNOV signov)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("InsertBU_SIGNOV", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@strCod_sig", signov.strCod_sig);
                    cmd.Parameters.AddWithValue("@strCod_alu", signov.strCod_alu);
                    cmd.Parameters.AddWithValue("@strPreArt_sig", signov.strPreArt_sig);
                    cmd.Parameters.AddWithValue("@strTempera_sig", signov.strTempera_sig);
                    cmd.Parameters.AddWithValue("@strPulso_sig", signov.strPulso_sig);
                    cmd.Parameters.AddWithValue("@strFreRes_sig", signov.strFreRes_sig);
                    cmd.Parameters.AddWithValue("@strUserLog", signov.strUserLog);
                    cmd.Parameters.AddWithValue("@dtFechaLog", signov.dtFechaLog);

                    try
                    {
                        con.Open();
                        int rowsAffected = cmd.ExecuteNonQuery();
                        return rowsAffected > 0;
                    }
                    catch (Exception ex)
                    {
                        // Manejo de excepciones
                        throw new Exception("Error al insertar en BU_SIGNOV: " + ex.Message);
                    }
                }
            }
        }
    }
}
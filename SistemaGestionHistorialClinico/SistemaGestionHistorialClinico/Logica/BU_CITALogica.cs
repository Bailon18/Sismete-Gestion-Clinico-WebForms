using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using SistemaGestionHistorialClinico.Data;
using SistemaGestionHistorialClinico.Entidad;
using SistemaGestionHistorialClinico.Entidad.dto;

namespace SistemaGestionHistorialClinico.Logica
{
    public class BU_CITALogica
    {
        private BU_CITASData citaData = new BU_CITASData();

        public bool GuardarCita(BU_CITA cita)
        {
            try
            {
                return citaData.InsertarCita(cita);
            }
            catch (Exception ex)
            {
                throw new Exception("Error al guardar la cita: " + ex.Message);
            }
        }

        public bool VerificarCitaPorFecha(string codigoEstudiante, DateTime fecha)
        {
            try
            {
                return citaData.VerificarCitaPorFecha(codigoEstudiante, fecha);
            }
            catch (Exception ex)
            {
                throw new Exception("Error al verificar la cita: " + ex.Message);
            }
        }


        public List<CitaDTO> ObtenerCitasPorMedicoYFecha(string codigoMedico, DateTime fecha)
        {
            try
            {
                return citaData.ObtenerCitasPorMedicoYFecha(codigoMedico, fecha);
            }
            catch (Exception ex)
            {
                throw new Exception("Error al obtener citas por médico y fecha: " + ex.Message);
            }
        }

        public bool GuardarDetalleCita(BU_DETALLE_CITA detalleCita)
        {
            try
            {
                return citaData.InsertarDetalleCita(detalleCita);
            }
            catch (Exception ex)
            {
                throw new Exception("Error al guardar el detalle de la cita: " + ex.Message);
            }
        }

        public bool ActualizarDetalleCita(BU_DETALLE_CITA detalleCita)
        {
            try
            {
                return citaData.ActualizarDetalleCita(detalleCita);
            }
            catch (Exception ex)
            {
                throw new Exception("Error al actualizar el detalle de la cita: " + ex.Message);
            }
        }

        public BU_DETALLE_CITA ObtenerDetalleCita(string codigoCita)
        {
            try
            {
                return citaData.ObtenerDetalleCita(codigoCita);
            }
            catch (Exception ex)
            {
                throw new Exception("Error al obtener el detalle de la cita: " + ex.Message);
            }
        }

        public bool CambiarEstadoCita(string codigoCita)
        {
            try
            {
                return citaData.CambiarEstadoCita(codigoCita);
            }
            catch (Exception ex)
            {
                throw new Exception("Error al cambiar el estado de la cita: " + ex.Message);
            }
        }

        public bool eliminarDetallecita(string codigoCita) {
            return citaData.EliminarDetalleCita(codigoCita);
        }
    }
}

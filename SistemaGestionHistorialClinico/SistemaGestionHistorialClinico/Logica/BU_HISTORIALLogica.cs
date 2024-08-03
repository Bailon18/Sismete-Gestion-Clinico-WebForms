using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SistemaGestionHistorialClinico.Data;
using SistemaGestionHistorialClinico.Entidad;
using SistemaGestionHistorialClinico.Entidad.dto;

namespace SistemaGestionHistorialClinico.Logica
{
    public class BU_HISTORIALLogica
    {
        private BU_HISTORIALData historialData = new BU_HISTORIALData();

        public bool GuardarHistorial(BU_HISTORIAL historial)
        {
            return historialData.InsertBU_HISTORIAL(historial);
        }

        public List<AtencionDiaDTO> ObtenerAtencionesDelDia(string strCod_medico, DateTime fecha)
        {
            return historialData.GetAtencionesDelDia(strCod_medico, fecha);
        }

        public bool VerificarCitaExistente(string codigoEstudiante, string codigoProfesional, string codigoServicio, DateTime fecha)
        {
            return historialData.VerificarCitaExistente(codigoEstudiante, codigoProfesional, codigoServicio, fecha);
        }

        public bool ExisteHistorialParaEstudiante(string codigoEstudiante)
        {
            return historialData.ExisteHistorialParaEstudiante(codigoEstudiante);
        }

        public BU_HISTORIAL ObtenerHistorialPorAlumno(string strCodAlu)
        {
            return historialData.GetHistorialByAlumno(strCodAlu);
        }

        public BU_DetalleHisto ObtenerDetalleHistoPorAlumno(string strCodAlu)
        {
            return historialData.GetDetalleHistoByAlumno(strCodAlu);
        }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SistemaGestionHistorialClinico.Entidad.dto
{
    public class PacienteDTO
    {
        public string CodigoAlumno { get; set; }
        public string ApellidoPaterno { get; set; }
        public string ApellidoMaterno { get; set; }
        public string Nombre { get; set; }

        public string NombreCompleto
        {
            get { return $"{Nombre} {ApellidoPaterno} {ApellidoMaterno}".Trim(); }
        }
    }
}
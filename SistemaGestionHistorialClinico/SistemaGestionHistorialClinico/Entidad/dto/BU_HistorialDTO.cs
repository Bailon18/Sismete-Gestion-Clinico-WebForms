using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SistemaGestionHistorialClinico.Entidad.dto
{
    public class BU_HistorialDTO
    {
        public string StrCodHisto { get; set; } // Código de la historia
        public string Paciente { get; set; } // Código del paciente (nombre completo del paciente ) PERSONAL
         public string Servicio { get; set; } // Código del servicio (nombre del servicio)
        public string Carrera { get; set; } // Nombre de la carrera
        public string CodigoMatricula { get; set; } // Código de matrícula
        public string Sede { get; set; } // Nombre de la sede
        public string Facultad { get; set; } // Nombre de la facultad
        public DateTime? DtFechaHisto { get; set; } // Fecha de la historia
        public bool? BitEstadoHisto { get; set; } // Estado de la historia (activo/inactivo)
        public string StrUserLog { get; set; } // Usuario que registra la acción
        public DateTime? DtFechaLog { get; set; } // Fecha del log
    }

}
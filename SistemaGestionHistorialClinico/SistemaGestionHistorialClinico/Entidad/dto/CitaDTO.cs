using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SistemaGestionHistorialClinico.Entidad.dto
{
    public class CitaDTO
    {
        public string CodigoCita { get; set; }
        public string CodigoPaciente { get; set; }
        public string NombreCompletoPaciente { get; set; }
        public string NombreServicio { get; set; }
        public DateTime FechaCita { get; set; }
        public string Estado { get; set; }
    }
}
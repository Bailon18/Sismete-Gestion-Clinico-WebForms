using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SistemaGestionHistorialClinico.Entidad.dto
{
    public class AtencionDiaDTO
    {
        public string strCod_histo { get; set; }
        public string strCod_alu { get; set; }
        public string NombreCompleto { get; set; }
        public string strNombre_ser { get; set; }
        public DateTime dtFecha_histo { get; set; }
        public bool bitEstado_histo { get; set; }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


namespace SistemaGestionHistorialClinico.Entidad
{
    public class BU_CITA
    {
        public string strCod_cita { get; set; }
        public string strCod_alu { get; set; }
        public string strCod_ser { get; set; }
        public DateTime dtFecha_cita { get; set; }
        public string strEstado_cita { get; set; }
        public string strUserLog { get; set; }
        public DateTime? dtFechaLog { get; set; }
    }
}

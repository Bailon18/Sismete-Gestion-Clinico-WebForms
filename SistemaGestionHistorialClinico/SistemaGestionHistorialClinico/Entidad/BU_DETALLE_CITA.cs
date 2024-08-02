using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


namespace SistemaGestionHistorialClinico.Entidad
{
    public class BU_DETALLE_CITA
    {
        public string strCod_detacita { get; set; }
        public string strCod_cita { get; set; }
        public string strDescripcion { get; set; }
        public string strObservaciones { get; set; }
        public string strUserLog { get; set; }
        public DateTime dtFechaLog { get; set; }
    }
}

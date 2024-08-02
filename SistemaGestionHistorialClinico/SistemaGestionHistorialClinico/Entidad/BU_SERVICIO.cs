using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SistemaGestionHistorialClinico.Entidad
{
    public class BU_SERVICIO
    {
        public string strCod_ser { get; set; }
        public string strNombre_ser { get; set; }
        public string strUserLog { get; set; }
        public DateTime? dtFechaLog { get; set; }
        public string strObs1_ser { get; set; }
        public string strObs2_ser { get; set; }
        public decimal? decObs1_ser { get; set; }
        public decimal? decObs2_ser { get; set; }
        public bool? bitObs1_ser { get; set; }
        public bool? bitObs2_ser { get; set; }
        public DateTime? dtObs1_ser { get; set; }
        public DateTime? dtObs2_ser { get; set; }
    }
}

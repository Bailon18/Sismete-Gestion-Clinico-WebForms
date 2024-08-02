using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SistemaGestionHistorialClinico.Entidad
{
    public class BU_HISTORIAL
    {
        public string strCod_histo { get; set; }
        public string strCod_alu { get; set; }
        public string strCod_ser { get; set; }
        public string strCod_Car { get; set; }
        public string strCod_matric { get; set; }
        public DateTime? dtFecha_histo { get; set; }
        public string strCod_Sede { get; set; }
        public string strCod_Fac { get; set; }
        public bool? bitEstado_histo { get; set; }
        public string strUserLog { get; set; }
        public DateTime? dtFechaLog { get; set; }
        public string strObs1_histo { get; set; }
        public string strObs2_histo { get; set; }
        public decimal? decObs1_histo { get; set; }
        public decimal? decObs2_histo { get; set; }
        public bool? bitObs1_histo { get; set; }
        public bool? bitObs2_histo { get; set; }
        public DateTime? dtObs1_histo { get; set; }
        public DateTime? dtObs2_histo { get; set; }
        public string strCod_medico { get; set; }
    }
}

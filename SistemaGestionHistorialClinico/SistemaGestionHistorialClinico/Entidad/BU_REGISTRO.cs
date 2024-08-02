using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


namespace SistemaGestionHistorialClinico.Entidad
{
    public class BU_REGISTRO
    {
        public string strCod_reg { get; set; }
        public string strCod_alu { get; set; }
        public string strCod_Car { get; set; }
        public string strCod_Sede { get; set; }
        public string strCod_Fac { get; set; }
        public string strUserLog { get; set; }
        public DateTime? dtFechaLog { get; set; }
        public string strObs1_reg { get; set; }
        public string strObs2_reg { get; set; }
        public decimal? decObs1_reg { get; set; }
        public decimal? decObs2_reg { get; set; }
        public bool? bitObs1_reg { get; set; }
        public bool? bitObs2_reg { get; set; }
        public DateTime? dtObs1_reg { get; set; }
        public DateTime? dtObs2_reg { get; set; }
    }
}

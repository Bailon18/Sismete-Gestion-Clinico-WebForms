using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


namespace SistemaGestionHistorialClinico.Entidad
{
    public class BU_SIGNOV
    {
        public string strCod_sig { get; set; }
        public string strCod_alu { get; set; }
        public string strPreArt_sig { get; set; }
        public string strTempera_sig { get; set; }
        public string strPulso_sig { get; set; }
        public string strFreRes_sig { get; set; }
        public string strUserLog { get; set; }
        public DateTime? dtFechaLog { get; set; }
        public string strObs1_sig { get; set; }
        public string strObs2_sig { get; set; }
        public decimal? decObs1_sig { get; set; }
        public decimal? decObs2_sig { get; set; }
        public bool? bitObs1_sig { get; set; }
        public bool? bitObs2_sig { get; set; }
        public DateTime? dtObs1_sig { get; set; }
        public DateTime? dtObs2_sig { get; set; }
    }
}

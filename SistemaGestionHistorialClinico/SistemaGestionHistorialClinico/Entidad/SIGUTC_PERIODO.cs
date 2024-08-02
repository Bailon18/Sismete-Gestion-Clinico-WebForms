using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


namespace SistemaGestionHistorialClinico.Entidad
{
    public class SIGUTC_PERIODO
    {
        public string strCod_per { get; set; }
        public int? intNum_per { get; set; }
        public int? intNumSemanas_per { get; set; }
        public string strCod_regim { get; set; }
        public string strCod_Sede { get; set; }
        public string strCod_Fac { get; set; }
        public string strCod_Car { get; set; }
        public string strNombre_per { get; set; }
        public DateTime? dtFechaIni_per { get; set; }
        public DateTime? dtFechaFin_per { get; set; }
        public string strCod_malla { get; set; }
        public string strEstado_per { get; set; }
        public DateTime? dtFecha_log { get; set; }
        public string strUser_log { get; set; }
        public string strObs1_per { get; set; }
        public string strObs2_per { get; set; }
        public string strNombreCorto_per { get; set; }
        public bool? bitEstado_per { get; set; }
    }
}

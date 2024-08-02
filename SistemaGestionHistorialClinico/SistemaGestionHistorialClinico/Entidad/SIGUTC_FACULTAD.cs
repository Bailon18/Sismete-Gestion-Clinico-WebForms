using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


namespace SistemaGestionHistorialClinico.Entidad
{
    public class SIGUTC_FACULTAD
    {
        public string strCod_Fac { get; set; }
        public string strNombre_Fac { get; set; }
        public string strCod_OrgC { get; set; }
        public string strCedDecano_Fac { get; set; }
        public string strCedSubDec_Fac { get; set; }
        public string strEstado_Fac { get; set; }
        public string strTipo_Fac { get; set; }
        public string strCedCoor_Fac { get; set; }
        public string strCod_Sede { get; set; }
        public string strObs1_Fac { get; set; }
        public string strObs2_Fac { get; set; }
        public string strObs3_Fac { get; set; }
        public DateTime? dtFecha_log { get; set; }
        public string strUser_log { get; set; }
        public bool? bitEstado_fac { get; set; }
    }
}

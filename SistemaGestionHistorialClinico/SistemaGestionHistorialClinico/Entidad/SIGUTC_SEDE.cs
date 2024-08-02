using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SistemaGestionHistorialClinico.Entidad
{
    public class SIGUTC_SEDE
    {
        public string strCod_Sede { get; set; }
        public string strNombre_Sede { get; set; }
        public string strTipo_Sede { get; set; }
        public string strCod_OrgC { get; set; }
        public string strDir_sede { get; set; }
        public string strSubDir_sede { get; set; }
        public string strSubDirAdm_sede { get; set; }
        public string strObs1_sede { get; set; }
        public string strObs2_sede { get; set; }
        public string strObs3_sede { get; set; }
        public DateTime? dtFecha_log { get; set; }
        public string strUser_log { get; set; }
        public bool? bitEstado_sede { get; set; }
    }
}

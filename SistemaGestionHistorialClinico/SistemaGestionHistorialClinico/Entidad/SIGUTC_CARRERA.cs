using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


namespace SistemaGestionHistorialClinico.Entidad
{
    public class SIGUTC_CARRERA
    {
        public string strCod_Car { get; set; }
        public string strNombre_Car { get; set; }
        public string strCod_OrgC { get; set; }
        public string strCedDirector_Car { get; set; }
        public string strEstado_Car { get; set; }
        public string strTipo_Car { get; set; }
        public string strGrupo_Car { get; set; }
        public int? intMatricula_Car { get; set; }
        public int? intFolio_Car { get; set; }
        public string strCedCoor_Car { get; set; }
        public string strCod_Sede { get; set; }
        public string strCod_Fac { get; set; }
        public string strObs1_car { get; set; }
        public string strObs2_Car { get; set; }
        public string strObs3_Car { get; set; }
        public string strObs4_Car { get; set; }
        public string strModalidad_Car { get; set; }
        public string strCampus_Car { get; set; }
        public DateTime? dtFecha_log { get; set; }
    }
}

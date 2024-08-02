using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


namespace SistemaGestionHistorialClinico.Entidad
{
    public class SIGUTC_MATRICULA
    {
        public string strCod_matric { get; set; }
        public string strCod_per { get; set; }
        public string strCod_alu { get; set; }
        public string intCod_nivel { get; set; }
        public DateTime? dtFechaCrea_matric { get; set; }
        public bool? bitEstado_matric { get; set; }
        public int? intRepeticion_matric { get; set; }
        public bool? bitBan1_matric { get; set; }
        public bool? bitBan2_matric { get; set; }
        public decimal? decVal1_matric { get; set; }
        public decimal? decVal2_matric { get; set; }
        public decimal? decVal3_matric { get; set; }
        public string strObs1_matric { get; set; }
        public string strObs2_matric { get; set; }
        public string strObs3_matric { get; set; }
        public DateTime? dtFec1_matric { get; set; }
        public DateTime? dtFec2_matric { get; set; }
        public DateTime? dtFec3_matric { get; set; }
        public DateTime? dtFecha_log { get; set; }
        public string strUser_log { get; set; }
    }
}

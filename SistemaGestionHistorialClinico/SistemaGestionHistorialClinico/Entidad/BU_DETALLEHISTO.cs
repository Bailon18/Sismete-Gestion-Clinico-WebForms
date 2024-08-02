using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


namespace SistemaGestionHistorialClinico.Entidad
{
    public class BU_DETALLEHISTO
    {
        public int strCod_deta { get; set; }
        public string strCod_histo { get; set; }
        public string strCod_alu { get; set; }
        public string strCod_ser { get; set; }
        public string strCod_Sede { get; set; }
        public string strCod_Fac { get; set; }
        public string strCod_Car { get; set; }
        public string strCod_matric { get; set; }
        public string strCod_sig { get; set; }
        public DateTime? dtFecha_deta { get; set; }
        public string strTipoAten_deta { get; set; }
        public string strMotCons_deta { get; set; }
        public string strEnfeActu_deta { get; set; }
        public string strDiasEnfer_deta { get; set; }
        public string strPatolo_deta { get; set; }
        public string strDiagnostico_deta { get; set; }
        public string strTatamiento_deta { get; set; }
        public string strEstado_deta { get; set; }
        public string strMedicamento_deta { get; set; }
        public string strCantidad_deta { get; set; }
        public string strDosis_deta { get; set; }
        public string strCodEnfer_deta { get; set; }
        public string strCuracion_deta { get; set; }
        public string strInyeccion_deta { get; set; }
        public int? intHijos_deta { get; set; }
        public string str0a3_deta { get; set; }
        public string str3a5_deta { get; set; }
        public string strMayor7_deta { get; set; }
        public string strRnmasc_deta { get; set; }
        public string strRnfeme_deta { get; set; }
        public string strPartoNor_deta { get; set; }
        public string strPartoCesari_deta { get; set; }
        public string strUserLog { get; set; }
        public DateTime? dtFechaLog { get; set; }
        public string strObs1_deta { get; set; }
        public string strObs2_deta { get; set; }
        public decimal? decObs1_deta { get; set; }
        public decimal? decObs2_deta { get; set; }
        public bool? bitObs1_deta { get; set; }
        public bool? bitObs2_deta { get; set; }
        public DateTime? dtObs1_deta { get; set; }
        public DateTime? dtObs2_deta { get; set; }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


namespace SistemaGestionHistorialClinico.Entidad
{

    public class BU_DetalleHisto
    {
        public string StrCodDeta { get; set; }
        public string StrCodHisto { get; set; }
        public string StrCodAlu { get; set; }
        public string StrCodSer { get; set; }

        // inicii apartir de aqui se dejara null
        public string StrCodSede { get; set; } 
        public string StrCodFac { get; set; } 
        public string StrCodCar { get; set; } 
        public string StrCodMatric { get; set; } 
        public string StrCodSig { get; set; }
        // fin apartir de aqui se dejara null


        public DateTime? DtFechaDeta { get; set; }
        public string StrTipoAtenDeta { get; set; }
        public string StrMotConsDeta { get; set; }
        public string StrEnfeActuDeta { get; set; }
        public string StrDiasEnferDeta { get; set; }
        public string StrPatoloDeta { get; set; }
        public string StrDiagnosticoDeta { get; set; }
        public string StrTatamientoDeta { get; set; }
        public string StrEstadoDeta { get; set; }
        public string StrMedicamentoDeta { get; set; }
        public string StrCantidadDeta { get; set; }
        public string StrDosisDeta { get; set; }
        public string StrCodEnferDeta { get; set; }
        public string StrCuracionDeta { get; set; }
        public string StrInyeccionDeta { get; set; }
        public int? IntHijosDeta { get; set; }

        // inicio apartir de aca se dejara todo null
        public string Str0a3Deta { get; set; }
        public string Str3a5Deta { get; set; }
        public string StrMayor7Deta { get; set; }
        public string StrRnmascDeta { get; set; }
        public string StrRnfemeDeta { get; set; }
        public string StrPartoNorDeta { get; set; }
        public string StrPartoCesariDeta { get; set; }
        public string StrUserLog { get; set; }
        public DateTime? DtFechaLog { get; set; }
        public string StrObs1Deta { get; set; }
        public string StrObs2Deta { get; set; }
        public decimal? DecObs1Deta { get; set; }
        public decimal? DecObs2Deta { get; set; }
        public bool? BitObs1Deta { get; set; }
        public bool? BitObs2Deta { get; set; }
        public DateTime? DtObs1Deta { get; set; }
        public DateTime? DtObs2Deta { get; set; }
        // fin apartir de aca se dejara todo null

    }


}

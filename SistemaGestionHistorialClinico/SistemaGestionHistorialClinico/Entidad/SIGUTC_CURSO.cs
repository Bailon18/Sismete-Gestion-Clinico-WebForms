using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


namespace SistemaGestionHistorialClinico.Entidad
{
    public class SIGUTC_CURSO
    {
        public string strCod_curso { get; set; }
        public string intCod_nivel { get; set; }
        public string strParalelo_curso { get; set; }
        public int? intCupos_curso { get; set; }
        public int? intCapacidad_curso { get; set; }
        public string strCod_aula { get; set; }
        public string strJornada_curso { get; set; }
        public string strCod_malla { get; set; }
        public string strTipo_curso { get; set; }
        public string strCod_per { get; set; }
        public string strObs1_curso { get; set; }
        public string strObs2_curso { get; set; }
    }
}

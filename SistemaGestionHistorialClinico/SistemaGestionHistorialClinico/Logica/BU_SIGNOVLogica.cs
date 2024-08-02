using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SistemaGestionHistorialClinico.Data;
using SistemaGestionHistorialClinico.Entidad;

namespace SistemaGestionHistorialClinico.Logica
{
    public class BU_SIGNOVLogica
    {
        private BU_SIGNOVData signovData = new BU_SIGNOVData();

        public bool InsertBU_SIGNOV(BU_SIGNOV signov)
        {
            return signovData.InsertBU_SIGNOV(signov);
        }
    }
}
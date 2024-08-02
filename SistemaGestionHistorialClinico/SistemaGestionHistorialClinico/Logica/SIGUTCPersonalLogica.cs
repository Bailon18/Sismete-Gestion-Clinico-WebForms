using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using SistemaGestionHistorialClinico.Data;
using SistemaGestionHistorialClinico.Entidad;


namespace SistemaGestionHistorialClinico.Logica
{
    public class SIGUTCPersonalLogica
    {
        private SIGUTCPersonalData personalData;

        public SIGUTCPersonalLogica()
        {
            personalData = new SIGUTCPersonalData();
        }

        public List<SIGUTCPERSONAL> ObtenerPersonasPorRol(string rol)
        {
            return personalData.ListarPersonasPorRol(rol);
        }

        public List<SIGUTCPERSONAL> ObtenerTodasLasPersonasMenosEstudiantes()
        {
            return personalData.ListarTodosMenosEstudiante();
        }

        public SIGUTCPERSONAL ValidarCredenciales(string username, string password)
        {
            return personalData.ObtenerPersonalPorCredenciales(username, password);
        }

    }
}

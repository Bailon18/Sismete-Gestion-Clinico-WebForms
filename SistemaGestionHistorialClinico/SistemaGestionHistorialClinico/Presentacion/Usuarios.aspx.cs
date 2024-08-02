using System;
using System.Collections.Generic;
using SistemaGestionHistorialClinico.Logica;
using SistemaGestionHistorialClinico.Entidad;

namespace SistemaGestionHistorialClinico.Presentacion
{
    public partial class Usuarios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarUsuarios();
            }
        }

        private void CargarUsuarios()
        {
            SIGUTCPersonalLogica personalLogica = new SIGUTCPersonalLogica();
            List<SIGUTCPERSONAL> listaUsuarios = personalLogica.ObtenerTodasLasPersonasMenosEstudiantes();

            gvUsuarios.DataSource = listaUsuarios;
            gvUsuarios.DataBind();
        }
    }
}

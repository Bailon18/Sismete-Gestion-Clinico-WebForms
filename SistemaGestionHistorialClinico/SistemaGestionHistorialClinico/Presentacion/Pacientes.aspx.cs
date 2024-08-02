using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using SistemaGestionHistorialClinico.Logica;
using SistemaGestionHistorialClinico.Entidad;


namespace SistemaGestionHistorialClinico.Presentacion
{
    public partial class Pacientes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarPacientes();
            }
        }

        private void CargarPacientes()
        {
            SIGUTCPersonalLogica personalLogica = new SIGUTCPersonalLogica();
            List<SIGUTCPERSONAL> listaPacientes = personalLogica.ObtenerPersonasPorRol("ESTUDIANTE");

            gvPacientes.DataSource = listaPacientes;
            gvPacientes.DataBind();
        }

        protected void gvPacientes_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string codigoPaciente = e.CommandArgument.ToString();
            if (e.CommandName == "VerHistorial")
            {
                // Lógica para ver el historial clínico del paciente
                Response.Redirect($"HistorialClinico.aspx?codigo={codigoPaciente}");
            }
            else if (e.CommandName == "VerCitas")
            {
                // Lógica para ver las citas del paciente
                Response.Redirect($"CitasPaciente.aspx?codigo={codigoPaciente}");
            }
        }
    }
}

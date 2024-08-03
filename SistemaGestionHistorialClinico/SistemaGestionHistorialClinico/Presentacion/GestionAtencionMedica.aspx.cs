using System;
using System.Linq;
using System.Web.UI;
using SistemaGestionHistorialClinico.Logica;
using System.Web.UI.WebControls;
using System.Web;

namespace SistemaGestionHistorialClinico.Presentacion
{
    public partial class GestionAtencionMedica : Page
    {
        private SIGUTCPersonalLogica personalLogica = new SIGUTCPersonalLogica();
        private BU_HISTORIALLogica historialLogica = new BU_HISTORIALLogica();
        private BU_CITALogica citalogica = new BU_CITALogica();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarEstudiantes();
            }
        }

        private void CargarEstudiantes()
        {
            var estudiantes = personalLogica.ObtenerPersonasPorRol("ESTUDIANTE");
            var estudiantesConApellidos = estudiantes.Select(est => new
            {
                est.strCod_alu,
                NombreCompleto = $"{est.NOMBRE_ALU} {est.APELLIDO_ALU} {est.APELLIDOM_ALU}"
            }).ToList();

            ddlEstudiantes.DataSource = estudiantesConApellidos;
            ddlEstudiantes.DataTextField = "NombreCompleto";
            ddlEstudiantes.DataValueField = "strCod_alu";
            ddlEstudiantes.DataBind();
            ddlEstudiantes.Items.Insert(0, new ListItem("Seleccione un Estudiante", ""));
        }

        protected void btnConfirmar_Click(object sender, EventArgs e)
        {
            string servicioSeleccionado = hfServicioSeleccionado.Value;
            string estudianteCod = ddlEstudiantes.SelectedValue;
            string estudianteNombreCompleto = ddlEstudiantes.SelectedItem.Text;
            string profesionalCod = ddlProfesionales.SelectedValue;
            string profesionalNombreCompleto = ddlProfesionales.SelectedItem.Text;
            string servicioCod = "";

            switch (servicioSeleccionado)
            {
                case "Medicina General":
                    servicioCod = "SRMG";
                    break;
                case "Odontología":
                    servicioCod = "SROD";
                    break;
                case "Psicología":
                    servicioCod = "SRPS";
                    break;
            }

            // Verificar si ya existe una cita para Medicina General
            if (servicioSeleccionado == "Medicina General")
            {
                // Verificar si ya existe una cita para hoy
                if (citalogica.VerificarCitaPorFecha(ddlEstudiantes.SelectedValue, DateTime.Now.Date))
                {
                    string script = $"Swal.fire('Cita Existente', 'El paciente {estudianteNombreCompleto} ya tiene una cita de Medicina General para hoy.', 'error');";
                    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", script, true);
                    return;
                }
            }

            if (servicioSeleccionado == "Odontología" || servicioSeleccionado == "Psicología")
            {
                Response.Redirect($"Citas.aspx?servicioCod={HttpUtility.UrlEncode(servicioCod)}");
            }
            else if (servicioSeleccionado == "Medicina General")
            {
                string url = $"Triaje.aspx?estudianteCod={HttpUtility.UrlEncode(estudianteCod)}&estudianteNombreCompleto={HttpUtility.UrlEncode(estudianteNombreCompleto)}&profesionalCod={HttpUtility.UrlEncode(profesionalCod)}&profesionalNombreCompleto={HttpUtility.UrlEncode(profesionalNombreCompleto)}&servicioCod={HttpUtility.UrlEncode(servicioCod)}";
                Response.Redirect(url);
            }
        }

        protected void btnServicioSeleccionado_Click(object sender, EventArgs e)
        {
            string servicioSeleccionado = hfServicioSeleccionado.Value;

            switch (servicioSeleccionado)
            {
                case "Medicina General":
                    CargarProfesionales("MEDICO");
                    break;
                case "Odontología":
                    CargarProfesionales("ODONTOLOGO");
                    break;
                case "Psicología":
                    CargarProfesionales("PSICOLOGO");
                    break;
            }
        }

        private void CargarProfesionales(string rol)
        {
            var profesionales = personalLogica.ObtenerPersonasPorRol("MEDICO");
            var profesionalesConApellidos = profesionales.Select(pro => new
            {
                pro.strCod_alu,
                NombreCompleto = $"{pro.NOMBRE_ALU} {pro.APELLIDO_ALU} {pro.APELLIDOM_ALU}"
            }).ToList();

            ddlProfesionales.DataSource = profesionalesConApellidos;
            ddlProfesionales.DataTextField = "NombreCompleto";
            ddlProfesionales.DataValueField = "strCod_alu";
            ddlProfesionales.DataBind();
            ddlProfesionales.Items.Insert(0, new ListItem("Seleccione un Profesional", ""));
        }
    }
}

using System;
using System.Linq;
using System.Web.UI;
using SistemaGestionHistorialClinico.Logica;
using System.Web.UI.WebControls;
using System.Web;
using System.Web.Services;
using SistemaGestionHistorialClinico.Entidad.dto;
using System.Collections.Generic;


using System.Web.Script.Services;


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
            }
        }



        protected void btnConfirmar_Click(object sender, EventArgs e)
        {
            string servicioSeleccionado = hfServicioSeleccionado.Value;
            string estudianteCod = hfEstudianteCodigo.Value;
            string estudianteNombreCompleto = hfEstudianteNombreCompleto.Value;
            string profesionalCod = ddlProfesionales.SelectedValue;
            string profesionalNombreCompleto = ddlProfesionales.SelectedItem.Text;
            string servicioCod = "";



            DateTime fechaCita = calFechaCita.SelectedDate;



            if (string.IsNullOrEmpty(profesionalCod))
            {
                string script = "Swal.fire('Selección requerida', 'Por favor, seleccione un profesional para continuar.', 'warning');";
                ScriptManager.RegisterStartupScript(this, GetType(), "alertNoProfessional", script, true);
                return;
            }

            if (string.IsNullOrEmpty(estudianteCod) || string.IsNullOrEmpty(estudianteNombreCompleto))
            {
                string script = "Swal.fire('Selección requerida', 'Por favor, seleccione un estudiante para continuar.', 'warning');";
                ScriptManager.RegisterStartupScript(this, GetType(), "alertNoStudent", script, true);
                return;
            }

            if (fechaCita == DateTime.MinValue)
            {
                string script = "Swal.fire('Selección requerida', 'Por favor, seleccione una fecha para la cita.', 'warning');";
                ScriptManager.RegisterStartupScript(this, GetType(), "alertNoDateSelected", script, true);
                return;
            }


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


            //if (servicioSeleccionado == "Medicina General")
            //{
                // aqui validar si tiene esa fecha pero segun tambien servicio 
                if (citalogica.VerificarCitaPorFecha(estudianteCod, fechaCita))
                {
                
                    string alertScript = $"Swal.fire('Cita Existente', 'El paciente {estudianteNombreCompleto} ya tiene una cita registrada para la fecha: {fechaCita}', 'error');";
                    ScriptManager.RegisterStartupScript(this, GetType(), "showAlertExist", alertScript, true);
                    return;
                }
            //}

            //if (servicioSeleccionado == "Odontología" || servicioSeleccionado == "Psicología")
            //{

                
            //}
            //else if (servicioSeleccionado == "Medicina General")
            //{

                txtEstudiante.Text = string.Empty;
                ddlProfesionales.ClearSelection();

                hfEstudianteCodigo.Value = string.Empty;
                hfEstudianteNombreCompleto.Value = string.Empty;

                string formattedDate = HttpUtility.UrlEncode(fechaCita.ToString());
                string url = $"Triaje.aspx?estudianteCod={HttpUtility.UrlEncode(estudianteCod)}&estudianteNombreCompleto={HttpUtility.UrlEncode(estudianteNombreCompleto)}&profesionalCod={HttpUtility.UrlEncode(profesionalCod)}&profesionalNombreCompleto={HttpUtility.UrlEncode(profesionalNombreCompleto)}&servicioCod={HttpUtility.UrlEncode(servicioCod)}&fechaCita={formattedDate}";
                Response.Redirect(url);

            //}
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
            var profesionales = personalLogica.ObtenerPersonasPorRol(rol);
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

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static List<PacienteDTO> BuscarEstudiantes(string prefixText)
        {
            SIGUTCPersonalLogica personalLogica = new SIGUTCPersonalLogica();
            var estudiantes = personalLogica.BuscarPersonas(prefixText);

            return estudiantes.Select(est => new PacienteDTO
            {
                CodigoAlumno = est.CodigoAlumno,
                ApellidoPaterno = est.ApellidoMaterno,
                ApellidoMaterno = est.ApellidoMaterno,
                Nombre = est.Nombre
            }).ToList();
        }

        protected void calFechaCita_DayRender(object sender, DayRenderEventArgs e)
        {
            if (e.Day.IsOtherMonth)
            {
                e.Cell.CssClass = "other-month";
            }
            if (e.Day.Date.DayOfWeek == DayOfWeek.Saturday || e.Day.Date.DayOfWeek == DayOfWeek.Sunday)
            {
                e.Day.IsSelectable = false;
                e.Cell.CssClass = "style-disabled"; 
            }
            if (e.Day.IsSelected)
            {
                e.Cell.CssClass = "selected-day"; 
            }
        }


    }
}

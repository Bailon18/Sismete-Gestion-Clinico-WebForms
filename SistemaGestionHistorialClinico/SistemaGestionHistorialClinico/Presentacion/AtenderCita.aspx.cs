using SistemaGestionHistorialClinico.Entidad;
using SistemaGestionHistorialClinico.Logica;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Diagnostics;

namespace SistemaGestionHistorialClinico.Presentacion
{
    public partial class AtenderCita : System.Web.UI.Page
    {
        private BU_CITALogica citalogica = new BU_CITALogica();
        CodeGenerator codeGenerator = new CodeGenerator();
        private string estadoCita = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string paciente = Request.QueryString["nombrePaciente"];
                string servicio = Request.QueryString["servicio"];
                string fechaCita = Request.QueryString["fechaCita"];
                estadoCita = Request.QueryString["estado"];

                Debug.WriteLine($"Estado en initr: {estadoCita}");

                lblPaciente.Text = paciente;
                lblServicio.Text = servicio;
                lblFechaCita.Text = fechaCita;

                ViewState["estadoCita"] = estadoCita;

                if (estadoCita == "Atendido")
                {
                    btnGuardar.Text = "Actualizar";
                    string codigoCita = Request.QueryString["codigoCita"];
                    BU_DETALLE_CITA detalleCita = citalogica.ObtenerDetalleCita(codigoCita);

                    if (detalleCita != null)
                    {
                        txtDescripcion.Text = detalleCita.strDescripcion;
                        txtObservaciones.Text = detalleCita.strObservaciones;
                    }
                }
                else
                {
                    btnGuardar.Text = "Guardar";
                }
            }
            else
            {
                estadoCita = ViewState["estadoCita"] as string;
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            BU_DETALLE_CITA detalleCita = new BU_DETALLE_CITA
            {
                strCod_detacita = codeGenerator.GenerateCode("CITADETALLE", 6),
                strCod_cita = Request.QueryString["codigoCita"],
                strDescripcion = txtDescripcion.Text,
                strObservaciones = txtObservaciones.Text,
                strUserLog = Session["Codigo"] as string,
                dtFechaLog = DateTime.Now
            };

            BU_CITALogica logica = new BU_CITALogica();


            estadoCita = ViewState["estadoCita"] as string;
            Debug.WriteLine($"Estado antes de actualizaro o agregar: {estadoCita}");
            Debug.WriteLine($"codigo : {detalleCita.strCod_cita}");



            if (estadoCita == "Atendido")
            {
                bool result = logica.ActualizarDetalleCita(detalleCita);

     
                if (result)
                {

                    ScriptManager.RegisterStartupScript(this, GetType(), "guardadoExitoso", @"
                    Swal.fire({
                        title: 'Actualizado',
                        text: 'Detalle de cita actualizado correctamente.'
                    }).then(function() {
                        window.location.href = 'AtencionMedicina.aspx';
                    });", true);

                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "errorActualizacion", "Swal.fire('Error','Error al actualizar el detalle de la cita.','error');", true);
                }
            }
            else
            {
                bool result = logica.GuardarDetalleCita(detalleCita);
                if (result)
                {
 
                    ScriptManager.RegisterStartupScript(this, GetType(), "guardadoExitoso", @"
                    Swal.fire({
                        title: 'Nuevo',
                        text: 'Detalle de cita guardado correctamente.'
                    }).then(function() {
                        window.location.href = 'AtencionMedicina.aspx';
                    });", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "errorGuardado", "Swal.fire('Error','Error al guardar el detalle de la cita.','error');", true);
                }
            }

            // Redirigir después de la operación
            //Response.Redirect("AtencionMedicina.aspx");
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("AtencionMedicina.aspx");
        }

    }
}
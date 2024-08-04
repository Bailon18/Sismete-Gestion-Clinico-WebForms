using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using SistemaGestionHistorialClinico.Entidad;
using SistemaGestionHistorialClinico.Logica;


namespace SistemaGestionHistorialClinico.Presentacion
{
    public partial class Triaje : System.Web.UI.Page
    {
        private SIGUTCPersonalLogica personalLogica = new SIGUTCPersonalLogica();
        private BU_SIGNOVLogica signovLogica = new BU_SIGNOVLogica();
        private BU_HISTORIALLogica historialLogica = new BU_HISTORIALLogica();
        private BU_CITALogica citalogica = new BU_CITALogica();
        CodeGenerator codeGenerator = new CodeGenerator();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //hfFechaLog.Value = DateTime.Now.ToString("yyyy-MM-dd");
                string fechaCita = Request.QueryString["fechaCita"];
                if (!string.IsNullOrEmpty(fechaCita))
                {
                    DateTime parsedDate;
                    if (DateTime.TryParse(fechaCita, out parsedDate))
                    {
                        hfFechaLog.Value = parsedDate.ToString("yyyy-MM-dd HH:mm:ss");
                    }
                    else
                    {
             
                        hfFechaLog.Value = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
             
                    }
                }

                if (!string.IsNullOrEmpty(Request.QueryString["estudianteCod"]) && !string.IsNullOrEmpty(Request.QueryString["estudianteNombreCompleto"]))
                {
                    lblPacienteNombreCompleto.Text = Request.QueryString["estudianteNombreCompleto"];
                    hfEstudianteCod.Value = Request.QueryString["estudianteCod"];
                }

                if (!string.IsNullOrEmpty(Request.QueryString["profesionalNombreCompleto"]))
                {
                    lblProfesionalNombreCompleto.Text = Request.QueryString["profesionalNombreCompleto"];
                    hfProfesionalCod.Value = Request.QueryString["profesionalCod"];
                }

                if (!string.IsNullOrEmpty(Request.QueryString["servicioCod"]))
                {
                    hfServicioCod.Value = Request.QueryString["servicioCod"];
                }
            }
        }



        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            string nuevoCodigoHistorial = codeGenerator.GenerateCode("HISTO", 6);
            string nuevoCodigoSignov = codeGenerator.GenerateCode("SIGNOV", 6);
            string nuevoCodigoCita = codeGenerator.GenerateCode("CITA", 6);


            // Verificar si el estudiante ya tiene un historial
            bool existeHistorial = historialLogica.ExisteHistorialParaEstudiante(hfEstudianteCod.Value);

            if (!existeHistorial)
            {
                BU_HISTORIAL historial = new BU_HISTORIAL
                {
                    strCod_histo = nuevoCodigoHistorial,
                    strCod_alu = hfEstudianteCod.Value,
                    strCod_medico = hfProfesionalCod.Value,
                    strCod_ser = hfServicioCod.Value,
                    dtFecha_histo = DateTime.Now.Date,
                    bitEstado_histo = true,
                    strUserLog = hfUserLog.Value,
                    dtFechaLog = DateTime.Now
                };

                if (!historialLogica.GuardarHistorial(historial))
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "ErrorMessage", "Swal.fire('Error', 'Hubo un problema al guardar el historial.', 'error');", true);
                    return;
                }
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "InfoMessage", "Swal.fire('Información', 'El paciente ya tiene un historial.', 'info');", true);
            }

            // Insertar signos vitales
            BU_SIGNOV signov = new BU_SIGNOV
            {
                strCod_sig = nuevoCodigoSignov,
                strCod_alu = hfEstudianteCod.Value,
                strPreArt_sig = txtPresionArterial.Text,
                strTempera_sig = txtTemperatura.Text,
                strPulso_sig = txtPulso.Text,
                strFreRes_sig = txtFrecuenciaRespiratoria.Text,
                strUserLog = hfUserLog.Value,
                dtFechaLog = DateTime.Parse(hfFechaLog.Value)
            };

            if (!signovLogica.InsertBU_SIGNOV(signov))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "ErrorMessage", "Swal.fire('Error', 'Hubo un problema al guardar los signos vitales.', 'error');", true);
                return;
            }

            // Insertar la cita
            BU_CITA cita = new BU_CITA
            {
                strCod_cita = nuevoCodigoCita,
                strCod_alu = hfEstudianteCod.Value,
                strCod_ser = hfServicioCod.Value,
                dtFecha_cita = DateTime.Parse(hfFechaLog.Value),
                strEstado_cita = "Pendiente",
                strUserLog = hfUserLog.Value,
                dtFechaLog = DateTime.Now
            };

            citalogica.GuardarCita(cita);
        

            // Mostrar mensaje de éxito
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "mostrarAlertaExito();", true);
        }


    }
}

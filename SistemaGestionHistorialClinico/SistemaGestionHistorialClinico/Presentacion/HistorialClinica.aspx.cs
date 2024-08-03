using System;
using System.Collections.Generic;
using System.Web.UI;
using SistemaGestionHistorialClinico.Logica;
using SistemaGestionHistorialClinico.Entidad;



namespace SistemaGestionHistorialClinico.Presentacion
{
    public partial class HistoriaClinica : System.Web.UI.Page
    {
        private BU_HISTORIALLogica historialLogica = new BU_HISTORIALLogica();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string codigoPaciente = Request.QueryString["codigoPaciente"];
                if (!string.IsNullOrEmpty(codigoPaciente))
                {
                    CargarHistorial(codigoPaciente);
                }
                else
                {
                    lblPaciente.Text = "No se especificó un paciente.";
                }
            }
        }

        private void CargarHistorial(string codigoPaciente)
        {
            BU_HISTORIAL historial = historialLogica.ObtenerHistorialPorAlumno(codigoPaciente);
            BU_DetalleHisto detalle = historialLogica.ObtenerDetalleHistoPorAlumno(codigoPaciente);

            if (historial != null)
            {
                // Historia general
                lblCodHisto.Text = historial.strCod_histo;
                lblCodAlu.Text = historial.strCod_alu;
                lblCodSer.Text = historial.strCod_ser;
                lblFechaHisto.Text = historial.dtFecha_histo.HasValue ? historial.dtFecha_histo.Value.ToString("dd/MM/yyyy") : "N/A";
                lblEstadoHisto.Text = historial.bitEstado_histo.HasValue ? (historial.bitEstado_histo.Value ? "Activo" : "Inactivo") : "N/A";

                if (detalle != null)
                {
                    // Asignar los valores a los campos de entrada
                    txtCodDeta.Text = detalle.StrCodDeta;
                    txtCodHistoDetalle.Text = detalle.StrCodHisto;
                    txtCodAluDetalle.Text = detalle.StrCodAlu;
                    txtCodSerDetalle.Text = detalle.StrCodSer;
                    txtFechaDeta.Text = detalle.DtFechaDeta.HasValue ? detalle.DtFechaDeta.Value.ToString("yyyy-MM-dd") : ""; // Formato compatible con input date
                    txtTipoAtenDeta.Text = detalle.StrTipoAtenDeta;
                    txtMotConsDeta.Text = detalle.StrMotConsDeta;
                    txtEnfeActuDeta.Text = detalle.StrEnfeActuDeta;
                    txtDiasEnferDeta.Text = detalle.StrDiasEnferDeta;
                    txtPatoloDeta.Text = detalle.StrPatoloDeta;
                    txtDiagnosticoDeta.Text = detalle.StrDiagnosticoDeta;
                    txtTatamientoDeta.Text = detalle.StrTatamientoDeta;
                    txtEstadoDeta.Text = detalle.StrEstadoDeta;
                    txtMedicamentoDeta.Text = detalle.StrMedicamentoDeta;
                    txtCantidadDeta.Text = detalle.StrCantidadDeta;
                    txtDosisDeta.Text = detalle.StrDosisDeta;
                    txtCodEnferDeta.Text = detalle.StrCodEnferDeta;
                    txtCuracionDeta.Text = detalle.StrCuracionDeta;
                    txtInyeccionDeta.Text = detalle.StrInyeccionDeta;
                    txtHijosDeta.Text = detalle.IntHijosDeta.HasValue ? detalle.IntHijosDeta.Value.ToString() : "";
                }
                else
                {
                    lblNoDetalles.Visible = true;
                }
            }
            else
            {
                lblPaciente.Text = "No se encontró historial para el paciente especificado.";
            }
        }
    }
}

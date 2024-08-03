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
        CodeGenerator codeGenerator = new CodeGenerator();
        private string codigoPaciente = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string codigoPaciente = Request.QueryString["codigoPaciente"];

                ViewState["codigoPaciente"] = codigoPaciente;

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

                txtCodHistoDetalle.Text = historial.strCod_histo;
                txtCodAluDetalle.Text = historial.strCod_alu;
                txtCodSerDetalle.Text = historial.strCod_ser;
                txtFechaDeta.Text = txtFechaDeta.Text = DateTime.Now.ToString("yyyy-MM-dd");



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
                    ddlMedicamentoDeta.SelectedValue = detalle.StrMedicamentoDeta;
                    txtCantidadDeta.Text = detalle.StrCantidadDeta;
                    txtDosisDeta.Text = detalle.StrDosisDeta;
                    ddlCodEnferDeta.SelectedValue = detalle.StrCodEnferDeta;
                    txtCuracionDeta.Text = detalle.StrCuracionDeta;
                    txtInyeccionDeta.Text = detalle.StrInyeccionDeta;

                    // Planificación Familiar
                    txtHijosDeta.Text = detalle.IntHijosDeta.HasValue ? detalle.IntHijosDeta.Value.ToString() : "";
                    txt0a3Deta.Text = detalle.Str0a3Deta;
                    txt3a5Deta.Text = detalle.Str3a5Deta;
                    txtMayor7Deta.Text = detalle.StrMayor7Deta;
                    txtRnmascDeta.Text = detalle.StrRnmascDeta;
                    txtRnfemeDeta.Text = detalle.StrRnfemeDeta;
                    ddlPartoNorDeta.SelectedValue = detalle.StrPartoNorDeta;
                    ddlPartoCesariDeta.SelectedValue = detalle.StrPartoCesariDeta;
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

        protected void BtnGuardarActualizar_Click(object sender, EventArgs e)
        {

            codigoPaciente = ViewState["codigoPaciente"] as string;
            string usuarioactual = Session["Codigo"].ToString();


            BU_DetalleHisto detalle = new BU_DetalleHisto
            {
                StrCodDeta = txtCodDeta.Text,
                StrCodHisto = txtCodHistoDetalle.Text,
                StrCodAlu = txtCodAluDetalle.Text,
                StrCodSer = txtCodSerDetalle.Text,
                DtFechaDeta = string.IsNullOrEmpty(txtFechaDeta.Text) ? (DateTime?)null : DateTime.Parse(txtFechaDeta.Text),
                StrTipoAtenDeta = txtTipoAtenDeta.Text,
                StrMotConsDeta = txtMotConsDeta.Text,
                StrEnfeActuDeta = txtEnfeActuDeta.Text,
                StrDiasEnferDeta = txtDiasEnferDeta.Text,
                StrPatoloDeta = txtPatoloDeta.Text,
                StrDiagnosticoDeta = txtDiagnosticoDeta.Text,
                StrTatamientoDeta = txtTatamientoDeta.Text,
                StrEstadoDeta = txtEstadoDeta.Text,
                StrMedicamentoDeta = ddlMedicamentoDeta.SelectedValue,
                StrCantidadDeta = txtCantidadDeta.Text,
                StrDosisDeta = txtDosisDeta.Text,
                StrCodEnferDeta = ddlCodEnferDeta.SelectedValue,
                StrCuracionDeta = txtCuracionDeta.Text,
                StrInyeccionDeta = txtInyeccionDeta.Text,
                IntHijosDeta = string.IsNullOrEmpty(txtHijosDeta.Text) ? (int?)null : int.Parse(txtHijosDeta.Text),
                Str0a3Deta = txt0a3Deta.Text,
                Str3a5Deta = txt3a5Deta.Text,
                StrMayor7Deta = txtMayor7Deta.Text,
                StrRnmascDeta = txtRnmascDeta.Text,
                StrRnfemeDeta = txtRnfemeDeta.Text,
                StrPartoNorDeta = ddlPartoNorDeta.SelectedValue,
                StrPartoCesariDeta = ddlPartoCesariDeta.SelectedValue,
                StrUserLog = usuarioactual,
                DtFechaLog = DateTime.Now
            };

            bool resultado;
            // Verificar si es agregar o actualizar
            if (string.IsNullOrEmpty(detalle.StrCodDeta))
            {
                // Lógica para agregar un nuevo detalle

                detalle.StrCodDeta = codeGenerator.GenerateCode("HISTORIADETALLE", 6);

                resultado = historialLogica.GuardarDetalleHisto(detalle);
                if (resultado)
                {
                    // Mostrar mensaje de éxito con SweetAlert
                    ScriptManager.RegisterStartupScript(this, GetType(), "guardadoExitoso", @"
                        Swal.fire({
                            title: 'Éxito',
                            text: 'Detalle agregado exitosamente.',
                            icon: 'success'
                        }).then(function() {
                            // Acción después de cerrar el SweetAlert
                            window.location.href = 'HistorialClinica.aspx?codigoPaciente=" + codigoPaciente + @"';
                        });", true);
                }
                else
                {
                    // Mostrar mensaje de error con SweetAlert
                    ScriptManager.RegisterStartupScript(this, GetType(), "errorGuardado", @"
                    Swal.fire({
                        title: 'Error',
                        text: 'Error al agregar el detalle.',
                        icon: 'error'
                    });", true);
                }
            }
            else
            {
                // Lógica para actualizar un detalle existente
                resultado = historialLogica.ActualizarDetalleHisto(detalle);
                if (resultado)
                {
                    // Mostrar mensaje de éxito con SweetAlert
                    ScriptManager.RegisterStartupScript(this, GetType(), "actualizadoExitoso", @"
                        Swal.fire({
                            title: 'Éxito',
                            text: 'Detalle actualizado exitosamente.',
                            icon: 'success'
                        }).then(function() {
                            // Acción después de cerrar el SweetAlert
                            window.location.href = 'HistorialClinica.aspx?codigoPaciente=" + codigoPaciente + @"';
                        });", true);
                }
                else
                {
                    // Mostrar mensaje de error con SweetAlert
                    ScriptManager.RegisterStartupScript(this, GetType(), "errorActualizacion", @"
                        Swal.fire({
                            title: 'Error',
                            text: 'Error al actualizar el detalle.',
                            icon: 'error'
                        });", true);
                }
            }

        }

        protected void BtnCancelar_Click(object sender, EventArgs e)
        {
            // Redirigir a la página anterior
            if (Request.UrlReferrer != null)
            {
                Response.Redirect(Request.UrlReferrer.ToString());
            }
            else
            {
                // Redirigir a una página por defecto si no hay página de referencia
                Response.Redirect("~/Presentacion/Dashboard.aspx");
            }
        }
    }
}

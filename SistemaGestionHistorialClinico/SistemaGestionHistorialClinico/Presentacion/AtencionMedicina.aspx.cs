using System;
using System.Collections.Generic;
using System.Web.UI;
using SistemaGestionHistorialClinico.Entidad;
using SistemaGestionHistorialClinico.Logica;
using SistemaGestionHistorialClinico.Entidad.dto;
using System.Web.UI.WebControls;
using System.Diagnostics;

namespace SistemaGestionHistorialClinico.Presentacion
{
    public partial class AtencionMedicina : Page
    {
        private BU_CITALogica citaLogica = new BU_CITALogica();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Codigo"] != null)
                {
                    string strCod_medico = Session["Codigo"].ToString();
                    CargarCitasDelDia(strCod_medico);
                }
                else
                {
                    Response.Redirect("~/Presentacion/Login.aspx");
                }
            }

 
        }


        private void CargarCitasDelDia(string strCod_medico)
        {
            DateTime fecha = DateTime.Today;
            List<CitaDTO> citas = citaLogica.ObtenerCitasPorMedicoYFecha(strCod_medico, fecha);
            gvAtenciones.DataSource = citas;
            gvAtenciones.DataBind();
        }

        protected void gvAtenciones_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int index = Convert.ToInt32(e.CommandArgument);
            string codigoCita = gvAtenciones.DataKeys[index].Values["CodigoCita"].ToString();
            string estadoActual = gvAtenciones.DataKeys[index].Values["Estado"].ToString();

            Debug.WriteLine($"Index: {index}");
            Debug.WriteLine($"CodigoCita: {codigoCita}");
            Debug.WriteLine($"EstadoActual: {estadoActual}");

            if (e.CommandName == "Atender")
            {
                string nombrePaciente = gvAtenciones.DataKeys[index].Values["NombreCompletoPaciente"].ToString();
                string servicio = gvAtenciones.DataKeys[index].Values["NombreServicio"].ToString();
                string fechaCita = gvAtenciones.DataKeys[index].Values["FechaCita"].ToString();

                string url = $"AtenderCita.aspx?codigoCita={codigoCita}&nombrePaciente={nombrePaciente}&servicio={servicio}&fechaCita={fechaCita}&estado={estadoActual}";
                Response.Redirect(url);
            }
            else if (e.CommandName == "VerHistoria")
            {
                string codigoPaciente = gvAtenciones.DataKeys[index].Values["CodigoPaciente"].ToString();
                Response.Redirect($"HistorialClinica.aspx?codigoPaciente={codigoPaciente}");
            }
            else if (e.CommandName == "CambiarEstado")
            {

                CambiarEstadoCita(codigoCita, estadoActual);
              
            }
        }




        private void CambiarEstadoCita(string codigoCita, string estadoActual)
        {
            bool result = citaLogica.CambiarEstadoCita(codigoCita);

            if (result)
            {
                if (estadoActual == "Atendido")
                {
                    bool deleted = citaLogica.eliminarDetallecita(codigoCita);
                    if (!deleted)
                    {
                        MostrarMensajeError("No se pudo eliminar el detalle de la cita.");
                        return;
                    }
                }

                MostrarMensajeExito("Estado de la cita cambiado correctamente.");
                CargarCitasDelDia(Session["Codigo"].ToString());
            }
            else
            {
                MostrarMensajeError("No se pudo cambiar el estado de la cita.");
            }
        }


        private void MostrarMensajeExito(string mensaje)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "exito", $"Swal.fire('Éxito', '{mensaje}', 'success');", true);
        }

        private void MostrarMensajeError(string mensaje)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "error", $"Swal.fire('Error', '{mensaje}', 'error');", true);
        }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SistemaGestionHistorialClinico.Logica;


namespace SistemaGestionHistorialClinico.Presentacion
{
    public partial class Citas : System.Web.UI.Page
    {
        private BU_CITALogica citalogica = new BU_CITALogica();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string profesionalCod = Request.QueryString["profesionalCod"];
                ViewState["profesionalCod"] = profesionalCod;

                if (string.IsNullOrEmpty(profesionalCod))
                {
                    lblFechaSeleccionada.Text = "Error: No se ha proporcionado el código del profesional.";
                }
                else
                {
                    DateTime fechaActual = DateTime.Today;
                    calendarioCitas.SelectedDate = fechaActual;
                    calendarioCitas.VisibleDate = fechaActual;  // Esto asegura que el calendario se abra en el mes correcto.

                    lblFechaSeleccionada.Text = $"Citas para el {fechaActual:dd/MM/yyyy}:";
                    CargarCitas(fechaActual, "0550058051");  // Carga las citas para la fecha actual automáticamente.
                }
            }
        }

        protected void calendarioCitas_SelectionChanged(object sender, EventArgs e)
        {
            DateTime fechaSeleccionada = calendarioCitas.SelectedDate;
            lblFechaSeleccionada.Text = $"Citas para el {fechaSeleccionada:dd/MM/yyyy}:";

            string profesionalCod = ViewState["profesionalCod"] as string;

            if (!string.IsNullOrEmpty(profesionalCod))
            {
                CargarCitas(fechaSeleccionada, profesionalCod);
            }
            else
            {
                lblFechaSeleccionada.Text = "Error: Código del profesional no válido.";
            }
        }

        private void CargarCitas(DateTime fecha, string codigoMedico)
        {
            try
            {
                var citas = citalogica.ObtenerCitasPorMedicoYFecha("0550058051", fecha);

                if (citas != null && citas.Count > 0)
                {
                    lblFechaSeleccionada.Text += $" Se encontraron {citas.Count} citas para el {fecha:dd/MM/yyyy}.";
                    gvCitas.DataSource = citas;
                    gvCitas.DataBind();
                }
                else
                {
                    lblFechaSeleccionada.Text += " No se encontraron citas para esta fecha.";
                    gvCitas.DataSource = null;
                    gvCitas.DataBind();
                }
            }
            catch (Exception ex)
            {
                lblFechaSeleccionada.Text = "Error al cargar las citas: " + ex.Message;
            }
        }
    }
}

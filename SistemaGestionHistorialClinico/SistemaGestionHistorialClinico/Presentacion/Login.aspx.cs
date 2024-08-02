using SistemaGestionHistorialClinico.Entidad;
using SistemaGestionHistorialClinico.Logica;
using System;
using System.Web;
using System.Web.UI;

namespace SistemaGestionHistorialClinico.Presentacion
{
    public partial class Login : Page
    {
        private SIGUTCPersonalLogica personalLogica = new SIGUTCPersonalLogica();

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text;
            string password = txtPassword.Text;

            SIGUTCPERSONAL usuario = personalLogica.ValidarCredenciales(username, password);

            if (usuario != null)
            {
                Session["Codigo"] = usuario.strCod_alu;
                Session["NombreCompleto"] = $"{usuario.NOMBRE_ALU} {usuario.APELLIDO_ALU} {usuario.APELLIDOM_ALU}";
                Session["Rol"] = usuario.strRol;

                // Redirigir según el rol del usuario
                if (usuario.strRol == "MEDICO")
                {
                    Response.Redirect("~/Presentacion/AtencionMedicina.aspx");
                }
                else if (usuario.strRol == "ENFERMERA")
                {
                    Response.Redirect("~/Presentacion/GestionAtencionMedica.aspx");
                }
                else
                {
                    Response.Redirect("~/Presentacion/Citas.aspx");
                }
            }
            else
            {
                lblMessage.Text = "Username o contranseña es incorrecto";
            }
        }
    }
}

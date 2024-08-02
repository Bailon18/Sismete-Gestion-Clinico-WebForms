﻿using System;
using System.Web.UI;

namespace SistemaGestionHistorialClinico.Presentacion
{
    public partial class Principal : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["NombreCompleto"] != null && Session["Rol"] != null)
                {
                    lblNombreCompleto.Text = Session["NombreCompleto"].ToString();
                    lblRol.Text = Session["Rol"].ToString();

                    string rol = Session["Rol"].ToString();

                    // Asegurarse de que todos los menús estén ocultos al inicio
                    pacientesNavItem.Visible = false;
                    citasNavItem.Visible = false;
                    usuariosNavItem.Visible = false;
                    triageNavItem.Visible = false;
                    medicinaGeneralNavItem.Visible = false;
                    AtencionMedicinaNavItem.Visible = false;

                    if (rol == "MEDICO")
                    {
                        // Mostrar solo el menú de Medicina General
                        medicinaGeneralNavItem.Visible = true;
                    }
                    else if (rol == "ENFERMERA")
                    {
                        // Mostrar solo el menú de Triaje
                        triageNavItem.Visible = true;
                    }
                    else
                    {
                        // Mostrar solo los menús administrativos
                        pacientesNavItem.Visible = true;
                        citasNavItem.Visible = true;
                        usuariosNavItem.Visible = true;
                    }
                }
                else
                {
                    Response.Redirect("~/Presentacion/Login.aspx");
                }
            }
        }

        protected void CerrarSesion_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("~/Presentacion/Login.aspx");
        }
    }
}
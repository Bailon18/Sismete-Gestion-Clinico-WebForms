<%@ Page Title="Gestión de Atención Médica" Language="C#" MasterPageFile="~/Presentacion/Principal.master" AutoEventWireup="true" CodeBehind="GestionAtencionMedica.aspx.cs" Inherits="SistemaGestionHistorialClinico.Presentacion.GestionAtencionMedica" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Gestión de Atención Médica</title>
    <style>
        .btn-selected {
            background-color: #007bff;
            color: white;
        }
    </style>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <h3 class="mt-4">Gestión de Atención Médica</h3>
        <ol class="breadcrumb mb-2">
        </ol>

        <div class="row">
            <div class="col-12">
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">
                            <i class="fas fa-user-md me-1"></i> Selección de Servicio y Estudiante
                        </h6>
                    </div>
                    <div class="card-body">
                        <div class="form-group">
                            <label class="form-label">Seleccione un Servicio</label>
                            <div class="d-flex justify-content-around mb-3">
                                <button type="button" id="btnMedicinaGeneral" class="btn btn-outline-primary btn-lg" onclick="seleccionarServicio('Medicina General', this)">
                                    <i class="fas fa-stethoscope fa-2x"></i><br>Medicina General
                                </button>
                                <button type="button" id="btnOdontologia" class="btn btn-outline-primary btn-lg" onclick="seleccionarServicio('Odontología', this)">
                                    <i class="fas fa-tooth fa-2x"></i><br>Odontología
                                </button>
                                <button type="button" id="btnPsicologia" class="btn btn-outline-primary btn-lg" onclick="seleccionarServicio('Psicología', this)">
                                    <i class="fas fa-brain fa-2x"></i><br>Psicología
                                </button>
                            </div>
                            <asp:HiddenField ID="hfServicioSeleccionado" runat="server" />
                        </div>
                        <div class="form-group">
                            <label for="ddlProfesionales" class="form-label">Seleccione un Profesional</label>
                            <asp:DropDownList ID="ddlProfesionales" runat="server" CssClass="form-control mb-3">
                                <asp:ListItem Text="Seleccione un Profesional" Value=""></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="form-group">
                            <label for="ddlEstudiantes" class="form-label">Seleccione un Estudiante</label>
                            <asp:DropDownList ID="ddlEstudiantes" runat="server" CssClass="form-control mb-3">
                                <asp:ListItem Text="Seleccione un Estudiante" Value=""></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <asp:Button ID="btnConfirmar" runat="server" Text="Confirmar" CssClass="btn btn-primary btn-block" OnClick="btnConfirmar_Click" />
                        <asp:Button ID="btnServicioSeleccionado" runat="server" Text="" CssClass="d-none" OnClick="btnServicioSeleccionado_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        function seleccionarServicio(servicio, boton) {
            document.getElementById('<%= hfServicioSeleccionado.ClientID %>').value = servicio;
            __doPostBack('<%= btnServicioSeleccionado.UniqueID %>', '');
            
            // Remover la clase 'btn-selected' de todos los botones
            var botones = document.querySelectorAll('.btn-outline-primary');
            botones.forEach(function(btn) {
                btn.classList.remove('btn-selected');
            });

            // Agregar la clase 'btn-selected' al botón seleccionado
            boton.classList.add('btn-selected');
        }

        window.onload = function () {
            var servicioSeleccionado = document.getElementById('<%= hfServicioSeleccionado.ClientID %>').value;
            if (servicioSeleccionado) {
                var botonId = '';
                switch (servicioSeleccionado) {
                    case 'Medicina General':
                        botonId = 'btnMedicinaGeneral';
                        break;
                    case 'Odontología':
                        botonId = 'btnOdontologia';
                        break;
                    case 'Psicología':
                        botonId = 'btnPsicologia';
                        break;
                }
                var boton = document.getElementById(botonId);
                if (boton) {
                    boton.classList.add('btn-selected');
                }
            }
        };
    </script>
</asp:Content>

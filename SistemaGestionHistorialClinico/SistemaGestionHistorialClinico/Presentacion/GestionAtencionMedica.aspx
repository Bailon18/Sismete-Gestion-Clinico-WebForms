<%@ Page Title="Gestión de Atención Médica" Language="C#" MasterPageFile="~/Presentacion/Principal.master" AutoEventWireup="true" CodeBehind="GestionAtencionMedica.aspx.cs" Inherits="SistemaGestionHistorialClinico.Presentacion.GestionAtencionMedica" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Gestión de Atención Médica</title>
    <style>
        .btn-selected {
            background-color: #2f4053; 
            color: white;
        }

        #btnMedicinaGeneral {
            color: #4CAF50;
            border: 2px solid #4CAF50;
            transition: background-color 0.3s ease, border-color 0.3s ease;
        }

        #btnOdontologia {
            color: #FFC107;
            border: 2px solid #FFC107;
            transition: background-color 0.3s ease, border-color 0.3s ease;
        }

        #btnPsicologia {
            color: #9C27B0;
            border: 2px solid #9C27B0;
            transition: background-color 0.3s ease, border-color 0.3s ease;
        }

        /* Efecto hover */
        #btnMedicinaGeneral:hover {
            border-color: #4CAF50;
            background-color: #7FD491;
            font-weight: 500
        }

        #btnOdontologia:hover {
            border-color: #FFC107;
            background-color: #fff399;
            font-weight: 500
        }

        #btnPsicologia:hover {
            border-color: #9C27B0;
            background-color: #D98FDB;
            font-weight: 500
        }
            .my-calendar table {
        width: 100%;
        border-collapse: collapse;
        }

        .my-calendar th {
            background-color: #2f4053;
            color: white;
            padding: 10px;
            text-align: center;
        }

        .my-calendar td {
            background-color: #f9f9f9;
            color: #333;
            padding: 8px;
            text-align: center;
            border: 1px solid #ddd;
            cursor: pointer;
        }

        .my-calendar td:not(.style-disabled):hover {
            background-color: #2f4053;
            color: white;
        }

        .my-calendar .style-disabled {
            background-color: #ccc !important;
            cursor: not-allowed;
        }

        .my-calendar .other-month {
            background-color: #eee;
            color: #666;
        }

        .my-calendar .selected-day {
            background-color: #333;
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
                            
                            <div style="margin-left:11%">
                                <label class="form-label" style="font-weight:bold">Seleccione un Servicio</label>
                            </div>
         
                            <div class="d-flex justify-content-around mb-3">
                                <button type="button" id="btnMedicinaGeneral" class="btn btn-lg" onclick="seleccionarServicio('Medicina General', this)">
                                    <i class="fas fa-stethoscope fa-2x"></i><br>Medicina General
                                </button>
                                <button type="button" id="btnOdontologia" class="btn btn-lg" onclick="seleccionarServicio('Odontología', this)">
                                    <i class="fas fa-tooth fa-2x"></i><br>Odontología
                                </button>
                                <button type="button" id="btnPsicologia" class="btn btn-lg" onclick="seleccionarServicio('Psicología', this)">
                                    <i class="fas fa-brain fa-2x"></i><br>Psicología
                                </button>
                            </div>
                            <asp:HiddenField ID="hfServicioSeleccionado" runat="server" />
                        </div>
                        <br />
                        <br />
                        <!-- Inicio de la fila para profesional, estudiante y calendario -->
                        <div class="row">
                            <!-- Columna izquierda -->
                            <div class="col-md-4" style="margin-left: 162px;">
                                <div class="form-group">
                                    <label for="ddlProfesionales" class="form-label" style="font-weight:bold">Seleccione un Profesional</label>
                                    <asp:DropDownList ID="ddlProfesionales" runat="server" CssClass="form-control mb-3">
                                        <asp:ListItem Text="Seleccione un Profesional" Value=""></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="form-group">
                                    <label for="txtEstudiante" class="form-label" style="font-weight:bold">Buscar Estudiante</label>
                                    <asp:TextBox ID="txtEstudiante" runat="server" CssClass="form-control mb-3" placeholder="Filtrar estudiante por nombre, apellidos o código"></asp:TextBox>
                                    <asp:HiddenField ID="hfEstudianteCodigo" runat="server" />
                                    <asp:HiddenField ID="hfEstudianteNombreCompleto" runat="server" />
                                </div>
                            </div>

                            <!-- Columna derecha -->
                            <div class="col-md-8" style="width: 30%;">
                                <!-- Agregar el calendario aquí -->
                                <label for="txtEstudiante" style="font-weight:bold" class="form-label">Seleccione la fecha de la cita</label>
                                <asp:Calendar ID="calFechaCita" runat="server" CssClass="mb-3 my-calendar" OnDayRender="calFechaCita_DayRender"></asp:Calendar>

                            </div>
                        </div>
                        <!-- Fin de la fila -->

                        <div style="margin-left:11%">
                            <asp:Button ID="btnConfirmar" runat="server" Text="Confirmar" CssClass="btn btn-primary btn-block" OnClick="btnConfirmar_Click" />
                            <asp:Button ID="btnServicioSeleccionado" runat="server" Text="" CssClass="d-none" OnClick="btnServicioSeleccionado_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <link href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>

    <script type="text/javascript">
        function seleccionarServicio(servicio, boton) {
            document.getElementById('<%= hfServicioSeleccionado.ClientID %>').value = servicio;
            __doPostBack('<%= btnServicioSeleccionado.UniqueID %>', '');
            
            // Remover la clase 'btn-selected' de todos los botones
            var botones = document.querySelectorAll('.btn');
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
    <script type="text/javascript">
        $(function () {
            $("#<%= txtEstudiante.ClientID %>").autocomplete({
                source: function (request, response) {
                    $.ajax({
                        url: "<%= ResolveUrl("~/Presentacion/GestionAtencionMedica.aspx/BuscarEstudiantes") %>",
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({ prefixText: request.term }),
                        success: function (data) {
                            response($.map(data.d, function (item) {
                                return {
                                    label: item.NombreCompleto,
                                    value: item.NombreCompleto,
                                    code: item.CodigoAlumno
                                };
                            }));
                        }
                    });
                },
                select: function (event, ui) {
                    $("#<%= hfEstudianteCodigo.ClientID %>").val(ui.item.code);
                    $("#<%= hfEstudianteNombreCompleto.ClientID %>").val(ui.item.value);
                },
                minLength: 1
            });
        });
    </script>

</asp:Content>

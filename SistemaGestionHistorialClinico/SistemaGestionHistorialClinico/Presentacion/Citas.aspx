<%@ Page Title="Citas" Language="C#" MasterPageFile="~/Presentacion/Principal.master" AutoEventWireup="true" CodeBehind="Citas.aspx.cs" Inherits="SistemaGestionHistorialClinico.Presentacion.Citas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Citas</title>
    <style>
        /* Estilos base para el calendario */
        .calendar-container .aspNetDisabled {
            color: #666;
        }

        /* Estilizar cabecera del calendario */
        .calendar-container th {
            background-color: #2f4053;
            color: white;
            padding: 5px 10px;
            text-align: center;
        }

        /* Estilizar los días de la semana */
        .calendar-container th {
            font-size: 16px;
        }

        /* Estilizar los días del calendario */
        .calendar-container td {
            background-color: #f8f9fa;
            color: #333;
            text-align: center;
            vertical-align: middle;
            padding: 10px;
            border-radius: 4px;
        }

        /* Estilos para los días seleccionados y hover */
        .calendar-container a:hover,
        .calendar-container a.selected {
            background-color: #4CAF50;
            color: white;
        }

        /* Estilos para los días deshabilitados */
        .calendar-container .aspNetDisabled {
            color: #ccc;
            pointer-events: none;
        }

        /* Botones de navegación */
        .calendar-container .next, .calendar-container .prev {
            cursor: pointer;
            color: #fff;
            font-size: 18px;
        }

        /* Ajustar la navegación del calendario */
        .calendar-container .title {
            font-size: 20px;
            font-weight: bold;
            color: #fff;
        }

        /* Estilos adicionales para mejorar la interfaz */
        .calendar-container {
            border: 1px solid #ccc;
            border-radius: 5px;
            padding: 10px;
        }

        .btn-primary {
            background-color: #2f4053;
            border-color: #2f4053;
        }

        .btn-primary:hover {
            background-color: #47525e;
            border-color: #47525e;
        }
    </style>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet" />
    <link href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <h3 class="mt-4">Citas</h3>
        <ol class="breadcrumb mb-2">
        </ol>

        <!-- Fila principal para el calendario y la tabla de citas -->
        <div class="row">
            <!-- Columna para el calendario -->
            <div class="col-md-4">
                <div class="card mb-4">
                    <div class="card-header">
                        <i class="fas fa-calendar-alt me-1"></i> Calendario
                    </div>
                    <div class="card-body">
                        <div class="calendar-container">
                            <asp:Calendar ID="calendarioCitas" runat="server" OnSelectionChanged="calendarioCitas_SelectionChanged" CssClass="mb-4"></asp:Calendar>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Columna para la tabla de citas -->
            <div class="col-md-8">
                <div class="card mb-4">
                    <div class="card-header">
                        <i class="fas fa-list me-1"></i> Detalle de Citas
                    </div>
                    <div class="card-body">
                        <asp:Label ID="lblFechaSeleccionada" runat="server" Text=""></asp:Label>
                        <asp:GridView ID="gvCitas" runat="server" AutoGenerateColumns="False" CssClass="table table-striped">
                            <Columns>
                                <asp:BoundField DataField="CodigoCita" HeaderText="Código Cita" />
                                <asp:BoundField DataField="NombreCompletoPaciente" HeaderText="Paciente" />
                                <asp:BoundField DataField="NombreServicio" HeaderText="Servicio" />
                                <asp:BoundField DataField="FechaCita" HeaderText="Fecha Cita" DataFormatString="{0:dd/MM/yyyy HH:mm}" />
                                <asp:BoundField DataField="Estado" HeaderText="Estado" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

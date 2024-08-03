<%@ Page Title="Historia Clínica" Language="C#" MasterPageFile="~/Presentacion/Principal.master" AutoEventWireup="true" CodeBehind="HistoriaClinica.aspx.cs" Inherits="SistemaGestionHistorialClinico.Presentacion.HistoriaClinica" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Historia Clínica</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <h3 class="mt-4">Historia Clínica</h3>
        <ol class="breadcrumb mb-2">
        </ol>

        <div class="accordion" id="accordionHistoria">
            <div class="card">
                <div class="card-header" id="headingHistoria">
                    <h5 class="mb-0">
                        <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseHistoria" aria-expanded="true" aria-controls="collapseHistoria">
                            Datos de Historia
                        </button>
                    </h5>
                </div>

                <div id="collapseHistoria" class="collapse show" aria-labelledby="headingHistoria" data-parent="#accordionHistoria">
                    <div class="card-body">
                        <asp:Label ID="lblPaciente" runat="server" CssClass="h5"></asp:Label>
                        <ul class="list-group mt-3">
                            <li class="list-group-item"><strong>Código Historia:</strong> <asp:Label ID="lblCodHisto" runat="server"></asp:Label></li>
                            <li class="list-group-item"><strong>Paciente:</strong> <asp:Label ID="lblCodAlu" runat="server"></asp:Label></li>
                            <li class="list-group-item"><strong>Servicio:</strong> <asp:Label ID="lblCodSer" runat="server"></asp:Label></li>
                            <li class="list-group-item"><strong>Fecha:</strong> <asp:Label ID="lblFechaHisto" runat="server"></asp:Label></li>
                            <li class="list-group-item"><strong>Estado:</strong> <asp:Label ID="lblEstadoHisto" runat="server"></asp:Label></li>
                        </ul>
                    </div>
                </div>
            </div>

            <div class="card">
                <div class="card-header" id="headingDetalles">
                    <h5 class="mb-0">
                        <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseDetalles" aria-expanded="false" aria-controls="collapseDetalles">
                            Detalles de Historia
                        </button>
                    </h5>
                </div>
                <div id="collapseDetalles" class="collapse" aria-labelledby="headingDetalles" data-parent="#accordionHistoria">
                    <div class="card-body">
                        <asp:Label ID="lblNoDetalles" runat="server" Text="No hay detalles disponibles." Visible="false"></asp:Label>
                        <table class="table table-bordered mt-4">
                            <tbody>
                                <tr>
                                    <td><strong>Código Detalle</strong></td>
                                    <td><strong>Código Historia</strong></td>
                                    <td><strong>Código Alumno</strong></td>
                                </tr>
                                <tr>
                                    <td><asp:TextBox ID="txtCodDeta" runat="server" CssClass="form-control"></asp:TextBox></td>
                                    <td><asp:TextBox ID="txtCodHistoDetalle" runat="server" CssClass="form-control"></asp:TextBox></td>
                                    <td><asp:TextBox ID="txtCodAluDetalle" runat="server" CssClass="form-control"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td><strong>Servicio</strong></td>
                                    <td><strong>Fecha Detalle</strong></td>
                                    <td><strong>Tipo Atención</strong></td>
                                </tr>
                                <tr>
                                    <td><asp:TextBox ID="txtCodSerDetalle" runat="server" CssClass="form-control"></asp:TextBox></td>
                                    <td><asp:TextBox ID="txtFechaDeta" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox></td>
                                    <td><asp:TextBox ID="txtTipoAtenDeta" runat="server" CssClass="form-control"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td><strong>Motivo Consulta</strong></td>
                                    <td><strong>Enfermedad Actual</strong></td>
                                    <td><strong>Días Enfermedad</strong></td>
                                </tr>
                                <tr>
                                    <td><asp:TextBox ID="txtMotConsDeta" runat="server" CssClass="form-control"></asp:TextBox></td>
                                    <td><asp:TextBox ID="txtEnfeActuDeta" runat="server" CssClass="form-control"></asp:TextBox></td>
                                    <td><asp:TextBox ID="txtDiasEnferDeta" runat="server" CssClass="form-control"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td><strong>Patología</strong></td>
                                    <td><strong>Diagnóstico</strong></td>
                                    <td><strong>Tratamiento</strong></td>
                                </tr>
                                <tr>
                                    <td><asp:TextBox ID="txtPatoloDeta" runat="server" CssClass="form-control"></asp:TextBox></td>
                                    <td><asp:TextBox ID="txtDiagnosticoDeta" runat="server" CssClass="form-control"></asp:TextBox></td>
                                    <td><asp:TextBox ID="txtTatamientoDeta" runat="server" CssClass="form-control"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td><strong>Estado</strong></td>
                                    <td><strong>Medicamento</strong></td>
                                    <td><strong>Cantidad</strong></td>
                                </tr>
                                <tr>
                                    <td><asp:TextBox ID="txtEstadoDeta" runat="server" CssClass="form-control"></asp:TextBox></td>
                                    <td><asp:TextBox ID="txtMedicamentoDeta" runat="server" CssClass="form-control"></asp:TextBox></td>
                                    <td><asp:TextBox ID="txtCantidadDeta" runat="server" CssClass="form-control"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td><strong>Dosis</strong></td>
                                    <td><strong>Código Enfermedad</strong></td>
                                    <td><strong>Curación</strong></td>
                                </tr>
                                <tr>
                                    <td><asp:TextBox ID="txtDosisDeta" runat="server" CssClass="form-control"></asp:TextBox></td>
                                    <td><asp:TextBox ID="txtCodEnferDeta" runat="server" CssClass="form-control"></asp:TextBox></td>
                                    <td><asp:TextBox ID="txtCuracionDeta" runat="server" CssClass="form-control"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td><strong>Inyección</strong></td>
                                    <td><strong>Hijos</strong></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td><asp:TextBox ID="txtInyeccionDeta" runat="server" CssClass="form-control"></asp:TextBox></td>
                                    <td><asp:TextBox ID="txtHijosDeta" runat="server" CssClass="form-control"></asp:TextBox></td>
                                    <td></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</asp:Content>

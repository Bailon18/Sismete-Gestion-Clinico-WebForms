<%@ Page Title="Triaje" Language="C#" MasterPageFile="~/Presentacion/Principal.master" AutoEventWireup="true" CodeBehind="Triaje.aspx.cs" Inherits="SistemaGestionHistorialClinico.Presentacion.Triaje" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Triaje</title>
    <style>
        .card-header-title {
            font-size: 1.2rem;
        }
        .form-label {
            font-weight: bold;
        }
        .form-control[readonly] {
            background-color: #e9ecef;
            opacity: 1;
        }
        .bold-text {
            font-weight: bold;
        }
        .error-message {
            color: red;
            font-size: 0.9rem;
            margin-top: 0.25rem;
        }
        .form-group {
            position: relative;
        }
    </style>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.1/dist/sweetalert2.min.css"/>
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.1/dist/sweetalert2.all.min.js"></script>
    <script>
        $(document).ready(function () {
            $('.numeric-input').on('input', function () {
                const errorMessage = $(this).siblings('.error-message');
                if (/[^0-9.]/.test(this.value) || (this.value.match(/\./g) || []).length > 1) {
                    errorMessage.show();
                    this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');
                } else {
                    errorMessage.hide();
                }
            });
        });

        function mostrarAlertaExito() {
            Swal.fire({
                title: 'Éxito',
                text: 'Los datos se han guardado correctamente.',
                confirmButtonText: 'OK'
            }).then((result) => {
                if (result.isConfirmed) {
                    window.location.href = 'GestionAtencionMedica.aspx';
                }
            });
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <h3 class="mt-4">Atención: Medicina General</h3>
        <ol class="breadcrumb mb-2">
        </ol>

        <div class="row">
            <div class="col-12">
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <div class="card-header-title">
                            <span class="bold-text"><i class="fas fa-user-md me-2"></i>Médico:</span> <asp:Label ID="lblProfesionalNombreCompleto" runat="server"></asp:Label>
                        </div>
                        <div class="card-header-title">
                            <span class="bold-text"><i class="fas fa-user me-2"></i>Paciente:</span> <asp:Label ID="lblPacienteNombreCompleto" runat="server"></asp:Label>
                        </div>
                    </div>
                    <div class="card-body">
                        <asp:ValidationSummary ID="vsTriaje" runat="server" CssClass="text-danger mb-3" />
                        <div class="form-group mb-3">
                            <label for="txtPresionArterial" class="form-label">Presión Arterial</label>
                            <asp:TextBox ID="txtPresionArterial" runat="server" CssClass="form-control numeric-input" required="required"></asp:TextBox>
                            <span class="error-message" style="display:none;">Por favor, ingrese solo números y un punto decimal.</span>
                        </div>
                        <div class="form-group mb-3">
                            <label for="txtTemperatura" class="form-label">Temperatura</label>
                            <asp:TextBox ID="txtTemperatura" runat="server" CssClass="form-control numeric-input" required="required"></asp:TextBox>
                            <span class="error-message" style="display:none;">Por favor, ingrese solo números y un punto decimal.</span>
                        </div>
                        <div class="form-group mb-3">
                            <label for="txtPulso" class="form-label">Pulso</label>
                            <asp:TextBox ID="txtPulso" runat="server" CssClass="form-control numeric-input" required="required"></asp:TextBox>
                            <span class="error-message" style="display:none;">Por favor, ingrese solo números y un punto decimal.</span>
                        </div>
                        <div class="form-group mb-3">
                            <label for="txtFrecuenciaRespiratoria" class="form-label">Frecuencia Respiratoria</label>
                            <asp:TextBox ID="txtFrecuenciaRespiratoria" runat="server" CssClass="form-control numeric-input" required="required"></asp:TextBox>
                            <span class="error-message" style="display:none;">Por favor, ingrese solo números y un punto decimal.</span>
                        </div>
                        <asp:HiddenField ID="hfEstudianteCod" runat="server" />
                        <asp:HiddenField ID="hfProfesionalCod" runat="server" />
                        <asp:HiddenField ID="hfProfesionalNombreCompleto" runat="server" />
                        <asp:HiddenField ID="hfUserLog" runat="server" Value="2250242985" />
                        <asp:HiddenField ID="hfFechaLog" runat="server" />
                        <asp:HiddenField ID="hfServicioCod" runat="server" />
                        <asp:Button ID="btnGuardar" runat="server" Text="Guardar" CssClass="btn btn-primary btn-block" OnClick="btnGuardar_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

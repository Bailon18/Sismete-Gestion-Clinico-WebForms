<%@ Page Title="Atender Cita" Language="C#" MasterPageFile="~/Presentacion/Principal.master" AutoEventWireup="true" CodeBehind="AtenderCita.aspx.cs" Inherits="SistemaGestionHistorialClinico.Presentacion.AtenderCita" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Atender Cita</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@10">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <style>
        .form-control {
            width: 100%;
            padding: 0.375rem 0.75rem;
            font-size: 1rem;
            line-height: 1.5;
            color: #495057;
            background-color: #fff;
            background-clip: padding-box;
            border: 1px solid #ced4da;
            border-radius: 0.25rem;
        }
        .form-group {
            margin-bottom: 1rem;
        }
        .btn-primary {
            color: #fff;
            background-color: #007bff;
            border-color: #007bff;
            padding: 0.375rem 0.75rem;
            font-size: 1rem;
            line-height: 1.5;
            border-radius: 0.25rem;
            cursor: pointer;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <h3 class="mt-4">Atender Cita</h3>
        <div class="row">
            <div class="col-12">
                <div class="card mb-4">
                    <div class="card-header">
                        <i class="fas fa-stethoscope me-1"></i>
                        Detalle de Cita
                    </div>
                    <div class="card-body">
                        <div class="form-group">
                            <label>Paciente:</label>
                            <asp:Label ID="lblPaciente" runat="server" Text="" CssClass="form-control"></asp:Label>
                        </div>
                        <div class="form-group">
                            <label>Servicio:</label>
                            <asp:Label ID="lblServicio" runat="server" Text="" CssClass="form-control"></asp:Label>
                        </div>
                        <div class="form-group">
                            <label>Fecha de la Cita:</label>
                            <asp:Label ID="lblFechaCita" runat="server" Text="" CssClass="form-control"></asp:Label>
                        </div>
                        <div class="form-group">
                            <label for="txtDescripcion">Descripción:</label>
                            <asp:TextBox ID="txtDescripcion" runat="server" CssClass="form-control" MaxLength="500" TextMode="MultiLine" Rows="3"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="txtObservaciones">Observaciones:</label>
                            <asp:TextBox ID="txtObservaciones" runat="server" CssClass="form-control" MaxLength="500" TextMode="MultiLine" Rows="3"></asp:TextBox>
                        </div>     
                        <div class="form-group">
                            <asp:Button ID="btnGuardar" runat="server" CssClass="btn-primary" Text="Guardar" OnClick="btnGuardar_Click" />
                            <asp:LinkButton ID="btnVolver" runat="server" CssClass="btn btn-secondary" Text="Volver" OnClick="btnVolver_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>


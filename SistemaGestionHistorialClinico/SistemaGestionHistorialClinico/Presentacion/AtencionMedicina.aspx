<%@ Page Title="Atenciones del Día" Language="C#" MasterPageFile="~/Presentacion/Principal.master" AutoEventWireup="true" CodeBehind="AtencionMedicina.aspx.cs" Inherits="SistemaGestionHistorialClinico.Presentacion.AtencionMedicina" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Atenciones del Día</title>
    <style>
        .table {
            width: 100%;
            margin-bottom: 1rem;
            color: #212529;
        }
        .table th,
        .table td {
            padding: 0.75rem;
            vertical-align: top;
            border-top: 1px solid #dee2e6;
        }
        .table thead th {
            vertical-align: bottom;
            border-bottom: 2px solid #dee2e6;
        }
        .table tbody + tbody {
            border-top: 2px solid #dee2e6;
        }
        .btn-action {
            margin-right: 10px;
            display: inline-flex;
            align-items: center;
            border: none;
            background: none;
            cursor: pointer;
            text-decoration: none;
        }
        .badge {
            display: inline-block;
            padding: 0.35em 0.65em;
            font-size: 0.75em;
            font-weight: 700;
            line-height: 1;
            text-align: center;
            white-space: nowrap;
            vertical-align: baseline;
            border-radius: 0.35rem;
        }
        .badge-pendiente {
            background-color: #ffc107;
            color: #212529;
        }
        .badge-atendido {
            background-color: #28a745;
            color: #fff;
        }
        .btn-action i {
            font-size: 2rem; 
        }
        .icon-cambiar-estado {
            color: #28a745;
        }
        .icon-ver-historia {
            color: #17a2b8;
        }
    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <h3 class="mt-4">Atenciones del Día</h3>
        <ol class="breadcrumb mb-2">
        </ol>

        <div class="row">
            <div class="col-12">
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">
                            <i class="fas fa-calendar-check me-1"></i> Lista de Atenciones del Día
                        </h6>
                    </div>
                    <div class="card-body">
                       
                        <asp:GridView ID="gvAtenciones" runat="server" CssClass="table table-bordered table-striped" 
                            AutoGenerateColumns="False" DataKeyNames="CodigoCita,CodigoPaciente,NombreCompletoPaciente,NombreServicio,FechaCita,Estado" 
                            OnRowCommand="gvAtenciones_RowCommand">
                            <Columns>
                                <asp:BoundField DataField="CodigoCita" HeaderText="Código Cita" />
                                <asp:BoundField DataField="CodigoPaciente" HeaderText="Código Paciente" />
                                <asp:BoundField DataField="NombreCompletoPaciente" HeaderText="Paciente" />
                                <asp:BoundField DataField="NombreServicio" HeaderText="Servicio" />
                                <asp:BoundField DataField="FechaCita" HeaderText="Fecha" DataFormatString="{0:yyyy-MM-dd}" />
                                <asp:TemplateField HeaderText="Estado">
                                    <ItemTemplate>
                                        <span class='<%# Eval("Estado").ToString() == "Pendiente" ? "badge badge-pendiente" : "badge badge-atendido" %>'>
                                            <%# Eval("Estado") %>
                                        </span>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Acciones">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="btnAtender" Style="font-size:22px" runat="server" CssClass="btn-action" 
                                            CommandName="Atender" CommandArgument='<%# Container.DataItemIndex %>' ToolTip="Atender">
                                            <i class="fas fa-stethoscope icon-atender"></i>
                                        </asp:LinkButton>
                                        <asp:LinkButton ID="btnHistoria" Style="font-size:22px" runat="server" CssClass="btn-action" 
                                            CommandName="VerHistoria" CommandArgument='<%# Container.DataItemIndex %>' ToolTip="Ver Historia">
                                            <i class="fas fa-file-alt icon-ver-historia"></i>
                                        </asp:LinkButton>
                                        <asp:LinkButton ID="btnCambiarEstado" Style="font-size:22px" runat="server" CssClass="btn-action" 
                                            CommandName="CambiarEstado" CommandArgument='<%# Container.DataItemIndex %>' ToolTip="Cambiar Estado">
                                            <i class="fas fa-sync-alt icon-cambiar-estado"></i>
                                        </asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>


                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <script type="text/javascript">
        function confirmarCambioEstado(codigoCita, estadoActual) {
            Swal.fire({
                title: '¿Estás seguro?',
                text: "Cambiar el estado a Pendiente eliminará el detalle de la cita actual.",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Sí, cambiar!',
                cancelButtonText: 'Cancelar'
            }).then((result) => {
                if (result.isConfirmed) {
                    __doPostBack('CambiarEstadoCita', codigoCita + ';' + estadoActual);
                }
            });
        }


    </script>
</asp:Content>




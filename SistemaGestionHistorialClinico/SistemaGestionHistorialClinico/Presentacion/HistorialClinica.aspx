<%@ Page Title="Historia Clínica" Language="C#" MasterPageFile="~/Presentacion/Principal.master" AutoEventWireup="true" CodeBehind="HistorialClinica.aspx.cs" Inherits="SistemaGestionHistorialClinico.Presentacion.HistoriaClinica" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Historia Clínica</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@10"/>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <style>
            .btn-custom {
                margin-right: 10px;
            }
            .card-custom {
                margin-bottom: 20px;
                background-color: #f8f9fa; 
                border-radius: 8px;
                border: 1px solid #ddd;
            }
            .card-header {
                background: #2f4053;
                color: white; 
                font-weight: bold; 
            }
            .card-body {
                padding: 20px;
            }
            h5 {
                color: #2f4053; 
                font-weight: bold;
                margin-top: 20px;
            }




    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <h3 class="mt-4" style="color: #2f4053; font-weight: bold;">Historia Clínica</h3>
        <ol class="breadcrumb mb-2">
            
        </ol>

        <div class="accordion" id="accordionHistoria">
            <!-- Datos de Historia -->
            <div class="card card-custom">
                <div class="card-header" id="headingHistoria">
                <h5 class="mb-0">
                    <button class="btn" type="button" data-toggle="collapse" data-target="#collapseHistoria" aria-expanded="true" aria-controls="collapseHistoria" style="color: white; text-decoration: none;">
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

            <!-- Bloque: Información Básica de Detalle -->
            <div class="card card-custom">
                <div class="card-header" id="headingDetalles">
                <h5 class="mb-0">
                    <button class="btn" type="button" data-toggle="collapse" data-target="#collapseDetalles" aria-expanded="false" aria-controls="collapseDetalles" style="color: white; text-decoration: none;">
                        Información Básica de Detalle
                    </button>
                </h5>

                </div>
                <div id="collapseDetalles" class="collapse" aria-labelledby="headingDetalles" data-parent="#accordionHistoria">
                    <div class="card-body">
                        <asp:Label ID="lblNoDetalles" runat="server" Text="No hay detalles disponibles." Visible="false"></asp:Label>
                        <div class="card mb-3">
                            <div class="card-body">
                                <div class="form-row">
                                    <div class="form-group col-md-4">
                                        <label for="txtCodDeta"><strong>Código Detalle</strong></label>
                                        <asp:TextBox ID="txtCodDeta" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label for="txtCodHistoDetalle"><strong>Código Historia</strong></label>
                                        <asp:TextBox ID="txtCodHistoDetalle" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label for="txtCodAluDetalle"><strong>Código Alumno</strong></label>
                                        <asp:TextBox ID="txtCodAluDetalle" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-4">
                                        <label for="txtCodSerDetalle"><strong>Servicio</strong></label>
                                        <asp:TextBox ID="txtCodSerDetalle" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label for="txtFechaDeta"><strong>Fecha Detalle</strong></label>
                                        <asp:TextBox ID="txtFechaDeta" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label for="txtTipoAtenDeta"><strong>Tipo Atención</strong></label>
                                        <asp:TextBox ID="txtTipoAtenDeta" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Bloque: Motivos y Diagnóstico -->
                        <h5>Motivos y Diagnóstico</h5>
                        <div class="card mb-3">
                            <div class="card-body">
                                <div class="form-row">
                                    <div class="form-group col-md-4">
                                        <label for="txtMotConsDeta"><strong>Motivo Consulta</strong></label>
                                        <asp:TextBox ID="txtMotConsDeta" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label for="txtEnfeActuDeta"><strong>Enfermedad Actual</strong></label>
                                        <asp:TextBox ID="txtEnfeActuDeta" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label for="txtDiasEnferDeta"><strong>Días Enfermedad</strong></label>
                                        <asp:TextBox ID="txtDiasEnferDeta" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-4">
                                        <label for="txtPatoloDeta"><strong>Patología</strong></label>
                                        <asp:TextBox ID="txtPatoloDeta" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label for="txtDiagnosticoDeta"><strong>Diagnóstico</strong></label>
                                        <asp:TextBox ID="txtDiagnosticoDeta" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label for="txtEstadoDeta"><strong>Estado</strong></label>
                                        <asp:TextBox ID="txtEstadoDeta" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Bloque: Tratamiento y Medicación -->
                        <h5>Tratamiento y Medicación</h5>
                        <div class="card mb-3">
                            <div class="card-body">
                                <div class="form-row">
                                    <div class="form-group col-md-4">
                                        <label for="txtTatamientoDeta"><strong>Tratamiento</strong></label>
                                        <asp:TextBox ID="txtTatamientoDeta" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label for="ddlMedicamentoDeta"><strong>Medicamento</strong></label>
                                        <asp:DropDownList ID="ddlMedicamentoDeta" runat="server" CssClass="form-control">
                                            <asp:ListItem Value="" Text="Seleccione un medicamento" />
                                            <asp:ListItem Value="Ibuprofeno" Text="Ibuprofeno" />
                                            <asp:ListItem Value="Paracetamol" Text="Paracetamol" />
                                            <asp:ListItem Value="Amoxicilina" Text="Amoxicilina" />
                                            <asp:ListItem Value="Omeprazol" Text="Omeprazol" />
                                            <asp:ListItem Value="Metformina" Text="Metformina" />
                                            <asp:ListItem Value="Atorvastatina" Text="Atorvastatina" />
                                            <asp:ListItem Value="Losartán" Text="Losartán" />
                                            <asp:ListItem Value="Salbutamol" Text="Salbutamol" />
                                            <asp:ListItem Value="Claritromicina" Text="Claritromicina" />
                                            <asp:ListItem Value="Metoprolol" Text="Metoprolol" />
                                            <asp:ListItem Value="Aspirina" Text="Aspirina" />
                                            <asp:ListItem Value="Simvastatina" Text="Simvastatina" />
                                            <asp:ListItem Value="Loratadina" Text="Loratadina" />
                                            <asp:ListItem Value="Cetirizina" Text="Cetirizina" />
                                            <asp:ListItem Value="Ranitidina" Text="Ranitidina" />
                                            <asp:ListItem Value="Diclofenaco" Text="Diclofenaco" />
                                            <asp:ListItem Value="Enalapril" Text="Enalapril" />
                                            <asp:ListItem Value="Prednisona" Text="Prednisona" />
                                            <asp:ListItem Value="Levotiroxina" Text="Levotiroxina" />
                                            <asp:ListItem Value="Clopidogrel" Text="Clopidogrel" />
                                            <asp:ListItem Value="Fluconazol" Text="Fluconazol" />
                                            <asp:ListItem Value="Furosemida" Text="Furosemida" />
                                            <asp:ListItem Value="Glucosa" Text="Glucosa" />
                                            <asp:ListItem Value="Lansoprazol" Text="Lansoprazol" />
                                            <asp:ListItem Value="Naproxeno" Text="Naproxeno" />
                                        </asp:DropDownList>
                                    </div>

                                    <div class="form-group col-md-4">
                                        <label for="txtCantidadDeta"><strong>Cantidad</strong></label>
                                        <asp:TextBox ID="txtCantidadDeta" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-4">
                                        <label for="txtDosisDeta"><strong>Dosis</strong></label>
                                        <asp:TextBox ID="txtDosisDeta" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label for="ddlCodEnferDeta"><strong>Enfermedad</strong></label>
                                        <asp:DropDownList ID="ddlCodEnferDeta" runat="server" CssClass="form-control">
                                            <asp:ListItem Text="Seleccione una enfermedad" Value="" />
                                            <asp:ListItem Text="Diabetes" Value="Diabetes" />
                                            <asp:ListItem Text="Hipertensión" Value="Hipertensión" />
                                            <asp:ListItem Text="Asma" Value="Asma" />
                                            <asp:ListItem Text="Artritis" Value="Artritis" />
                                            <asp:ListItem Text="Cáncer" Value="Cáncer" />
                                            <asp:ListItem Text="Enfermedad de Alzheimer" Value="Enfermedad de Alzheimer" />
                                            <asp:ListItem Text="Enfermedad cardíaca" Value="Enfermedad cardíaca" />
                                            <asp:ListItem Text="Obesidad" Value="Obesidad" />
                                            <asp:ListItem Text="Depresión" Value="Depresión" />
                                            <asp:ListItem Text="Ansiedad" Value="Ansiedad" />
                                            <asp:ListItem Text="Migraña" Value="Migraña" />
                                            <asp:ListItem Text="Bronquitis" Value="Bronquitis" />
                                            <asp:ListItem Text="EPOC" Value="EPOC" />
                                            <asp:ListItem Text="Osteoporosis" Value="Osteoporosis" />
                                            <asp:ListItem Text="Gripe" Value="Gripe" />
                                        </asp:DropDownList>
                                    </div>

                                    <div class="form-group col-md-4">
                                        <label for="txtCuracionDeta"><strong>Curación</strong></label>
                                        <asp:TextBox ID="txtCuracionDeta" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-4">
                                        <label for="txtInyeccionDeta"><strong>Inyección</strong></label>
                                        <asp:TextBox ID="txtInyeccionDeta" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Planificación Familiar -->
                        <h5>Planificación Familiar</h5>
                        <div class="card mb-3">
                            <div class="card-body">
                                <div class="form-row">
                                    <div class="form-group col-md-4">
                                        <label for="txtHijosDeta"><strong>Número de Hijos</strong></label>
                                        <asp:TextBox ID="txtHijosDeta" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label for="txt0a3Deta"><strong>0 a 3 Años</strong></label>
                                        <asp:TextBox ID="txt0a3Deta" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label for="txt3a5Deta"><strong>3 a 5 Años</strong></label>
                                        <asp:TextBox ID="txt3a5Deta" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-4">
                                        <label for="txtMayor7Deta"><strong>Mayor de 7 Años</strong></label>
                                        <asp:TextBox ID="txtMayor7Deta" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label for="txtRnmascDeta"><strong>Recién Nacidos Masculinos</strong></label>
                                        <asp:TextBox ID="txtRnmascDeta" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label for="txtRnfemeDeta"><strong>Recién Nacidos Femeninos</strong></label>
                                        <asp:TextBox ID="txtRnfemeDeta" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-row">
                                  <div class="form-group col-md-4">
                                    <label for="ddlPartoNorDeta"><strong>Parto Normal</strong></label>
                                    <asp:DropDownList ID="ddlPartoNorDeta" runat="server" CssClass="form-control">
                                        <asp:ListItem Value="Si" Text="Sí" />
                                        <asp:ListItem Value="No" Text="No" />
                                    </asp:DropDownList>
                                </div>

                                <div class="form-group col-md-4">
                                    <label for="ddlPartoCesariDeta"><strong>Parto Cesárea</strong></label>
                                    <asp:DropDownList ID="ddlPartoCesariDeta" runat="server" CssClass="form-control">
                                        <asp:ListItem Value="Si" Text="Sí" />
                                        <asp:ListItem Value="No" Text="No" />
                                    </asp:DropDownList>
                                </div>

                                </div>
                            </div>
                        </div>

                        <div class="text-right mt-4">
                            <asp:Button ID="btnGuardarActualizar" runat="server" Text="Guardar" CssClass="btn btn-primary btn-custom" OnClick="BtnGuardarActualizar_Click"/>
                            <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" CssClass="btn btn-secondary btn-custom" OnClick="BtnCancelar_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</asp:Content>

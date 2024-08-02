<%@ Page Title="Pacientes" Language="C#" MasterPageFile="~/Presentacion/Principal.master" AutoEventWireup="true" CodeBehind="Pacientes.aspx.cs" Inherits="SistemaGestionHistorialClinico.Presentacion.Pacientes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Pacientes</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <h3 class="mt-4">Pacientes</h3>
        <ol class="breadcrumb mb-2">
            <%-- <li class="breadcrumb-item"><a href="Dashboard.aspx">Dashboard</a></li>
            <li class="breadcrumb-item active">Pacientes</li> --%>
        </ol>

        <div class="row">
            <div class="col-12">
                <div class="card mb-4">
                    <div class="card-header">
                        <i class="fas fa-chart-area me-1"></i>
                        Lista de Pacientes
                    </div>
                    <div class="card-body">
                        <asp:GridView ID="gvPacientes" runat="server" CssClass="table table-striped table-bordered" AutoGenerateColumns="False" OnRowCommand="gvPacientes_RowCommand">
                            <Columns>
                                <asp:BoundField DataField="strCod_alu" HeaderText="Código" />
                                <asp:BoundField DataField="VALCED_ALU" HeaderText="Cédula" />
                                <asp:BoundField DataField="NOMBRE_ALU" HeaderText="Nombre" />
                                <asp:TemplateField HeaderText="Apellido">
                                    <ItemTemplate>
                                        <%# Eval("APELLIDO_ALU") + " " + Eval("APELLIDOM_ALU") %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="SEXO_ALU" HeaderText="Sexo" />
                                <asp:BoundField DataField="FNAC_ALU" HeaderText="Fecha de Nacimiento" />
                                <asp:BoundField DataField="DIRECCION_ALU" HeaderText="Dirección" />
                                <asp:BoundField DataField="FONCEL_ALU" HeaderText="Teléfono" />
                                <asp:TemplateField HeaderText="Acciones">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="btnVerHistorial" runat="server" CommandName="VerHistorial" CommandArgument='<%# Eval("strCod_alu") %>' CssClass="btn btn-info btn-sm">
                                            <i class="fas fa-notes-medical"></i> Historial
                                        </asp:LinkButton>
                                        <asp:LinkButton ID="btnVerCitas" runat="server" CommandName="VerCitas" CommandArgument='<%# Eval("strCod_alu") %>' CssClass="btn btn-warning btn-sm">
                                            <i class="fas fa-calendar-alt"></i> Citas
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
</asp:Content>

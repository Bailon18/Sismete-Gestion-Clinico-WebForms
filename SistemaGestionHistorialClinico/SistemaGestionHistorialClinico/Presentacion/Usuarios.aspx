<%@ Page Title="Usuarios" Language="C#" MasterPageFile="~/Presentacion/Principal.master" AutoEventWireup="true" CodeBehind="Usuarios.aspx.cs" Inherits="SistemaGestionHistorialClinico.Presentacion.Usuarios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Usuarios</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <h3 class="mt-4">Usuarios</h3>
        <ol class="breadcrumb mb-2">
            <%-- <li class="breadcrumb-item"><a href="Dashboard.aspx">Dashboard</a></li>
            <li class="breadcrumb-item active">Usuarios</li> --%>
        </ol>

        <div class="row">
            <div class="col-12">
                <div class="card mb-4">
                    <div class="card-header">
                        <i class="fas fa-chart-area me-1"></i>
                        Lista de Usuarios
                    </div>
                    <div class="card-body">
                        <asp:GridView ID="gvUsuarios" runat="server" CssClass="table table-striped table-bordered" AutoGenerateColumns="False">
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
                                <asp:BoundField DataField="strRol" HeaderText="Rol" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

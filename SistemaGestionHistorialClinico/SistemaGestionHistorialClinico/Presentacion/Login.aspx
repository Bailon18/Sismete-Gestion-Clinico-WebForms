<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="SistemaGestionHistorialClinico.Presentacion.Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet" />
    <style>
        .vh-100 {
                height: 100vh;
            }
            .password-toggle {
                cursor: pointer;
                float: right;
                margin-right: 10px;
                margin-top: -25px;
                position: relative;
                z-index: 2;
            }
            .small-logo {
                height: 170px;
                width: auto;
            }
            body {
                background: url('../Content/fondo2.jpg') no-repeat center center fixed;
                background-size: cover;
            }
            .overlay {
                padding: 20px;
                border-radius: 5px;
            }
    </style>
</head>
<body>
    <form id="form1" runat="server" class="d-flex justify-content-center align-items-center vh-100">
        <div class="overlay card p-4" style="width: 20rem;">
            <div class="text-center">
                <img src="../Content/logo.jpg" alt="Logon Image" class="img-fluid mb-3 small-logo" />
            </div>
            <div class="form-group">
                <label for="txtUsername" class="form-label"><i class="fas fa-user"></i> Username:</label>
                <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" Text="medico03"/>
            </div>
            <div class="form-group">
                <label for="txtPassword" class="form-label"><i class="fas fa-lock"></i> Password:</label>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control" Text="admin"/>
                <span class="fas fa-eye password-toggle" onclick="togglePassword()"></span>
            </div>
            <div class="form-group text-center">
                <asp:Button ID="btnLogin" runat="server" Text="Ingresar" OnClick="btnLogin_Click" CssClass="btn btn-primary btn-block" />
            </div>
            <asp:Label ID="lblMessage" runat="server" ForeColor="Red" CssClass="form-text text-center"></asp:Label>
        </div>
    </form>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>
    <script>
        function togglePassword() {
            var passwordField = document.getElementById('<%= txtPassword.ClientID %>');
            var passwordToggle = document.querySelector('.password-toggle');
            if (passwordField.type === 'password') {
                passwordField.type = 'text';
                passwordToggle.classList.remove('fa-eye');
                passwordToggle.classList.add('fa-eye-slash');
            } else {
                passwordField.type = 'password';
                passwordToggle.classList.remove('fa-eye-slash');
                passwordToggle.classList.add('fa-eye');
            }
        }
    </script>
</body>
</html>

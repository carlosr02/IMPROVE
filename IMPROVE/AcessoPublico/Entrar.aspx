<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Entrar.aspx.cs" Inherits="IMPROVE.AcessoPublico.Entrar" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Entrar | Improve</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Login ID="Login1" runat="server" CreateUserText="Cadastrar-se" CreateUserUrl="~/AcessoPublico/Cadastrar.aspx" DestinationPageUrl="~/PaginaInicial.aspx" DisplayRememberMe="True" OnAuthenticate="Login1_Authenticate"></asp:Login>
    </div>
    </form>
</body>
</html>

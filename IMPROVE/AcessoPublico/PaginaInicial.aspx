<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PaginaInicial.aspx.cs" Inherits="IMPROVE.AcessoPublico.PaginaInicial" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Página Inicial | Improve</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        Bem-vindo, ao nosso site!
        <asp:HyperLink ID="Entrar" runat="server" NavigateUrl="~/AcessoPublico/Entrar.aspx">Entrar</asp:HyperLink>
        <asp:HyperLink ID="Cadastrar" runat="server" NavigateUrl="~/AcessoPublico/Cadastrar.aspx">Cadastrar-se</asp:HyperLink>
    </div>
    </form>
</body>
</html>

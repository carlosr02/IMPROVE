<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PaginaInicial.aspx.cs" Inherits="IMPROVE.PaginaInicial" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Página Inicial | Improve</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        Parabéns, <asp:LoginName ID="LoginName1" runat="server" /> está no nosso site!</div>
        Clique aqui para <asp:LoginStatus ID="LoginStatus1" runat="server" LogoutPageUrl="~/AcessoPublico/PaginaInicial.aspx" LogoutText="Sair" LoginText="Entrar" LogoutAction="Redirect" />
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Mochila.aspx">Mochila</asp:HyperLink>
        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/AlterarSenha.aspx">Alterar Senha</asp:HyperLink>
        <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/Perfil.aspx">Perfil</asp:HyperLink>
        <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/Configuracoes.aspx">Configurações</asp:HyperLink>
    </form>
</body>
</html>

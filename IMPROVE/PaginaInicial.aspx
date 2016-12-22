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
        <br /><asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Perfil/Perfil.aspx">Perfil</asp:HyperLink>
        <br /><asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/AnotacaoETarefa/AnotacaoETarefa.aspx">Anotações e Tarefas</asp:HyperLink>
        <br /><asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/Agenda/Agenda.aspx">Agenda</asp:HyperLink> 
        <br /><asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/Mochila/Mochila.aspx">Mochila</asp:HyperLink> 
    </form>
</body>
</html>

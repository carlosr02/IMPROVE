<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Perfil.aspx.cs" Inherits="IMPROVE.Perfil" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Perfil | Improve</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table>
            <tr>
                <td colspan="2"><asp:Image ID="ImagePerfil" runat="server" Height="50px" /></td>
            </tr>
            <tr>
                <td>Nome Completo: </td>
                <td><asp:Label ID="LabelNome" runat="server" Text=""></asp:Label></td>
            </tr>
            <tr>
                <td>Data de Nascimento: </td>
                <td><asp:Label ID="LabelDataNascimento" runat="server" Text=""></asp:Label></td>
            </tr>
            <tr>
                <td>Email: </td>
                <td><asp:Label ID="LabelEmail" runat="server" Text=""></asp:Label></td>
            </tr>
            <tr>
                <td>Usuário: </td>
                <td><asp:Label ID="LabelUsuario" runat="server" Text=""></asp:Label></td>
            </tr>
            <tr>
                <td>Senha: </td>
                <td><asp:Label ID="LabelSenha" runat="server" Text=""></asp:Label></td>
            </tr>
        </table>
        <br />
        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Perfil/Configuracoes.aspx">Configurações</asp:HyperLink>
        <br />
        <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/Perfil/AlterarSenha.aspx">Alterar Senha</asp:HyperLink>
        <br />
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/PaginaInicial.aspx">Voltar para Página Inicial</asp:HyperLink>
    </div>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Configuracoes.aspx.cs" Inherits="IMPROVE.Configuracoes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Configurações | Improve</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table>
                <tr>
                    <td><asp:Image ID="ImagePerfil" runat="server" Height="50px" /></td>
                    <td><asp:FileUpload ID="FileUpload1" runat="server" /></td>
                </tr>
                <tr>
                    <td>Nome Completo: </td>
                    <td><asp:TextBox ID="TextBoxNome" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Data de Nascimento: </td>
                    <td><asp:TextBox ID="TextBoxDataNascimento" runat="server" type="date"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Email: </td>
                    <td><asp:TextBox ID="TextBoxEmail" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td colspan="2"><asp:Button ID="ButtonEditar" runat="server" Text="Editar" OnClick="ButtonEditar_Click" /></td>
                </tr>
            </table>
            <br />
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Perfil/Perfil.aspx">Voltar para o Perfil</asp:HyperLink>
        </div>
    </form>
</body>
</html>

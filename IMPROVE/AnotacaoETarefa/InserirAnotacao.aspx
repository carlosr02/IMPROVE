<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InserirAnotacao.aspx.cs" Inherits="IMPROVE.InserirAnotacao" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Criar Anotação | Improve</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table>
            <tr>
                <td>Título:</td>
                <td><asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Descrição:</td>
                <td><asp:TextBox ID="TextBox2" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Favorito:</td>
                <td><asp:CheckBox ID="CheckBox1" runat="server" /></td>
            </tr>
            <tr>
                <td colspan="2"><asp:Button ID="Button1" runat="server" Text="Criar Anotação" OnClick="Button1_Click" />
            </tr>
        </table>
    </div>
    </form>
</body>
</html>

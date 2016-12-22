<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InserirEvento.aspx.cs" Inherits="IMPROVE.InserirEvento" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Criar Evento | Improve</title>
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
                <td>Descricao:</td>
                <td><asp:TextBox ID="TextBox2" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Dia Evento:</td>
                <td><asp:TextBox ID="TextBox3" runat="server" type="date"></asp:TextBox></td>
            </tr>
            <tr>
                <td colspan="2"><asp:Button ID="Button1" runat="server" Text="Criar Evento" OnClick="Button1_Click" /></td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>

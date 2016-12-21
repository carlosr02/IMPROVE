<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InserirTarefa.aspx.cs" Inherits="IMPROVE.InserirTarefa" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table>
                <tr>
                    <td>Descrição:</td>
                    <td><asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Prioritaria:</td>
                    <td><asp:CheckBox ID="CheckBox2" runat="server" /></td>
                </tr>
                <tr>
                    <td colspan="2"><asp:Button ID="Button1" runat="server" Text="Criar Tarefa" OnClick="Button1_Click" />
                </tr>
            </table>
        </div>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Configuracoes.aspx.cs" Inherits="IMPROVE.Configuracoes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Configurações | Improve</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Image ID="ImagePerfil" runat="server" />
        <asp:FileUpload ID="FileUpload1" runat="server" />
        <asp:TextBox ID="TextBoxEmail" runat="server"></asp:TextBox>
        <asp:TextBox ID="TextBoxNome" runat="server"></asp:TextBox>
        <asp:TextBox ID="TextBoxDataNascimento" runat="server" type="date"></asp:TextBox>
        <asp:Button ID="ButtonEditar" runat="server" Text="Button" OnClick="ButtonEditar_Click" />
    </div>
    </form>
</body>
</html>

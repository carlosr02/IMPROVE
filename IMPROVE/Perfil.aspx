<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Perfil.aspx.cs" Inherits="IMPROVE.Perfil" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Perfil | Improve</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Image ID="ImagePerfil" runat="server" />
        <asp:Label ID="LabelNome" runat="server" Text=""></asp:Label>
        <asp:Label ID="LabelDataNascimento" runat="server" Text=""></asp:Label>
        <asp:Label ID="LabelEmail" runat="server" Text=""></asp:Label>
        <asp:Label ID="LabelUsuario" runat="server" Text=""></asp:Label>
        <asp:Label ID="LabelSenha" runat="server" Text=""></asp:Label>
    </div>
    </form>
</body>
</html>

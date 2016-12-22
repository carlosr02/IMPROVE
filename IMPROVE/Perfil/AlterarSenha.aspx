<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AlterarSenha.aspx.cs" Inherits="IMPROVE.AlterarSenha" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Alterar Senha</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:ChangePassword ID="ChangePassword1" runat="server" CancelDestinationPageUrl="~/Perfil/Perfil.aspx" ContinueDestinationPageUrl="~/Perfil/Perfil.aspx" EditProfileUrl="~/Perfil/Configuracoes.aspx" SuccessPageUrl="~/Perfil/Perfil.aspx"></asp:ChangePassword>
    </div>
    </form>
</body>
</html>

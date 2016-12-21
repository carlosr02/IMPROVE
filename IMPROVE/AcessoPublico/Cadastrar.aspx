<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cadastrar.aspx.cs" Inherits="IMPROVE.AcessoPublico.Cadastrar" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Cadastro | Improve</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:CreateUserWizard ID="CreateUserWizard1" runat="server" CancelDestinationPageUrl="~/AcessoPublico/PaginaInicial.aspx" ContinueDestinationPageUrl="~/PaginaInicial.aspx" OnCreatedUser="CreateUserWizard1_CreatedUser">
            <WizardSteps>
                <asp:CreateUserWizardStep ID="CreateUserWizardStep1" runat="server">
                </asp:CreateUserWizardStep>
                <asp:CompleteWizardStep ID="CompleteWizardStep1" runat="server">
                </asp:CompleteWizardStep>
            </WizardSteps>
        </asp:CreateUserWizard>
    </div>
    </form>
</body>
</html>

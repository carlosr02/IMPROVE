<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Agenda.aspx.cs" Inherits="IMPROVE.Agenda" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Agenda | Improve</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Button ID="ButtonAgenda" runat="server" Text="Adicionar Evento" PostBackUrl="~/Agenda/InserirEvento.aspx" /><br />
            <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="ObjectDataSource1" DataKeyNames="Id" OnRowUpdating="GridView1_RowUpdating" OnRowDeleting="GridView1_RowDeleting">
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" Visible="False" />
                <asp:BoundField DataField="Titulo" HeaderText="Titulo" SortExpression="Titulo" />
                <asp:BoundField DataField="Descricao" HeaderText="Descricao" SortExpression="Descricao" />
                <asp:BoundField DataField="DiaEvento" HeaderText="DiaEvento" SortExpression="DiaEvento" DataFormatString="{0:d}" />
                <asp:BoundField DataField="HorarioCadastro" HeaderText="HorarioCadastro" ReadOnly="True" SortExpression="HorarioCadastro" Visible="False" />
                <asp:BoundField DataField="HorarioModificao" HeaderText="HorarioModificao" SortExpression="HorarioModificao" ReadOnly="True" />
                <asp:BoundField DataField="Usuario_id" HeaderText="Usuario_id" ReadOnly="True" SortExpression="Usuario_id" Visible="False" />
                <asp:TemplateField ShowHeader="False">
                    <EditItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Atualizar"></asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar"></asp:LinkButton>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Editar"></asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" OnClientClick="javascript:return ConfirmaExclusao();" Text="Excluir"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DataObjectTypeName="IMPROVE.Modelo.Evento" DeleteMethod="Delete" InsertMethod="Insert" SelectMethod="SelectAll" TypeName="IMPROVE.DAL.DALEvento" UpdateMethod="Update">
            <SelectParameters>
                <asp:SessionParameter DbType="Guid" Name="usuario_id" SessionField="userId" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <br />
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/PaginaInicial.aspx">Voltar para Página Inicial</asp:HyperLink>
    </div>
    </form>
</body>
<script language="javascript">
    function ConfirmaExclusao() {
        return confirm('Deseja realmente excluir este registro?');
    }
</script>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Mochila.aspx.cs" Inherits="IMPROVE.Mochila" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Mochila | Improve</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:FileUpload ID="FileUploadArquivo" runat="server" /><asp:Button ID="Upload" runat="server" Text="Upload" OnClick="Upload_Click" />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="ObjectDataSource1" OnRowCommand="GridView1_RowCommand" OnRowDeleting="GridView1_RowDeleting" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowUpdating="GridView1_RowUpdating">
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" Visible="False" />
                <asp:BoundField DataField="Descricao" HeaderText="Descricao" SortExpression="Descricao" />
                <asp:BoundField DataField="Endereco" HeaderText="Endereco" SortExpression="Endereco" Visible="False" />
                <asp:BoundField DataField="TamanhoArquivo" HeaderText="TamanhoArquivo" SortExpression="TamanhoArquivo" ReadOnly="True" />
                <asp:BoundField DataField="HorarioEnvio" HeaderText="HorarioEnvio" ReadOnly="True" SortExpression="HorarioEnvio" Visible="False" />
                <asp:BoundField DataField="HorarioModificao" HeaderText="HorarioModificao" SortExpression="HorarioModificao" ReadOnly="True" />
                <asp:BoundField DataField="Usuario_id" HeaderText="Usuario_id" ReadOnly="True" SortExpression="Usuario_id" Visible="False" />
                <asp:ButtonField CommandName="Baixar" Text="Baixar" />
                <asp:TemplateField ShowHeader="False">
                    <EditItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Atualizar"></asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar"></asp:LinkButton>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Editar"></asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Select" Text="Selecionar"></asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False" CommandName="Delete" OnClientClick="javascript:return ConfirmaExclusao();" Text="Excluir"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DataObjectTypeName="IMPROVE.Modelo.Arquivo" DeleteMethod="Delete" InsertMethod="Insert" SelectMethod="SelectAll" TypeName="IMPROVE.DAL.DALArquivo" UpdateMethod="Update">
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

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AnotacaoETarefa.aspx.cs" Inherits="IMPROVE.AnotacaoETarefa" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Anotação e Tarefa | Improve</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="ButtonAnotacao" runat="server" Text="Adicionar Anotação" PostBackUrl="~/AnotacaoETarefa/InserirAnotacao.aspx" /><br />
            <br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="ObjectDataSource1" DataKeyNames="Id" OnRowDeleting="GridView1_RowDeleting" OnRowUpdating="GridView1_RowUpdating">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" Visible="False" />
                    <asp:BoundField DataField="Titulo" HeaderText="Titulo" SortExpression="Titulo" />
                    <asp:BoundField DataField="Descricao" HeaderText="Descricao" SortExpression="Descricao" />
                    <asp:CheckBoxField DataField="Favorito" HeaderText="Favorito" SortExpression="Favorito" />
                    <asp:BoundField DataField="HorarioEnvio" HeaderText="HorarioEnvio" ReadOnly="True" SortExpression="HorarioEnvio" Visible="False" />
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
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DataObjectTypeName="IMPROVE.Modelo.Anotacao" DeleteMethod="Delete" InsertMethod="Insert" SelectMethod="SelectAll" TypeName="IMPROVE.DAL.DALAnotacao" UpdateMethod="Update">
                <SelectParameters>
                    <asp:SessionParameter DbType="Guid" Name="usuario_id" SessionField="userId" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <br />

            <asp:Button ID="ButtonTarefa" runat="server" Text="Adicionar Tarefa" PostBackUrl="~/AnotacaoETarefa/InserirTarefa.aspx" /><br />
            <br>
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="ObjectDataSource2" OnRowDeleting="GridView2_RowDeleting" OnRowUpdating="GridView2_RowUpdating" DataKeyNames="Id">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" Visible="False" />
                    <asp:BoundField DataField="Descricao" HeaderText="Descricao" SortExpression="Descricao" />
                    <asp:CheckBoxField DataField="Cumprida" HeaderText="Cumprida" SortExpression="Cumprida" />
                    <asp:CheckBoxField DataField="Prioritaria" HeaderText="Prioritaria" SortExpression="Prioritaria" />
                    <asp:BoundField DataField="HorarioEnvio" HeaderText="HorarioEnvio" ReadOnly="True" SortExpression="HorarioEnvio" Visible="False" />
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
            <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" DataObjectTypeName="IMPROVE.Modelo.Tarefa" DeleteMethod="Delete" InsertMethod="Insert" SelectMethod="SelectAll" TypeName="IMPROVE.DAL.DALTarefa" UpdateMethod="Update">
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

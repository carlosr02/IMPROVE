<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AnotacaoETarefa.aspx.cs" Inherits="IMPROVE.AnotacaoETarefa" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Anotação e Tarefa</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="ObjectDataSource1">
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" Visible="False" />
                <asp:BoundField DataField="Titulo" HeaderText="Titulo" SortExpression="Titulo" />
                <asp:BoundField DataField="Descricao" HeaderText="Descricao" SortExpression="Descricao" />
                <asp:CheckBoxField DataField="Favorito" HeaderText="Favorito" SortExpression="Favorito" />
                <asp:BoundField DataField="HorarioEnvio" HeaderText="HorarioEnvio" ReadOnly="True" SortExpression="HorarioEnvio" Visible="False" />
                <asp:BoundField DataField="HorarioModificao" HeaderText="HorarioModificao" SortExpression="HorarioModificao" />
                <asp:BoundField DataField="Usuario_id" HeaderText="Usuario_id" ReadOnly="True" SortExpression="Usuario_id" Visible="False" />
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
            </Columns>
        </asp:GridView>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DataObjectTypeName="IMPROVE.Modelo.Anotacao" DeleteMethod="Delete" InsertMethod="Insert" SelectMethod="SelectAll" TypeName="IMPROVE.DAL.DALAnotacao" UpdateMethod="Update">
            <SelectParameters>
                <asp:SessionParameter DbType="Guid" Name="usuario_id" SessionField="userId" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <br />
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="ObjectDataSource2">
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" Visible="False" />
                <asp:BoundField DataField="Descricao" HeaderText="Descricao" SortExpression="Descricao" />
                <asp:CheckBoxField DataField="Cumprida" HeaderText="Cumprida" SortExpression="Cumprida" />
                <asp:CheckBoxField DataField="Prioritaria" HeaderText="Prioritaria" SortExpression="Prioritaria" />
                <asp:BoundField DataField="HorarioEnvio" HeaderText="HorarioEnvio" ReadOnly="True" SortExpression="HorarioEnvio" Visible="False" />
                <asp:BoundField DataField="HorarioModificao" HeaderText="HorarioModificao" SortExpression="HorarioModificao" />
                <asp:BoundField DataField="Usuario_id" HeaderText="Usuario_id" ReadOnly="True" SortExpression="Usuario_id" Visible="False" />
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
            </Columns>
        </asp:GridView>
        <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" DataObjectTypeName="IMPROVE.Modelo.Tarefa" DeleteMethod="Delete" InsertMethod="Insert" SelectMethod="SelectAll" TypeName="IMPROVE.DAL.DALTarefa" UpdateMethod="Update">
            <SelectParameters>
                <asp:SessionParameter DbType="Guid" Name="usuario_id" SessionField="userId" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </div>
    </form>
</body>
</html>

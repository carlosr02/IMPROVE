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
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="ObjectDataSource1" OnRowCommand="GridView1_RowCommand" OnRowDeleting="GridView1_RowDeleting" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" Visible="False" />
                <asp:BoundField DataField="Descricao" HeaderText="Descricao" SortExpression="Descricao" />
                <asp:BoundField DataField="Endereco" HeaderText="Endereco" SortExpression="Endereco" Visible="False" />
                <asp:BoundField DataField="TamanhoArquivo" HeaderText="TamanhoArquivo" SortExpression="TamanhoArquivo" />
                <asp:BoundField DataField="HorarioEnvio" HeaderText="HorarioEnvio" ReadOnly="True" SortExpression="HorarioEnvio" Visible="False" />
                <asp:BoundField DataField="HorarioModificao" HeaderText="HorarioModificao" SortExpression="HorarioModificao" />
                <asp:BoundField DataField="Usuario_id" HeaderText="Usuario_id" ReadOnly="True" SortExpression="Usuario_id" Visible="False" />
                <asp:ButtonField CommandName="Baixar" Text="Baixar" />
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
            </Columns>
        </asp:GridView>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DataObjectTypeName="IMPROVE.Modelo.Arquivo" DeleteMethod="Delete" InsertMethod="Insert" SelectMethod="SelectAll" TypeName="IMPROVE.DAL.DALArquivo" UpdateMethod="Update">
            <SelectParameters>
                <asp:SessionParameter DbType="Guid" Name="usuario_id" SessionField="userId" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </div>
    </form>
</body>
</html>

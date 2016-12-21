<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Sala.aspx.cs" Inherits="IMPROVE.Sala" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="ObjectDataSource1">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
                <asp:BoundField DataField="Descricao" HeaderText="Descricao" SortExpression="Descricao" />
                <asp:BoundField DataField="HorarioEnvio" HeaderText="HorarioEnvio" ReadOnly="True" SortExpression="HorarioEnvio" />
                <asp:BoundField DataField="HorarioModificao" HeaderText="HorarioModificao" SortExpression="HorarioModificao" />
                <asp:BoundField DataField="Usuario_id" HeaderText="Usuario_id" ReadOnly="True" SortExpression="Usuario_id" />
                <asp:BoundField DataField="Sala_id" HeaderText="Sala_id" ReadOnly="True" SortExpression="Sala_id" />
            </Columns>
        </asp:GridView>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DataObjectTypeName="IMPROVE.Modelo.Mensagem" DeleteMethod="Delete" InsertMethod="Insert" SelectMethod="SelectAll" TypeName="IMPROVE.DAL.DALMensagem" UpdateMethod="Update">
            <SelectParameters>
                <asp:QueryStringParameter Name="sala_id" QueryStringField="sala_id" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </div>
    </form>
</body>
</html>

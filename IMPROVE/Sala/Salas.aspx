<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Salas.aspx.cs" Inherits="IMPROVE.Salas" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:GridView ID="GridView1" runat="server" DataSourceID="ObjectDataSource1"></asp:GridView>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server"></asp:ObjectDataSource>
    </div>
    </form>
</body>
</html>

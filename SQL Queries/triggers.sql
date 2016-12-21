create trigger criarUsuario on dbo.aspnet_Membership
after insert
as
	declare @id uniqueidentifier
	declare @usuario nvarchar(256)
	declare @email nvarchar(256)
	declare @senha nvarchar(128)

	select @id = inserted.UserId,
		   @usuario = UserName,
		   @email = Email,
		   @senha = Password
	from inserted 
	inner join dbo.aspnet_Users on dbo.aspnet_Users.UserId = inserted.UserId

	insert into dbo.Usuario(id,usuario,email,senha, enderecoFoto) values (@id, @usuario, @email, @senha)

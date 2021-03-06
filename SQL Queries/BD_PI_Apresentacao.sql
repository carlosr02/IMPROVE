USE [2016TiiGrupo3]
GO
/****** Object:  UserDefinedFunction [dbo].[validarData]    Script Date: 16/12/2016 12:14:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[validarData] (@data date)
returns bit
as
begin
	declare @validacao bit
	if(@data > getdate()) set @validacao = 0
	else set @validacao = 1
	return @validacao
end

GO
/****** Object:  UserDefinedFunction [dbo].[validarEmail]    Script Date: 16/12/2016 12:14:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[validarEmail] (@email varchar(256))
returns bit
as
begin
	declare @validacao bit
	if(@email not like '%_@_%_.__%') set @validacao = 0
	else set @validacao = 1
	return @validacao
end

GO
/****** Object:  UserDefinedFunction [dbo].[validarEspacosVazios]    Script Date: 16/12/2016 12:14:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[validarEspacosVazios] (@string varchar(1000))
returns bit
as
begin
	set @string = replace(@string,' ','')
	declare @validacao bit
	if(@string = '') set @validacao = 0
	else set @validacao = 1
	return @validacao
end

GO
/****** Object:  UserDefinedFunction [dbo].[validarNota]    Script Date: 16/12/2016 12:14:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[validarNota] (@valor float)
returns bit
as
begin
	declare @validacao bit 
	if(@valor < 0)
		set @validacao = 0
	else set @validacao = 1
	return @validacao
end

GO
/****** Object:  UserDefinedFunction [dbo].[validarPeso]    Script Date: 16/12/2016 12:14:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[validarPeso] (@peso int)
returns bit
as
begin
	declare @validacao bit 
	if(@peso < 1)
		set @validacao = 0
	else set @validacao = 1
	return @validacao
end

GO
/****** Object:  UserDefinedFunction [dbo].[validarSenha]    Script Date: 16/12/2016 12:14:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[validarSenha] (@senha varchar(128))
returns bit
as
begin
	declare @validacao bit
	if(len(@senha) >= 7 and (@senha like '%!%' or @senha like '%@%' or @senha like '%#%' or @senha like '%$%' or @senha like '%%%'or @senha like '%¨%' or @senha like '%&%' or @senha like '%*%' or @senha like '%(%' or @senha like '%)%')) 
		set @validacao = 1
	else set @validacao = 0
	return @validacao
end

GO
/****** Object:  Table [dbo].[Agenda]    Script Date: 16/12/2016 12:14:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Agenda](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[titulo] [varchar](100) NOT NULL,
	[descricao] [varchar](200) NULL,
	[diaEvento] [date] NULL,
	[horarioDeCadastro] [datetime] NULL,
	[usuario_id] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Anotacao]    Script Date: 16/12/2016 12:14:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Anotacao](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[titulo] [varchar](100) NULL,
	[descricao] [varchar](200) NOT NULL,
	[favorito] [bit] NOT NULL,
	[horarioDeEnvio] [datetime] NULL,
	[usuario_id] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Arquivo]    Script Date: 16/12/2016 12:14:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Arquivo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[descricao] [varchar](120) NOT NULL,
	[endereco] [varchar](500) NOT NULL,
	[tamanhoArquivo] [varchar](100) NULL,
	[horarioDeEnvio] [datetime] NULL,
	[usuario_id] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Boletim]    Script Date: 16/12/2016 12:14:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Boletim](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[descricao] [varchar](100) NOT NULL,
	[usuario_id] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Disciplina]    Script Date: 16/12/2016 12:14:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Disciplina](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[descricao] [varchar](100) NOT NULL,
	[media] [float] NULL,
	[boletim_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Mensagem]    Script Date: 16/12/2016 12:14:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Mensagem](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[descricao] [varchar](3000) NOT NULL,
	[horarioDeEnvio] [datetime] NULL,
	[usuario_id] [uniqueidentifier] NOT NULL,
	[sala_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Nota]    Script Date: 16/12/2016 12:14:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nota](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[valor] [float] NOT NULL,
	[peso] [float] NOT NULL,
	[disciplina_id] [int] NOT NULL,
	[periodo_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[disciplina_id] ASC,
	[periodo_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Periodo]    Script Date: 16/12/2016 12:14:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Periodo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[descricao] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Sala]    Script Date: 16/12/2016 12:14:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sala](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[descricao] [varchar](60) NOT NULL,
	[senha] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tarefa]    Script Date: 16/12/2016 12:14:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tarefa](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[descricao] [varchar](140) NOT NULL,
	[cumprida] [bit] NOT NULL,
	[prioritaria] [bit] NOT NULL,
	[horarioDeEnvio] [datetime] NULL,
	[usuario_id] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 16/12/2016 12:14:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Usuario](
	[id] [uniqueidentifier] NOT NULL,
	[usuario] [nvarchar](256) NOT NULL,
	[email] [nvarchar](256) NOT NULL,
	[senha] [nvarchar](128) NOT NULL,
	[nome] [varchar](250) NULL,
	[dataDeNascimento] [date] NULL,
	[enderecoFoto] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UsuariosSala]    Script Date: 16/12/2016 12:14:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsuariosSala](
	[usuario_id] [uniqueidentifier] NOT NULL,
	[sala_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[usuario_id] ASC,
	[sala_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Agenda] ADD  DEFAULT (getdate()) FOR [horarioDeCadastro]
GO
ALTER TABLE [dbo].[Anotacao] ADD  DEFAULT (getdate()) FOR [horarioDeEnvio]
GO
ALTER TABLE [dbo].[Arquivo] ADD  DEFAULT (getdate()) FOR [horarioDeEnvio]
GO
ALTER TABLE [dbo].[Mensagem] ADD  DEFAULT (getdate()) FOR [horarioDeEnvio]
GO
ALTER TABLE [dbo].[Tarefa] ADD  DEFAULT (getdate()) FOR [horarioDeEnvio]
GO
ALTER TABLE [dbo].[Agenda]  WITH CHECK ADD FOREIGN KEY([usuario_id])
REFERENCES [dbo].[Usuario] ([id])
GO
ALTER TABLE [dbo].[Anotacao]  WITH CHECK ADD FOREIGN KEY([usuario_id])
REFERENCES [dbo].[Usuario] ([id])
GO
ALTER TABLE [dbo].[Arquivo]  WITH CHECK ADD FOREIGN KEY([usuario_id])
REFERENCES [dbo].[Usuario] ([id])
GO
ALTER TABLE [dbo].[Boletim]  WITH CHECK ADD FOREIGN KEY([usuario_id])
REFERENCES [dbo].[Usuario] ([id])
GO
ALTER TABLE [dbo].[Disciplina]  WITH CHECK ADD FOREIGN KEY([boletim_id])
REFERENCES [dbo].[Boletim] ([id])
GO
ALTER TABLE [dbo].[Mensagem]  WITH CHECK ADD FOREIGN KEY([sala_id])
REFERENCES [dbo].[Sala] ([id])
GO
ALTER TABLE [dbo].[Mensagem]  WITH CHECK ADD FOREIGN KEY([usuario_id])
REFERENCES [dbo].[Usuario] ([id])
GO
ALTER TABLE [dbo].[Tarefa]  WITH CHECK ADD FOREIGN KEY([usuario_id])
REFERENCES [dbo].[Usuario] ([id])
GO
/****** Object:  StoredProcedure [dbo].[sp_deletarSala]    Script Date: 16/12/2016 12:14:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_deletarSala]
	@id int
as
begin
	delete from Sala where id = @id
end

GO
/****** Object:  StoredProcedure [dbo].[sp_deletarTodasAnotacoesUsuario]    Script Date: 16/12/2016 12:14:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_deletarTodasAnotacoesUsuario]
	@usuario_id uniqueidentifier
as
begin
	delete from Anotacao where usuario_id = @usuario_id
end

GO
/****** Object:  StoredProcedure [dbo].[sp_deletarTodasTarefaUsuario]    Script Date: 16/12/2016 12:14:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_deletarTodasTarefaUsuario]
	@usuario_id uniqueidentifier
as
begin
	delete from Tarefa where usuario_id = @usuario_id
end

GO
/****** Object:  StoredProcedure [dbo].[sp_deletarTodosArquivosUsuario]    Script Date: 16/12/2016 12:14:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_deletarTodosArquivosUsuario]
	@usuario_id uniqueidentifier
as
begin
	delete from Arquivo where usuario_id = @usuario_id
end

GO
/****** Object:  StoredProcedure [dbo].[sp_deletarTodosUsuarios]    Script Date: 16/12/2016 12:14:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_deletarTodosUsuarios]
as
begin
	delete from Usuario
end

GO
/****** Object:  StoredProcedure [dbo].[sp_deletarUmaAnotacao]    Script Date: 16/12/2016 12:14:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_deletarUmaAnotacao]
	@id int
as
begin
	delete from Anotacao where id = @id
end

GO
/****** Object:  StoredProcedure [dbo].[sp_deletarUmArquivo]    Script Date: 16/12/2016 12:14:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_deletarUmArquivo]
	@id int
as
begin
	delete from Arquivo where id = @id
end

GO
/****** Object:  StoredProcedure [dbo].[sp_deletarUmaTarefa]    Script Date: 16/12/2016 12:14:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_deletarUmaTarefa]
	@id int
as
begin
	delete from Tarefa where id = @id
end

GO
/****** Object:  StoredProcedure [dbo].[sp_deletarUsuario]    Script Date: 16/12/2016 12:14:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_deletarUsuario]
	@id uniqueidentifier
as
begin
	delete from Usuario where id = @id
end

GO
/****** Object:  StoredProcedure [dbo].[sp_editarAnotacao]    Script Date: 16/12/2016 12:14:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_editarAnotacao]
	@id int,
	@titulo varchar(100),
	@descricao varchar(200),
	@favorito bit
as
begin
	if(dbo.validarEspacosVazios(@descricao) = 0)
	begin
		raiserror('Campo descrição vazio',16,1)
		return
	end
	update Anotacao 
	set titulo = @titulo, descricao = @descricao, favorito = @favorito
	where id = @id	
end

GO
/****** Object:  StoredProcedure [dbo].[sp_editarArquivo]    Script Date: 16/12/2016 12:14:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_editarArquivo]
	@id int,
	@descricao varchar(120),
	@endereco varchar(500),
	@tamanhoArquivo varchar(100)
as
begin
	if(dbo.validarEspacosVazios(@descricao) = 0)
	begin
		raiserror('Campo descrição vazio',16,1)
		return
	end
	if(dbo.verificarEspacosVazios(@endereco) = 0)
	begin
		raiserror('Campo endereço vazio',16,1)
		return
	end
	update Arquivo 
	set descricao = @descricao, endereco = @endereco, tamanhoArquivo = @tamanhoArquivo
	where id = @id 
end

GO
/****** Object:  StoredProcedure [dbo].[sp_editarTarefa]    Script Date: 16/12/2016 12:14:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_editarTarefa]
	@id int,
	@descricao varchar(140),
	@cumprida bit,
	@prioritaria bit
as
begin
	if(dbo.validarEspacosVazios(@descricao) = 0)
	begin
		raiserror('Campo descrição vazio',16,1)
		return
	end
	update Tarefa 
	set descricao = @descricao, cumprida = @cumprida, prioritaria = @prioritaria
	where id = @id	
end

GO
/****** Object:  StoredProcedure [dbo].[sp_inserirAnotacao]    Script Date: 16/12/2016 12:14:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_inserirAnotacao]
	@titulo varchar(100),
	@descricao varchar(200),
	@favorito bit,
	@usuario_id uniqueidentifier
as
begin
	if(dbo.validarEspacosVazios(@descricao) = 0)
	begin
		raiserror('Campo descrição vazio',16,1)
		return
	end
	insert into Anotacao(titulo,descricao,favorito,usuario_id) 
		values(@titulo,@descricao,@favorito,@usuario_id)
end

GO
/****** Object:  StoredProcedure [dbo].[sp_inserirArquivo]    Script Date: 16/12/2016 12:14:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_inserirArquivo]
	@descricao varchar(120),
	@endereco varchar(500),
	@tamanhoArquivo varchar(100),
	@usuario_id uniqueidentifier
as
begin
	if(dbo.verificarEspacosVazios(@descricao) = 0)
	begin
		raiserror('Campo descricão vazio',16,1)
		return
	end
	if(dbo.verificarEspacosVazios(@endereco) = 0)
	begin
		raiserror('Campo endereço vazio',16,1)
		return
	end
	insert into Arquivo(descricao,endereco,tamanhoArquivo,usuario_id) 
		values(@descricao,@endereco,@tamanhoArquivo,@usuario_id)
end

GO
/****** Object:  StoredProcedure [dbo].[sp_inserirSala]    Script Date: 16/12/2016 12:14:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_inserirSala]
	@descricao varchar(60),
	@senha varchar(100)
as
begin
	if(dbo.validarEspacosVazios(@descricao) = 0)
	begin
		raiserror('Campo descrição vazio',16,1)
		return
	end
	insert into Sala(descricao,senha) 
		values(@descricao,@senha)
end

GO
/****** Object:  StoredProcedure [dbo].[sp_inserirTarefa]    Script Date: 16/12/2016 12:14:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_inserirTarefa]
	@descricao varchar(140),
	@cumprida bit,
	@prioritaria bit,
	@usuario_id uniqueidentifier
as
begin
	if(dbo.validarEspacosVazios(@descricao) = 0)
	begin
		raiserror('Campo descrição vazio',16,1)
		return
	end
	insert into Tarefa(descricao,cumprida,prioritaria,usuario_id) 
		values(@descricao,0,@prioritaria,@usuario_id)
end

GO
/****** Object:  StoredProcedure [dbo].[sp_listarTodasAnotacoesUsuario]    Script Date: 16/12/2016 12:14:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_listarTodasAnotacoesUsuario]
	@usuario_id uniqueidentifier
as
begin
	select * from Anotacao where usuario_id = @usuario_id
end

GO
/****** Object:  StoredProcedure [dbo].[sp_listarTodasSalas]    Script Date: 16/12/2016 12:14:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_listarTodasSalas]
as
begin
	select * from Sala
end

GO
/****** Object:  StoredProcedure [dbo].[sp_listarTodasTarefasUsuario]    Script Date: 16/12/2016 12:14:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_listarTodasTarefasUsuario]
	@usuario_id uniqueidentifier
as
begin
	select * from Tarefa where usuario_id = @usuario_id
end

GO
/****** Object:  StoredProcedure [dbo].[sp_listarTodosArquivosUsuario]    Script Date: 16/12/2016 12:14:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_listarTodosArquivosUsuario]
	@usuario_id uniqueidentifier
as
begin
	select * from Arquivo where usuario_id = @usuario_id
end

GO
/****** Object:  StoredProcedure [dbo].[sp_listarTodosUsuarios]    Script Date: 16/12/2016 12:14:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_listarTodosUsuarios]
as
begin
	select * from Usuario
end

GO
/****** Object:  StoredProcedure [dbo].[sp_listarUmaAnotacao]    Script Date: 16/12/2016 12:14:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_listarUmaAnotacao]
	@id int
as
begin
	select * from Anotacao where id = @id
end

GO
/****** Object:  StoredProcedure [dbo].[sp_listarUmArquivo]    Script Date: 16/12/2016 12:14:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_listarUmArquivo]
	@id int
as
begin
	select * from Arquivo where id = @id
end

GO
/****** Object:  StoredProcedure [dbo].[sp_listarUmaTarefa]    Script Date: 16/12/2016 12:14:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_listarUmaTarefa]
	@id int
as
begin
	select * from Tarefa where id = @id
end

GO
/****** Object:  StoredProcedure [dbo].[sp_listarUsuario]    Script Date: 16/12/2016 12:14:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_listarUsuario]
	@id uniqueidentifier
as
begin
	select * from Usuario where id = @id
end

GO

----------------------------------------------------USUÁRIO----------------------------------------------------
create procedure sp_listarUsuario
	@id uniqueidentifier
as
begin
	select * from Usuario where id = @id
end

create procedure sp_editarUsuario
	@id uniqueidentifier,
	@email varchar(256),
	@senha varchar(128),
	@nome varchar(250),
	@dataDeNascimento date = null,
	@enderecoFoto varchar(500) 
as
begin
	if(dbo.validarData(@dataDeNascimento) = 0)
	begin
		raiserror('Data maior que a data atual',16,1)
		return
	end

	update Usuario 
	set email = @email, senha = @senha, nome = @nome, dataDeNascimento = @dataDeNascimento, enderecoFoto = @enderecoFoto
	where id = @id 
end

create procedure sp_deletarUsuario
	@id uniqueidentifier
as
begin
	delete from Usuario where id = @id
end

----------------------------------------------------TAREFA------------------------------------------------------
create procedure sp_listarTarefas
	@usuario_id uniqueidentifier
as
begin
	select * from Tarefa where usuario_id = @usuario_id
end

create procedure sp_listarTarefa
	@id int
as
begin
	select * from Tarefa where id = @id
end

create procedure sp_inserirTarefa
	@descricao varchar(140),
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

create procedure sp_editarTarefa
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
	set descricao = @descricao, cumprida = @cumprida, prioritaria = @prioritaria, horarioModificao = getdate()
	where id = @id	
end

create procedure sp_deletarTarefa
	@id int
as
begin
	delete from Tarefa where id = @id
end

----------------------------------------------------ANOTAÇÃO---------------------------------------------------
create procedure sp_listarAnotacoes
	@usuario_id uniqueidentifier
as
begin
	select * from Anotacao where usuario_id = @usuario_id
end

create procedure sp_listarAnotacao
	@id int
as
begin
	select * from Anotacao where id = @id
end

create procedure sp_inserirAnotacao
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

create procedure sp_editarAnotacao
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
	set titulo = @titulo, descricao = @descricao, favorito = @favorito, horarioModificao = getdate()
	where id = @id	
end

create procedure sp_deletarAnotacao
	@id int
as
begin
	delete from Anotacao where id = @id
end

----------------------------------------------------MOCHILA-----------------------------------------------------
create procedure sp_listarArquivo
	@id int
as
begin
	select * from Arquivo where id = @id
end

create procedure sp_listarArquivos
	@usuario_id uniqueidentifier
as
begin
	select * from Arquivo where usuario_id = @usuario_id
end

create procedure sp_inserirArquivo
	@descricao varchar(250),
	@extensao varchar(5),
	@endereco varchar(500),
	@tamanhoArquivo int,
	@usuario_id uniqueidentifier
as
begin
	insert into Arquivo(descricao,extensao,endereco,tamanhoArquivo,usuario_id) 
		values(@descricao,@extensao,@endereco,@tamanhoArquivo,@usuario_id)
end

create procedure sp_editarArquivo
	@id int,
	@descricao varchar(120),
	@endereco varchar(500),
	@tamanhoArquivo int
as
begin
	if(dbo.validarEspacosVazios(@descricao) = 0)
	begin
		raiserror('Campo descrição vazio',16,1)
		return
	end
	update Arquivo 
	set descricao = @descricao, endereco = @endereco, tamanhoArquivo = @tamanhoArquivo, horarioModificao = getdate()
	where id = @id 
end

create procedure sp_deletarArquivo
	@id int
as
begin
	delete from Arquivo where id = @id
end

-----------------------------------------------------AGENDA------------------------------------------------------
create procedure sp_listarEvento
	@id int
as
begin
	select * from Evento where id = @id
end

create procedure sp_listarEventosDia
	@diaEvento date,
	@usuario_id uniqueidentifier
as
begin
	select * from Evento where usuario_id = @usuario_id and diaEvento = @diaEvento
end


create procedure sp_listarEventos
	@usuario_id uniqueidentifier
as
begin
	select * from Evento where usuario_id = @usuario_id
end

create procedure sp_inserirEvento
	@titulo varchar (100),
	@descricao varchar(200),
	@diaEvento date,
	@usuario_id uniqueidentifier
as
begin
	if(dbo.validarEspacosVazios(@descricao) = 0)
	begin
		raiserror('Campo descrição vazio',16,1)
		return
	end
	if(dbo.validarData(@diaEvento) = 2)
	begin
		raiserror('Dia menor que a data atual',16,1)
		return
	end
	insert into Evento(titulo, descricao,diaEvento,usuario_id) 
		values(@titulo, @descricao,@diaEvento,@usuario_id)
end

create procedure sp_editarEvento
	@id int,
	@titulo varchar(100),
	@descricao varchar(200),
	@diaEvento date
as
begin
	if(dbo.validarEspacosVazios(@descricao) = 0)
	begin
		raiserror('Campo descrição vazio',16,1)
		return
	end
	if(dbo.validarData(@diaEvento) = 2)
	begin
		raiserror('Dia menor que a data atual',16,1)
		return
	end
	update Evento
	set titulo = @titulo, descricao = @descricao, diaEvento = @diaEvento, horarioModificao = getdate()
	where id = @id
end

create procedure sp_deletarEvento
	@id int
as
begin
	delete from Evento where id = @id
end
-----------------------------------------------******BOLTEIM******---------------------------------------------------
create procedure sp_listarBoletim
as
begin
	select * from Boletim
end

create procedure sp_inserirBoletim
	@id int,
	@descricao varchar(100),
	@usuario_id int
as
begin
	insert into Boletim(descricao,usuario_id) 
		values(@descricao,@usuario_id)
end
create procedure sp_editarBoletim
	@id int,
	@descricao varchar(100),
	@usuario_id int
as
begin
	if(dbo.validarEspacosVazios(@descricao) = 0)
	begin
		raiserror('Campo descrição vazio',16,1)
		return
	end
	insert into Boletim(descricao,usuario_id) 
		values(@descricao,@usuario_id)
end

create procedure sp_deletarBoletim
	@id uniqueidentifier
as
begin
	delete from Boletim where id = @id
end
---------------------------------------------------***DISCIPLINA***---------------------------------------------
create procedure sp_listarDisciplina
as
begin
	select * from Disciplina
end

create procedure sp_inserirDisciplina
	@id int,
	@descricao varchar(100),
	@duracao varchar(100),
	@media float,
	@usuario_id int,
	@boletim_id int
as
begin
	insert into Disciplina(descricao,duracao, media,usuario_id, boletim_id) 
		values(@descricao,@duracao, @media, @usuario_id, @boletim_id)
end
create procedure sp_editarDisciplina
	@id int,
	@descricao varchar(100),
	@duracao varchar (100),
	@media float,
	@usuario_id int,
	@boletim_id int
as
begin
	if(dbo.validarEspacosVazios(@descricao) = 0)
	begin
		raiserror('Campo descrição vazio',16,1)
		return
	end
	insert into Disciplina(descricao, duracao, media, usuario_id, boletim_id) 
		values(@descricao, @duracao, @media, @usuario_id, @boletim_id)
end

create procedure sp_deletarDisciplina
	@id uniqueidentifier
as
begin
	delete from Disciplina where id = @id
end
----------------------------------------------***NOTA***-------------------------------------------------
create procedure sp_listarNota
as
begin
	select * from Nota
end

create procedure sp_inserirNota
	@id int,
	@valor float,
	@peso int,
	@usuario_id int,
	@disciplina_id int,
	@periodo_id int
as
begin
	insert into Nota(valor,peso,usuario_id,disciplina_id, periodo_id) 
		values(@valor,@peso, @usuario_id, @disciplina_id, @periodo_id)
end
create procedure sp_editarNota
	@id int,
	@valor float,
	@peso int,
	@usuario_id int,
	@disciplina_id int,
	@periodo_id int
as
begin
	if(dbo.validarEspacosVazios(@descricao) = 0)
	begin
		raiserror('Campo descrição vazio',16,1)
		return
	end
	insert into Nota(valor, peso, usuario_id, disciplina_id, periodo_id) 
		values(@valor, @peso, @usuario_id, @disciplina_id, @periodo_id)
end

create procedure sp_deletarNota
	@id uniqueidentifier
as
begin
	delete from Nota where id = @id
end
------------------------------------------****PERIODO****-------------------------------------------------------

create procedure sp_listarPeriodo
as
begin
	select * from Periodo
end

create procedure sp_inserirPeriodo
	@id int,
	@descricao varchar(60),
	@usuario_id int
as
begin
	insert into Periodo(descricao,usuario_id) 
		values(@descricao, @usuario_id)
end
create procedure sp_editarPeriodo
	@id int,
	@descricao varchar(60),
	@usuario_id int
as
begin
	if(dbo.validarEspacosVazios(@descricao) = 0)
	begin
		raiserror('Campo descrição vazio',16,1)
		return
	end
	insert into Periodo(descricao, usuario_id) 
		values(@descricao, @usuario_id)
end

create procedure sp_deletarPeríodo
	@id uniqueidentifier
as
begin
	delete from Periodo where id = @id
end
------------------------------------****MENSAGEM****----------------------------------------------------------
create procedure sp_inserirMensagem
	@id int,
	@descricao varchar(100),
	@horarioDeEnvio datetime, 
	@usuario_id int,
	@sala_id int
as
begin
	insert into Mensagem(descricao, horarioDeEnvio, usuario_id, sala_id) 
		values(@descricao, @horarioDeEnvio, @usuario_id, @sala_id)
		if(dbo.validarEspacosVazios(@descricao) = 0)
	begin
		raiserror('Campo descrição vazio',16,1)
		return
	end
end
create procedure sp_editarMensagem
	@id int,
	@descricao varchar(100),
	@horarioDeEnvio datetime,
	@usuario_id int,
	@sala_id int
as
begin
	if(dbo.validarEspacosVazios(@descricao) = 0)
	begin
		raiserror('Campo descrição vazio',16,1)
		return
	end
	insert into Mensagem(descricao, horarioDeEnvio, usuario_id, sala_id) 
		values(@descricao, @horarioDeEnvio, @usuario_id, @sala_id)
end

create procedure sp_deletarMensagem
	@id uniqueidentifier
as
begin
	delete from Mensagem where id = @id
end
------------------------------------------------------SALA------------------------------------------------------
create procedure sp_listarSala
	@id int
as
begin
	select * from Sala where id = @id
end

create procedure sp_inserirSala
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

create procedure sp_editarSala
	@id int,
	@descricao varchar(60),
	@senha varchar(100)
as
begin
	if(dbo.validarEspacosVazios(@descricao) = 0)
	begin
		raiserror('Campo descrição vazio',16,1)
		return
	end
	update Sala
	set descricao = @descricao, senha = @senha 
	where id = @id
end

create procedure sp_deletarSala
	@id int
as
begin
	delete from Sala where id = @id
end


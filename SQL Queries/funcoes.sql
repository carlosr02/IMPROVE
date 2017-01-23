--Função para validar se o registro contém somente espaços vazios
create function validarEspacosVazios (@string varchar(1000))
returns bit
as
begin
	set @string = replace(@string,' ','')
	declare @validacao bit
	if(@string = '') set @validacao = 0
	else set @validacao = 1
	return @validacao
end

--Função para validar se a data é maior, menor ou igual que a data atual
create function validarData (@data date)
returns tinyint
as
begin
	declare @validacao tinyint
	if(@data > getdate()) set @validacao = 0
	else if(@data = getdate()) set @validacao = 1
	else set @validacao = 2
	return @validacao
end

--Função para validar formato do email
create function validarEmail (@email varchar(256))
returns bit
as
begin
	declare @validacao bit
	if(@email not like '%_@_%_.__%') set @validacao = 0
	else set @validacao = 1
	return @validacao
end

--Função para validar nota
create function validarNota (@valor float)
returns bit
as
begin
	declare @validacao bit
	if(@valor < 0) set @validacao = 0
	else set @validacao = 1
	return @validacao
end

--Função para validar peso
create function validarPeso (@peso int)
returns bit
as
begin
	declare @validacao bit
	if(@peso <= 0) set @validacao = 0
	else set @validacao = 1
	return @validacao
end

create function validarSenha (@senha varchar(128))
returns bit
as
begin
	declare @validacao bit
	if(@senha 
end
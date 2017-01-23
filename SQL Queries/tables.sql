-----------------------------------------------------Nome banco de dados: 2016TiiGrupo3--------------------------------------------------------
create table Usuario(
	id uniqueidentifier not null,
	usuario nvarchar(256) not null,
	email nvarchar(256) not null,
	senha nvarchar(128) not null,
	nome varchar(250),
	dataDeNascimento date,
	enderecoFoto varchar(500) default '~/Imagens/perfil/icon.png',
	primary key(id)
)

create table Tarefa(
	id int identity(1,1) not null,
	descricao varchar(140) not null,
	cumprida bit not null default 0,
	prioritaria bit not null,
	horarioEnvio datetime default getdate(),
	horarioModificao datetime default getdate(),
	usuario_id uniqueidentifier not null,
	primary key(id),
	foreign key(usuario_id) references Usuario(id)
)

create table Anotacao(
	id int identity(1,1) not null,
	titulo varchar(100),
	descricao varchar(200) not null,
	favorito bit not null,
	horarioEnvio datetime default getdate(),
	horarioModificao datetime default getdate(),
	usuario_id uniqueidentifier not null,
	primary key(id),
	foreign key(usuario_id) references Usuario(id)
)

create table Arquivo(
	id int identity(1,1) not null,
	descricao varchar(250) not null,
	extensao varchar(5) not null,
	endereco varchar(500) not null,
	tamanhoArquivo int not null,
	horarioEnvio datetime default getdate(),
	horarioModificao datetime default getdate(),
	usuario_id uniqueidentifier not null,
	primary key(id),
	foreign key(usuario_id) references Usuario(id)
)

create table Evento(
	id int identity(1,1) not null,
	titulo varchar(100) not null,
	descricao varchar(200),
	diaEvento date,
	horarioCadastro datetime default getdate(),
	horarioModificao datetime default getdate(),
	usuario_id uniqueidentifier not null,
	primary key(id),
	foreign key(usuario_id) references Usuario(id)
)

create table Sala(
	id int identity(1,1) not null,
	descricao varchar(60) not null,
	senha varchar(100) not null,
	primary key(id)
)

create table UsuariosSala(
	usuario_id uniqueidentifier not null,
	sala_id int not null,
	primary key(usuario_id, sala_id)
)

create table Mensagem(
	id int identity(1,1) not null,
	descricao varchar(3000) not null,
	horarioEnvio datetime default getdate(),
	horarioModificao datetime default getdate(),
	usuario_id uniqueidentifier not null,
	sala_id int not null,
	primary key(id),
	foreign key(usuario_id) references Usuario(id),
	foreign key(sala_id) references Sala(id)
)

create table Boletim(
	id int identity(1,1) not null,
	descricao varchar(100) not null,
	usuario_id uniqueidentifier not null,
	primary key(id),
	foreign key(usuario_id) references Usuario(id)
)

create table Disciplina(
	id int identity(1,1) not null,
	descricao varchar(100) not null,
	media float,
	periodo_id int not null,
	boletim_id int not null,
	primary key(id),
	foreign key(periodo_id) references Periodo(id),
	foreign key(boletim_id) references Boletim(id)
)
	
create table Periodo(
	id int identity(1,1) not null,
	descricao varchar(100) not null,
	primary key(id)
)

create table Nota(
	id int identity(1,1) not null,
	valor float not null,
	peso int not null,
	disciplina_id int not null,
	primary key(id),
	foreign key(disciplina_id) references Disciplina(id)
)
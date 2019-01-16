use master 
drop database SGTSistemaGerenciadorTarefas
create database SGTSistemaGerenciadorTarefas
use SGTSistemaGerenciadorTarefas

create table TB_Tarefa(
	ID_tarefa int primary key identity(1,1),
	DS_titulo nvarchar(200) not null,
	PRZestimado date not null,
	DS_tarefa nvarchar(200) not null,
	DTinicio date not null,
	DTtermino date not null
)

create table TB_Pessoa(
	ID_pessoa int primary key identity(1,1),
	nome nvarchar(200) not null,
	email nvarchar(200),
	sexo nvarchar(20),
)
create table TB_Tar_Pes(
	ID_Relacao int primary key,
	ID_tarefa int,
	ID_pessoa int
)
create table TB_Metodologia(
	ID_tarefa int,
	DS_descricao nvarchar(200)not null,
)
	alter table TB_Metodologia
	add constraint FK_ID_tarefa
	foreign key(ID_tarefa)
	references TB_tarefa(ID_tarefa)

	alter table TB_Tar_Pes
	add constraint GK_ID_tarefa
	foreign key(ID_tarefa)
	references TB_tarefa(ID_tarefa)
	
	alter table TB_Tar_pes
	add constraint FK_ID_pessoa
	foreign key(ID_pessoa)
	references TB_Pessoa(ID_pessoa)

insert into TB_Pessoa(nome,email,sexo)
values('MAtheus Durães','duraes96matheus@gmail.com','M')

insert into TB_Pessoa(nome,email,sexo)
values('Eduardo Renan Nascimento','eduardorenato@gmail.com','M')

insert into TB_Pessoa(nome,email,sexo)
values('Rafaele Pereira','rafap@gmail.com','F')

insert into TB_Pessoa(nome,email,sexo)
values('Carla sarah','casah@gmail.com','F')

insert into TB_Pessoa(nome, email,sexo)
values('Italo Preguica','Preguicosopreguicoso','F')

insert into TB_Pessoa(nome,email,sexo)
values('Carol','Carlinha@gmail.com','F')

insert into TB_Pessoa(nome,email,sexo)
values('Joao','joaooooooo','M')

insert into TB_Pessoa(nome,email,sexo)
values('Carlos','Carlao','M')


/*select * from TB_Pessoa*/ 

insert into TB_Tarefa(DS_titulo,PRZestimado,DS_tarefa,DTinicio,DTtermino)
values('Atualizar blog e Paginas sociais','2018-11-11','Atualizar as paginas sociais da empresa com o intuito de ganhar novos seguidores','2018-08-13','2018-11-11')

insert into TB_Tarefa(DS_titulo,PRZestimado,DS_tarefa,DTinicio,DTtermino)
values('Criar um canal no Youtube e conseguir 1000 inscritos','2018-11-11','com o intuito de ganhar novos seguidores','2018-08-13','2018-11-11')

insert into TB_Tarefa(DS_titulo,PRZestimado,DS_tarefa,DTinicio,DTtermino)
values('Desenvolver um novo logo','2018-04-20','Criar um novo logo','2018-03-20','2018-05-20')


/*select * from TB_Tarefa*/

insert into TB_Metodologia(ID_tarefa,DS_descricao)
values('01','Com o intuito de ganhar novos seguidores a empresa devera se divulgar nas midias socias')

insert into TB_Metodologia(ID_tarefa,DS_descricao)
values('02','Repensar')

insert into TB_Metodologia(ID_tarefa,DS_descricao)
values('03','Desenvolver')


/*select * from TB_Metodologia*/

insert into TB_Tar_Pes(ID_Relacao,ID_pessoa,ID_tarefa)
values('01','01','02')


insert into TB_Tar_Pes(ID_Relacao, ID_pessoa,ID_tarefa)
values('02','02','02')

insert into TB_Tar_Pes(ID_Relacao,ID_pessoa,ID_tarefa)
values('03','03','01')

insert into TB_Tar_Pes(ID_Relacao,ID_pessoa,ID_tarefa)
values('04','04','01')

insert into TB_Tar_Pes(ID_Relacao,ID_pessoa,ID_tarefa)
values('07','07','01')

insert into TB_Tar_Pes(ID_Relacao,ID_pessoa,ID_tarefa)
values('08','08','03')


/*select * from TB_Tar_Pes*/

select * from TB_Pessoa P
where NOT EXISTS (select * from TB_Tar_Pes T where p.ID_pessoa = T.ID_Relacao) 

select COUNT(ID_tarefa) as 'Metodologia mais', ID_tarefa as 'Metodologia'
from TB_Tar_Pes group by ID_tarefa order by COUNT(ID_tarefa)desc



select * from TB_Pessoa as P
inner join TB_Tar_Pes as t 
on(p.ID_pessoa= ID_Relacao)
where sexo like '%f%'

select p.nome as 'Nome', t.PRZestimado as 'Prazo estimado', t.DTtermino as 'Termino'
from TB_Pessoa as p
join TB_Tar_Pes as r
on p.ID_pessoa = r.ID_Relacao
join TB_Tarefa as t
on r.id_tarefa = t.ID_tarefa where t.DTtermino > t.PRZestimado
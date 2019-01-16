use master
drop database aula2409
create database aula2409
use aula2409

create table Pessoas(
	id_Pessoa int primary key identity(1,1),
	ds_nome nvarchar (150) not null
)
create table departamento(
	id_dp int primary key identity(1,1),
	ds_departamento nvarchar(150) not null
)
create table relacao(
	id_relacao int primary key identity(1,1),
	id_dp int,
	id_Pessoa int
)
alter table relacao
add constraint fk_id_Pessoa
foreign key (id_Pessoa)
references Pessoas(id_Pessoa)

alter table relacao
add constraint fk_id_dp
foreign key (id_dp)
references departamento(id_dp)

insert into Pessoas(ds_nome)
values('Matheus Durães da Silva')

insert into departamento(ds_departamento)
values('TI-Tecnologia da Informacao')

insert into relacao(id_dp,id_Pessoa)
values(01,01)

select ds_nome,ds_departamento,id_relacao from Pessoas,relacao,departamento where 1=1

BEGIN TRANSACTION;              /* inicio da transação*/
       INSERT INTO Pessoas(ds_nome) VALUES('carlos');  /*Parametros */
       INSERT INTO departamento VALUES('SD-Segurança Digital');  
	   insert into relacao (id_Pessoa,id_dp) values(02,02);
	   select * from relacao
COMMIT;
use master
drop database banco21112018
create database banco21112018
use banco21112018

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


BEGIN TRANSACTION;              /* inicio da transação*/
       INSERT INTO Pessoas(ds_nome) VALUES('carlos');  /*Parametros */
       INSERT INTO departamento VALUES('SD-Segurança Digital');  
	   insert into relacao (id_Pessoa,id_dp) values(02,02);
COMMIT;
select ds_nome,ds_departamento from Pessoas,departamento where id_Pessoa=id_dp

CREATE TRIGGER tgLog
ON Pessas
after IF (EXISTS (SELECT * 
                 FROM INFORMATION_SCHEMA.TABLES 
                 WHERE TABLE_SCHEMA = 'TheSchema' 
                 AND  TABLE_NAME = 'TheTable'))
AS
 INSERT INTO meuLog
	SELECT a, b FROM INSERTED
 
GO
	 insert into teste (a, b, c, d) 
	 values (100, 'meu nome', 'sobrenome', 1250)
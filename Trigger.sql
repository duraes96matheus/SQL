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
       INSERT INTO departamento(ds_departamento) VALUES('SD-Segurança Digital');  
	   insert into relacao (id_Pessoa,id_dp) values(02,02);
COMMIT;
select ds_nome,ds_departamento from Pessoas,departamento where id_Pessoa=id_dp


if OBJECT_ID ('validacao_pessoa_insert') is not null /*crio uma validacao se a trigger foi nula eu dropo ela*/
drop TRIGGER validacao_pessoa_insert
go

create trigger validacao_pessoa_insert on departamento for insert as 
declare @IdDpto int;
begin
	declare @IdPessoa int;
	select @IdPessoa = max(id_Pessoa) from Pessoas;
	/*print @IdPessoa*/
	
	IF NOT EXISTS(select id_Pessoa from relacao where id_Pessoa = @IdPessoa)
	begin
		declare @NmDpto nvarchar(180);
		declare @auditAction nvarchar(180);
		
		select @IdDpto = i.id_dp from inserted i;
		
		set @auditAction = 'Registro inserido';		
		print @auditAction
		insert into relacao (id_dp, id_Pessoa)
		values (@IdDpto, @IdPessoa);
	end;
	ELSE
	begin
		rollback;
		set @auditAction = 'Registro não inserido';
		print @auditAction
	end;
end
go
insert into Pessoas(ds_nome)values('Vinicius Alves')
insert into departamento(ds_departamento)values('Contabilidade')
insert into relacao(id_Pessoa,id_dp)values(03,02)


select * from departamento 
select * from departamento 
select * from relacao

insert into Pessoas(ds_nome)values('carlos')
insert into departamento(ds_departamento)values('1ogistica')
insert into relacao(id_Pessoa,id_dp)values(03,04)
use master 
drop database aula07032018
create database aula07032018
use aula07032018

create table tb_clientes(
id_cliente int primary key identity(1,1),
nome nvarchar(100),
endereco nvarchar(500),
fone nvarchar(20),
email nvarchar(200)
)

create table tb_hardware(
id_hardware int primary key identity(1,1),
descricao nvarchar(1000),
preco float,
qtde int,
qtde_mini int
)

create table tb_vendas(
id_venda int primary key identity(1,1),
id_cliente int,
data date,
valor_total float,
desconto float,
valor_pago float,
)

create table tb_vendas_itens(
id_item int primary key identity(1,1),
id_venda int,
id_hardware int,
qtde_item int,
total_itens int
)
alter table tb_vendas						/*Alterar tabela selecionada*/
add constraint fk_id_cliente				/*add chave estrangeira*/
foreign key  (id_cliente)					/*informa daonde devem puxar a informa��o*/
references tb_clientes(id_cliente)			/*referencia a tabela */

alter table tb_vendas_itens						/*Alterar tabela selecionada*/
add constraint fk_id_venda				/*add chave estrangeira*/
foreign key  (id_venda)					/*informa daonde devem puxar a informa��o*/
references tb_vendas(id_venda)			/*referencia a tabela */

alter table tb_vendas_itens						/*Alterar tabela selecionada*/
add constraint fk_id_hardware					/*add chave estrangeira*/
foreign key  (id_hardware)						/*informa daonde devem puxar a informa��o*/
references tb_hardware(id_hardware)				/*referencia a tabela */

insert into tb_clientes(nome, endereco, fone, email)
values('Vanessa','Av nagua, 1028','60454560','vanessadesdsa@gmail.com')
insert into tb_clientes(nome, endereco, fone, email)
values('Eduardo','Av Da macon ,4528','456004560','edduarsdio@gmail.com')
insert into tb_clientes(nome, endereco, fone, email)
values('Matheus','Rua Catl�ias, 1028','20054560','duraes96matheus@gmail.com')
insert into tb_clientes(nome, endereco, fone, email)
values('Clayton','Marcondes 428','4564564560','claytonsdsa@gmail.com')
insert into tb_clientes(nome, endereco, fone, email)
values('Kelly','Av Agua, 1028','80454560','Kellydesdsa@gmail.com')
insert into tb_clientes(nome, endereco, fone, email)
values('Eduardo','Rua Assist�ncia,4528','450904560','eduardosdsadas@gmail.com')



insert into tb_hardware(descricao,preco,qtde,qtde_mini)
values('Placa M�e: A placa-m�e � o principal componente de um computador, pois ela � respons�vel por interligar todos os outros componentes internos do computador, por meio de slots de expans�o','180.00','5','2')
insert into tb_hardware(descricao,preco,qtde,qtde_mini)
values('Processador: O processador, ou CPU, como � conhecido por alguns, � o principal componente de processamento, ele � respons�vel por atender a todas as solicita��es efetuadas pelo sistema operacional ou pelo usu�rio. A velocidade do processador, medida em Mhz (mega-hertz), ou Ghz (giga-hertz) define a capacidade de processamento do mesmo.','150.00','8','4')
insert into tb_hardware(descricao,preco,qtde,qtde_mini)
values('Coller: S�o pequenos ventiladores respons�veis pela refrigera��o dos componentes do computador. Eles s�o fundamentais, tendo em vista que sem eles os componentes podem super-aquecer e queimar.','25.00','8','4')
insert into tb_hardware(descricao,preco,qtde,qtde_mini)
values('Fonte: Respons�vel por alimentar todo o sistema, como placa-m�e, processador, mem�ria, dispositivos instalados em slots de expans�o (AGP, PCI, PCI-X), drives �pticos (CD, DVD , BlueRay e etc).','125.00','8','4')
insert into tb_hardware(descricao,preco,qtde,qtde_mini)
values('Mem�ria Ram A mem�ria ram � conhecida como mem�ria de armazenamento vol�til, pois mantem dados quando energizada (ligada), mas os perde quando deixa de ser energizada (desligada). Ela tem a fun��o de armazenar dados utilizados durante a opera��o do sistema operacional e de algum software espec�fico.','200.00','8','4')


insert into tb_vendas(id_cliente,data,valor_total,desconto,valor_pago)
values('1','2018/03/20','1.200','70.00','1.130')
insert into tb_vendas(id_cliente,data,valor_total,desconto,valor_pago)
values('2','2018/03/20','1.900','70.00','1.830')
insert into tb_vendas(id_cliente,data,valor_total,desconto,valor_pago)
values('3','2018/03/20','4.200','70.00','4.130')
insert into tb_vendas(id_cliente,data,valor_total,desconto,valor_pago)
values('4','2018/03/20','8.200','70.00','8.130')
insert into tb_vendas(id_cliente,data,valor_total,desconto,valor_pago)
values('5','2018/03/20','10.200','70.00','10.130')
insert into tb_vendas(id_cliente,data,valor_total,desconto,valor_pago)
values('6','2018/03/20','45.200','70.00','45.130')

select *from tb_clientes
select *from tb_hardware
select *from tb_vendas


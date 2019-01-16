use master
drop table TabelaA;
drop table TabelaB;

CREATE TABLE TabelaA(
Nome varchar(50) NULL)
INSERT INTO TabelaA (Nome) VALUES('Fernanda')
INSERT INTO TabelaA (Nome) VALUES('Josefa')
INSERT INTO TabelaA (Nome) VALUES('Luiz')
INSERT INTO TabelaA (Nome) VALUES('Fernando')

CREATE TABLE TabelaB(
Nome varchar(50) NULL)
INSERT INTO TabelaB (Nome) VALUES('Carlos')
INSERT INTO TabelaB (Nome) VALUES('Manoel')
INSERT INTO TabelaB (Nome) VALUES('Luiz')
INSERT INTO TabelaB (Nome) VALUES('Fernando')

select * from TabelaA
select * from TabelaB

SELECT a.Nome, b.Nome
FROM TabelaA as A
INNER JOIN TabelaB as B
on a.Nome = b.Nome

SELECT a.Nome, b.Nome
fROM TabelaA as A
LEFT JOIN TabelaB as B
on a.Nome = b.Nome
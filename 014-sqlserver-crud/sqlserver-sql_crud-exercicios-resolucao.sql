-- exercicios - sql_views


-- MÓDULO 14: EXERCÍCIOS

/*
1. a) Crie um banco de dados chamado BD_Teste.

b) Exclua o banco de dados criado no item anterior.

c) Crie um banco de dados chamado Exercicios.
*/

-- a)

create database BD_Teste;

-- b)

drop database BD_Teste;

-- c)

create database Exercicios;




/*
2. No banco de dados criado no exercício anterior, crie 3 tabelas, cada uma contendo as seguintes
colunas:

Tabela 1: dCliente
- ID_Cliente
- Nome_Cliente
- Data_de _Nascimento

Tabela 2: dGerente
- ID_Gerente
- Nome_Gerente
- Data_de_Contratacao
- Salario

Tabela 3: fContratos
- ID_Contrato
- Data_de_Assinatura
- ID_Cliente
- ID_Gerente
- Valor_do_Contrato

Lembre-se dos seguintes pontos:
a) Garantir que o Banco de Dados Exercicios está selecionado.

b) Definir qual será o tipo de dados mais adequado para cada coluna das tabelas. Lembrando que
os tipos de dados mais comuns são: INT, FLOAT, VARCHAR e DATETIME.

Por fim, faça um SELECT para visualizar cada tabela
*/

use Exercicios;

create table dCliente(
	ID_Cliente int,
	Nome_Cliente varchar(200),
	Data_de_Nascimento date
);

create table dGerente(
	ID_Gerente int,
	Nome_Gerente varchar(200),
	Data_de_Contratacao date,
	Salario float
);

create table fContratos(
	ID_Contrato int,
	Data_de_Assinatura date,
	ID_Cliente int,
	ID_Gerente int,
	Valor_do_Contrato float
	);

select * from dCliente;

select * from dGerente;

select * from fContratos;




/*
3. Em cada uma das 3 tabelas, adicione os seguintes valores:

TABELA dCliente
TABELA dGerente
TABELA fContratos
*/

insert into dCliente (ID_Cliente,Nome_Cliente,Data_de_Nascimento)
values
	(1,'André Martins','12/02/1989'),
	(2,'Bárbara Campos','07/05/1992'),
	(3,'Carol Freitas','23/04/1985'),
	(4,'Diego Cardoso','11/10/1994'),
	(5,'Eduardo Pereira','09/11/1988'),
	(6,'Fabiana Silva','02/09/1989'),
	(7,'Gustavo Barbosa','27/06/1993'),
	(8,'Helen Viana','11/02/1990');

select * from dCliente;


insert into dGerente (ID_Gerente,Nome_Gerente,Data_de_Contratacao,Salario)
values
	(1,'Lucas Sampaio','21/03/2015',6700),
	(2,'Mariana Padilha','10/01/2011',9900),
	(3,'Nathália Santos','03/10/2018',7200),
	(4,'Otávio Costa','18/04/2017',11000);

select * from dGerente;


insert into fContratos (ID_Contrato,Data_de_Assinatura,ID_Cliente,ID_Gerente,Valor_do_Contrato)
values
	(1,'12/01/2019',8,1,23000),
	(2,'10/02/2019',3,2,15500),
	(3,'07/03/2019',7,2,6500),
	(4,'15/03/2019',1,3,33000),
	(5,'21/03/2019',5,4,11100),
	(6,'23/03/2019',4,2,5500),
	(7,'28/03/2019',9,3,55000),
	(8,'04/04/2019',2,1,31000),
	(9,'05/04/2019',10,4,3400),
	(10,'05/04/2019',6,2,9200);

select * from fContratos;




/*
4. Novos dados deverão ser adicionados nas tabelas dCliente, dGerente e fContratos. Fique livre
para adicionar uma nova linha em cada tabela contendo, respectivamente,

(1) um novo cliente (id cliente, nome e data de nascimento)
(2) um novo gerente (id gerente, nome, data de contratação e salário)
(3) um novo contrato (id, data assinatura, id cliente, id gerente, valor do contrato)
*/

insert into dCliente (ID_Cliente,Nome_Cliente,Data_de_Nascimento)
values (9,'Jorge Harbes','21/06/1983');

insert into dGerente (ID_Gerente,Nome_Gerente,Data_de_Contratacao,Salario)
values (5,'Ragnar Lothbrok','07/08/2006',25000);

insert into fContratos (ID_Contrato,Data_de_Assinatura,ID_Cliente,ID_Gerente,Valor_do_Contrato)
values (11,'10/12/2023',9,5,1000000);

select * from fContratos;
select * from dCliente;
select * from dGerente;




/*
5. O contrato de ID igual a 4 foi registrado com alguns erros na tabela fContratos. Faça uma
alteração na tabela atualizando os seguintes valores:

Data_de_Assinatura: 17/03/2019
ID_Gerente: 2
Valor_do_Contrato: 33500
*/

update fContratos set
	Data_de_Assinatura='17/03/2019',
	ID_Gerente=2,
	Valor_do_Contrato=33500
where
	ID_Contrato=4;

select * from fContratos;
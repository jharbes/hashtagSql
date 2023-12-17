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


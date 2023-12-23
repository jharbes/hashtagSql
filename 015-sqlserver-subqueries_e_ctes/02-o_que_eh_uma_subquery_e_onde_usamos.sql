-- [SQL Server] [Subqueries e CTE's] Aula 2 de 28: O que � uma Subquery e onde usamos

/* 
1. O que � uma Subquery?

Uma Subconsulta (ou Subquery ou SubSELECT) nada mais � do que uma consulta dentro de outra consulta. Ou seja, com uma subquery conseguimos utilizar o resultado de uma query (consulta) dentro de outra consulta.

2. Onde utilizamos uma Subquery
Subqueries podem ser utilizadas em 3 situa��es poss�veis:
Junto com o Where, funcionando como um filtro vari�vel
Junto com o SELECT, como uma nova coluna na tabela
Junto com o FROM, como uma nova tabela


Ex:

Imagina que eu quero selecionar os produtos com o Pre�o maior do que a m�dia.

SELECT
	*
FROM
	Produtos
WHERE Pre�o > 10.5


SELECT AVG(Pre�o) FROM Produtos



3. Onde usamos uma subquery?

Em 4 situa��es poss�veis:

1- Subquery junto com um WHERE, como um filtro din�mico e escalar (valor �nico)

SELECT
	Coluna1,
	Coluna2
FROM
	Tabela
WHERE Coluna1 = (SELECT)

2- Subquery junto com um WHERE, como um filtro din�mico e em lista (v�rios valores)

SELECT
	Coluna1,
	Coluna2
FROM
	Tabela
WHERE Coluna1 IN (SELECT)


3- Subquery junto com um SELECT, como uma nova coluna

SELECT
	Coluna1,
	Coluna2,
	(SELECT)
FROM
	Tabela
	

4- Subquery junto com um FROM, como uma nova tabela

SELECT
	Coluna1,
	Coluna2
FROM
	(SELECT) AS T
*/
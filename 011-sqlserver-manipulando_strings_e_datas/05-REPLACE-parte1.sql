-- [SQL Server] Manipulando Strings e Datas no SQL
-- Aula 5 e 6 de 23: REPLACE (Parte 1 e 2)

-- REPLACE ---> Substitui um determinado texto por outro texto

select 'O Excel � o melhor'; -- O Excel � o melhor

select REPLACE('O Excel � o melhor', 'Excel', 'SQL'); -- O SQL � o melhor


-- Exemplo: Crie uma consulta a partir de DimCustomer onde voc� retorna o Nome Completo dos Clientes, a coluna de Sexo (Abrev) e uma outra coluna de Sexo substituindo M por Masculino e F por Feminino

SELECT * FROM DimCustomer;

SELECT
	CONCAT(FirstName, ' ', LastName) AS 'Nome Completo',
	Gender AS 'Sexo (Abrev)',
	REPLACE(Gender, 'M', 'Masculino') AS 'Sexo (Extenso)'
FROM
	DimCustomer;



SELECT
	CONCAT(FirstName, ' ', LastName) AS 'Nome Completo',
	Gender AS 'Sexo (Abrev)',
	REPLACE(REPLACE(Gender, 'M', 'Masculino'), 'F', 'Feminino') AS 'Sexo (Extenso)'
FROM
	DimCustomer;

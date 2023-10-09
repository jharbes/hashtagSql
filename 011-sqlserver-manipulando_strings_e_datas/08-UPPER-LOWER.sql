-- [SQL Server] Manipulando Strings e Datas no SQL
-- Aula 8 de 23: UPPER e LOWER

-- UPPER ---> Transforma um texto em mai�scula
-- LOWER ---> Transforma um texto em min�scula
-- Exemplo: Fa�a uma consulta � tabela DimCustomer e utilize as fun��es UPPER e LOWER na coluna de FirstName para observar o resultado

SELECT * FROM DimCustomer
SELECT
	UPPER(FirstName) AS 'NOME',
	LOWER(FirstName) AS 'nome',
	EmailAddress AS 'E-mail'
FROM
	DimCustomer

-- [SQL Server] Manipulando Strings e Datas no SQL
-- Aula 3 de 23: CONCAT

-- CONCAT ---> Permite juntar mais de um texto em uma �nica palavra
-- Exemplo: Fa�a uma consulta � tabela DimCustomer onde seja poss�vel visualizar o nome completo de cada cliente.

SELECT
	FirstName AS 'Nome',
	LastName AS 'Sobrenome',
	EmailAddress AS 'E-mail',
	CONCAT(FirstName, ' ', LastName) AS 'Nome Completo'
FROM
	DimCustomer

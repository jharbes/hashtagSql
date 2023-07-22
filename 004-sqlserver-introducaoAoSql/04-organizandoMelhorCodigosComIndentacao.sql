-- [SQL Server] Introdu��o ao SQL
-- Aula 4 de 15: Como organizar melhor os c�digos com indenta��o

-- Para organizar melhor os seus c�digos, pule linhas. Abaixo temos dois exemplos de c�digos que chegam no mesmo resultado, s� que na vers�o 1, n�o utilizamos a indenta��o, e na vers�o 2, usamos. Observe que fica muito mais organizado.

-- Selecionando todas as linhas e colunas da tabela DimStore
-- vers�o 1
SELECT * FROM DimStore

-- vers�o 2
SELECT 
	* 
FROM 
	DimStore

-- Selecionando todas as linhas da tabela DimCustomer, especificamente as colunas StoreKey, StoreName, StorePhone
-- vers�o 1
SELECT StoreKey, StoreName, StorePhone FROM DimStore

-- vers�o 2
SELECT 
	StoreKey, 
	StoreName, 
	StorePhone 
FROM 
	DimStore


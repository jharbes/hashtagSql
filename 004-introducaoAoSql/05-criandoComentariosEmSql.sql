-- [SQL Server] Introdu��o ao SQL
-- Aula 5 de 15: Criando coment�rios em SQL

-- Coment�rios em c�digos t�m 3 grandes finalidades:

-- 1. Criar uma frase que explica o funcionamento de um determinado c�digo
-- Este c�digo seleciona as colunas de ID do produto e nome do produto da tabela de produto
SELECT
	ProductKey,
	ProductName
FROM
	DimProduct

-- 2. Comentar apenas parte de um c�digo (para n�o apagar) e executar o restante
SELECT
	-- StoreKey,
	StoreName,
	StorePhone
FROM
	DimStore

-- 3. Comentar todo o trecho de um c�digo utilizando o /* ... */
/*
SELECT
	StoreKey,
	StoreName,
	StorePhone
FROM
	DimStore
*/

SELECT * FROM DimProduct
-- [SQL Server] Introdu��o ao SQL
-- Aula 3 de 15: Salvando a primeira consulta e resolvendo 2 problemas


-- 1. Antes de executar os c�digos, garanta que o banco de dados correto est� selecionado no canto superior esquerdo: banco de dados ContosoRetailDW

-- 2. Sempre que executar um c�digo, selecione todo ele para n�o ter problemas

-- Selecionando todas as linhas e colunas da tabela DimCustomer
SELECT * FROM DimCustomer

-- Selecionando todas as linhas e colunas da tabela DimStore
SELECT * FROM DimStore

-- Selecionando todas as linhas da tabela DimCustomer, especificamente as colunas StoreKey, StoreName, StorePhone
SELECT StoreKey, StoreName, StorePhone FROM DimStore

-- Selecionando todas as linhas e colunas da tabela DimProduct
SELECT * FROM DimProduct

-- Selecionando todas as linhasda tabela DimProduct, especificamente as colunas ProductName, BrandName
SELECT ProductName, BrandName FROM DimProduct
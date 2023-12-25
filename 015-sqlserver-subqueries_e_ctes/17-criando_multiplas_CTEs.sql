-- [SQL Server] [Subqueries e CTE's] Aula 17 de 28: Criando m�ltiplas CTE's

-- Exemplo: Crie 2 CTE's:
-- 1. A primeira, cjamada produtos_contoso, deve conter as seguintes colunas (DimProduct): ProductKey, ProductName, BrandName
-- 2. A segunda, chamada vendas_top100, deve ser um top 100 vendas mais recentes, considerando as seguintes colunas da tabela FactSales: SalesKey, ProductKey, DateKey, SalesQuantity

-- Por fim, fa�a um INNER JOIN dessas tabelas

WITH produtos_contoso AS (
	SELECT
		ProductKey,
		ProductName,
		BrandName
	FROM
		DimProduct
	WHERE
		BrandName = 'Contoso'
),
vendas_top100 AS (
	SELECT TOP(100)
		SalesKey,
		ProductKey,
		DateKey,
		SalesQuantity
	FROM
		FactSales
	ORDER BY
		DateKey DESC
)

SELECT * FROM vendas_top100
INNER JOIN produtos_contoso
	ON vendas_top100.ProductKey = produtos_contoso.ProductKey

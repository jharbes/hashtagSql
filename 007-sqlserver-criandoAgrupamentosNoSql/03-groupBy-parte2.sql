-- [SQL Server] Criando agrupamentos no SQL
-- Aula 3 de 18: Group By (Parte 2)


-- Consulta 1
SELECT * FROM DimStore

SELECT
	StoreType,
	SUM(EmployeeCount) AS 'Qtd. Total Funcion�rios'
FROM
	DimStore
GROUP BY StoreType

-- Consulta 2
SELECT * FROM DimProduct

SELECT
	BrandName,
	AVG(UnitCost) AS 'Custo M�dio'
FROM
	DimProduct
GROUP BY BrandName


-- Consulta 3
SELECT * FROM DimProduct

SELECT
	ClassName AS 'Classe do Produto',
	MAX(UnitPrice) AS 'M�ximo Pre�o'
FROM
	DimProduct
GROUP BY ClassName

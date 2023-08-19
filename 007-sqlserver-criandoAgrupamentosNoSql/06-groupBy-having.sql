-- [SQL Server] Criando agrupamentos no SQL
-- Aula 6 de 18: Group By + Having

--SELECT * FROM DimProduct

SELECT
	BrandName AS 'Marca',
	COUNT(BrandName) AS 'Total Marca'
FROM
	DimProduct
GROUP BY BrandName

HAVING COUNT(BrandName) >= 200


-- IMPORTANTE**: nao � possivel utilizar o comando where para fazer esse tipo
-- de filtro, pois o comando WHERE so funciona ANTES do group by, ap�s o group by
-- s� funcionara o HAVING


SELECT
	BrandName AS 'Marca',
	COUNT(BrandName) AS 'Total Marca'
FROM
	DimProduct
GROUP BY
	BrandName
HAVING
	COUNT(BrandName) >= 200
ORDER BY
	'Total Marca' desc;
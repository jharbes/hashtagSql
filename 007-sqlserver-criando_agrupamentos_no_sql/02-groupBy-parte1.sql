-- [SQL Server] Criando agrupamentos no SQL
-- Aula 2 de 18: Group By (Parte 1)

SELECT * FROM DimProduct


-- utilizamos o group by para que assim possamos ter a resposta do count
-- de acordo com as marcas existentes, ou seja, o numero de produtos de
-- cada marca
SELECT
	BrandName AS 'Nome da Marca',
	COUNT(*) AS 'Qtd Total'
FROM
	DimProduct
GROUP BY BrandName



SELECT
	BrandName AS 'Nome da Marca',
	COUNT(*) AS 'Qtd Total'
FROM
	DimProduct
GROUP BY BrandName
order by 'Nome da Marca' desc



SELECT
	BrandName AS 'Nome da Marca',
	COUNT(*) AS 'Qtd Total'
FROM
	DimProduct
GROUP BY BrandName
order by 'Qtd Total'
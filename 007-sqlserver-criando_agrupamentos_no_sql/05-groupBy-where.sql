-- [SQL Server] Criando agrupamentos no SQL
-- Aula 5 de 18: Group By + Where


SELECT * FROM DimProduct


-- aqui listaremos as cores e suas quantidades, mas apenas para os
-- produtos da marca contoso
SELECT
	ColorName AS 'Cor do Produto',
	COUNT(ColorName) AS 'Qtd. Total'
FROM
	DimProduct
WHERE BrandName = 'Contoso'
GROUP BY ColorName



-- idem ao anterior porem colocaremos no nome da marca contoso
-- no select para reforcar que todos pertencem a essa marca
SELECT
	BrandName,
	ColorName AS 'Cor do Produto',
	COUNT(ColorName) AS 'Qtd. Total'
FROM
	DimProduct
WHERE BrandName = 'Contoso'
GROUP BY ColorName, BrandName



-- agora agruparemos da mesma maneira, porem para todas as marcas
-- ou seja, ele dira quantas cores ha para cada uma das marcas
-- ordenaremos por marca para melhor visualizacao
SELECT
	BrandName,
	ColorName AS 'Cor do Produto',
	COUNT(ColorName) AS 'Qtd. Total'
FROM
	DimProduct
GROUP BY ColorName, BrandName
ORDER BY BrandName

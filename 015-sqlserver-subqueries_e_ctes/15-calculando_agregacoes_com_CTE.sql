-- [SQL Server] [Subqueries e CTE's] Aula 15 de 28: Calculando agrega��es com CTE

-- Exemplo: Crie uma CTE que seja o resultado do agrupamento de total de produtos por marca. Fa�a uma m�dia de produtos por marca.


-- *** CTE pode ser importante para trazer resultados INDIVIDUAIS como abaixo, o que poderia ser dificultado
-- sem ela

WITH cte AS (
	SELECT
		BrandName,
		COUNT(*) AS 'Total'
	FROM
		DimProduct
	GROUP BY
		BrandName
)


SELECT
	AVG(Total)
FROM
	cte;

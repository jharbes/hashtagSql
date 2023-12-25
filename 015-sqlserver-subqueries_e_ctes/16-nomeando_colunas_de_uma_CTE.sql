-- [SQL Server] [Subqueries e CTE's] Aula 16 de 28: Nomeando colunas de uma CTE

-- Exemplo: Crie uma CTE que seja o resultado do agrupamento de total de produtos por marca. Fa�a uma m�dia de produtos por marca.

WITH cte(Marca, Total) AS (
	SELECT
		BrandName,
		COUNT(*)
	FROM
		DimProduct
	GROUP BY
		BrandName
)


-- select avg(total) from cte;

SELECT
	Marca,
	Total
FROM
	cte;

-- [SQL Server] [Subqueries e CTE's] Aula 3 de 28: Subquery na pr�tica - Aplica��o com o Where (Exemplo 1)

-- Para entender a ideia por tr�s das subqueries, vamos come�ar fazendo 3 exemplos com a aplica��o WHERE.

-- Exemplo 1: Quais produtos da tabela DimProduct possuem custos acima da m�dia?

SELECT AVG(UnitCost) FROM DimProduct     -- 147.6555

SELECT
	*
FROM
	DimProduct
WHERE UnitCost >= (SELECT AVG(UnitCost) FROM DimProduct)
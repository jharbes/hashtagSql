-- [SQL Server] [Subqueries e CTE's] Aula 5 de 28: Subquery na pr�tica - Aplica��o com o Where (Exemplo 3)

-- Para entender a ideia por tr�s das subqueries, vamos come�ar fazendo 3 exemplos com a aplica��o WHERE.

-- Exemplo 3: Filtre a tabela FactSales e mostre apenas as vendas referentes �s lojas com 100 ou mais funcion�rios

-- nesse caso utilizaremos todos os resultados da coluna �NICA resultado da subquery (mais de um resultado)
-- por isso o IN nos d� suporte para mais de um resultado
-- caso so houvesse um resultado o normal seria usar o igual (=)
SELECT * FROM FactSales
WHERE StoreKey IN (
	SELECT	StoreKey
	FROM DimStore
	WHERE EmployeeCount >= 100
);

-- [SQL Server] [Subqueries e CTE's] Aula 10 de 28: Subquery na pr�tica - Aplica��o com o FROM

-- Exemplo: Retornar a quantidade total de produtos da marca Contoso.

SELECT 
	COUNT(*) as 'N� Produtos Contoso'
FROM DimProduct
WHERE BrandName = 'Contoso';


-- nesse caso, obrigatoriamente, teremos que nomear a tabela criada pela subquery com algum nome
SELECT
	COUNT(*) as 'N� Produtos Contoso'
FROM (SELECT * FROM DimProduct WHERE BrandName = 'Contoso') AS T;

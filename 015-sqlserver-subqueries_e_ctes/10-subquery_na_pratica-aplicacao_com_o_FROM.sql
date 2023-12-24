-- [SQL Server] [Subqueries e CTE's] Aula 10 de 28: Subquery na prática - Aplicação com o FROM

-- Exemplo: Retornar a quantidade total de produtos da marca Contoso.

SELECT 
	COUNT(*) as 'Nº Produtos Contoso'
FROM DimProduct
WHERE BrandName = 'Contoso';


-- nesse caso, obrigatoriamente, teremos que nomear a tabela criada pela subquery com algum nome
SELECT
	COUNT(*) as 'Nº Produtos Contoso'
FROM (SELECT * FROM DimProduct WHERE BrandName = 'Contoso') AS T;

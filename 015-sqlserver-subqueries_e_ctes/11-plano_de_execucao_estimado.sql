-- [SQL Server] [Subqueries e CTE's] Aula 11 de 28: Plano de Execu��o Estimado

-- Exemplo: Retornar a quantidade total de produtos da marca Contoso.

-- Ao utilizar o "exibir plano de execu��o estimado" (bot�o no menu superior ou CTRL + L)
-- podemos saber qual das consultas tem menor custo de consulta , ou seja, � mais otimizado
-- podendo decidir entao qual � o melhor de ser utilizado
-- MENOR CUSTO = MELHOR OP��O

SELECT 
	COUNT(*) 
FROM DimProduct
WHERE BrandName = 'Contoso';

SELECT
	COUNT(*)
FROM (SELECT * FROM DimProduct WHERE BrandName = 'Contoso') AS T;

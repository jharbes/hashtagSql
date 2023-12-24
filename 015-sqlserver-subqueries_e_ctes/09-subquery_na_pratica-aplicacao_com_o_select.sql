-- [SQL Server] [Subqueries e CTE's] Aula 9 de 28: Subquery na pr�tica - Aplica��o com o SELECT

-- Exemplo: Retornar uma tabela com todos os produtos (ID Produto e Nome Produto) e tamb�m o total de vendas para cada produto


SELECT
	ProductKey,
	ProductName,
	(SELECT COUNT(ProductKey) FROM FactSales WHERE FactSales.ProductKey = DimProduct.ProductKey) AS 'Qtd. Vendas'
FROM
	DimProduct;



select
	FactSales.ProductKey,
	DimProduct.ProductName,
	count(FactSales.ProductKey) as 'N�mero de Vendas'
from
	FactSales
left join DimProduct on FactSales.ProductKey=DimProduct.ProductKey
group by FactSales.ProductKey, DimProduct.ProductName
order by FactSales.ProductKey;


select distinct ProductKey from FactSales
order by ProductKey;
-- [SQL Server] [Subqueries e CTE's] Aulas 7 e 8 de 28: EXISTS

-- Exemplo: Retornar uma tabela com todos os produtos (ID Produto e Nome Produto) que possuem alguma venda no dia 01/01/2007

-- 2517 - 1724 = 793

-- Conta a quantidade de Produtos
SELECT COUNT(*) FROM DimProduct;


select distinct
	DimProduct.ProductKey,
	ProductName
from
	DimProduct
left join FactSales on DimProduct.ProductKey=FactSales.ProductKey
where FactSales.DateKey='01/01/2007';



-- Retorna uma tabela com todos os produtos que possuem alguma venda
-- o exists retorna apenas se existe para aquele produto a venda, ou seja
-- funciona como um distinct retornando apenas um valor mesmo que existam 
-- varias vendas para aquele produto

SELECT
	ProductKey,
	ProductName
FROM	
	DimProduct
WHERE EXISTS(
	SELECT
		ProductKey
	FROM
		factSales
	WHERE
		DateKey = '01/01/2007'
		AND factSales.ProductKey = DimProduct.ProductKey
);


-- Solução alternativa com o ANY

SELECT
	ProductKey,
	ProductName
FROM	
	DimProduct
WHERE ProductKey = ANY(
	SELECT
		ProductKey
	FROM
		factSales
	WHERE
		DateKey = '01/01/2007'
		-- AND factSales.ProductKey = DimProduct.ProductKey
);

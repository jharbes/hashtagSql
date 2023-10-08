-- [SQL Server] Vari�veis
-- Aula 15 de 23: Armazenando em uma vari�vel um registro de uma consulta

-- Exemplo 1: Qual � o nome do produto que teve a maior quantidade vendida EM UMA �NICA VENDA da tabela FactSales?

DECLARE @varProdutoMaisVendido INT
DECLARE @varTotalMaisVendido INT


SELECT TOP(1)
	ProductKey,
	SalesQuantity
FROM
	FactSales
ORDER BY SalesQuantity DESC



-- aqui pegaremos o resultado da consulta acima e lancaremos dentro da
-- variavel que foi declarada anteriormente
SELECT TOP(1)
	@varProdutoMaisVendido = ProductKey,
	@varTotalMaisVendido = SalesQuantity
FROM
	FactSales
ORDER BY SalesQuantity DESC

PRINT @varProdutoMaisVendido
PRINT @varTotalMaisVendido

SELECT
	ProductKey,
	ProductName
FROM
	DimProduct
WHERE ProductKey = @varProdutoMaisVendido